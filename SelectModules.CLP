; Check modules that have no prereqs
(defrule check-module-no-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites NO) (status candidate))
    (not (MODULE_PREREQUISITES (module-code ?module-code)))
    (object (is-a MODULE) (module-code ?module-code))
    =>
    (send ?module-status put-fulfilled-prerequisites YES))

; Check modules that have fulfilled prereqs
(defrule check-module-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites NO) (status candidate))
    (object (is-a MODULE) (module-code ?module-code))
    (MODULE_PREREQUISITES (module-code ?module-code) (prerequisites $?prerequisites))
    =>
    (loop-for-count (?i 1 (length$ $?prerequisites))
        (bind ?prereq-module-code (nth$ ?i $?prerequisites))
        (bind ?count 0)
        (if (any-instancep ((?prereq MODULE_STATUS)) 
            (and (eq ?prereq:module-code ?prereq-module-code) 
            (eq ?prereq:status taken))) then 
                (bind ?count (+ ?count 1))))

    (if (eq ?count (length$ $?prerequisites)) then
        (send ?module-status put-fulfilled-prerequisites YES)))

; Choose modules with longest chain (not UE)
(defrule select-module-longest-chain
    (declare (salience 5))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (status candidate))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (object (is-a MODULE_STATUS) (fulfilled-prerequisites YES) (module-code ?other-module-code) (status candidate))
        (or 
            (object (is-a MODULE) (module-code ?other-module-code) (chain-length ?other-length&:(<= ?other-length ?length)) (is-ue NO))
            (object (is-a MODULE) (module-code ?other-module-code) (is-ue YES))))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 4)))
    =>
    (send ?semester add-modules-chosen 1)
    (assert (semester-selected ?module-code))
    (send ?module-status put-status taken))

; Choose UE module until full
(defrule select-module-ue
    (declare (salience 4))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (status candidate))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (is-ue YES))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 5)))
    =>
    (send ?semester add-modules-chosen 1)
    (assert (semester-selected ?module-code))
    (send ?module-status put-status taken))

; Fill up remaining with non-ue modules (using chain length)
(defrule select-module-fill-up
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (status candidate))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (object (is-a MODULE_STATUS) (fulfilled-prerequisites YES) (module-code ?other-module-code) (status candidate))
        (or 
            (object (is-a MODULE) (module-code ?other-module-code) (chain-length ?other-length&:(<= ?other-length ?length)) (is-ue NO))
            (object (is-a MODULE) (module-code ?other-module-code) (is-ue YES))))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 5)))
    =>
    (send ?semester add-modules-chosen 1)
    (assert (semester-selected ?module-code))
    (send ?module-status put-status taken))

(defrule process-current-semester
    ?semester-selected <- (semester-selected ?module-code)
    ?semester <- (object (is-a SEMESTER))
    =>
    (retract ?semester-selected)
    (printout t "Module taken in semester " (send ?semester get-current-semester-number) ": " ?module-code crlf))

(defrule next-semester
    ?semester <- (object (is-a SEMESTER))
    (not (semester-selected ?)) ; all selected modules previously set to taken
    (test (send ?semester has-next-semester))
    =>
    (send ?semester add-semester 1) ; go to next semester
    (send ?semester put-modules-chosen-count 0)
    (refresh check-module-prerequisites))