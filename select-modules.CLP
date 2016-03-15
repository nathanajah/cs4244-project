(defclass SEMESTER
    (is-a USER)
    (slot current-semester-number
        (type INTEGER) (default 1))
    (slot max-semester-number
        (type INTEGER) (default 0))
    (slot modules-chosen-count
        (type INTEGER) (default 0)))

; Check if current semester is valid
(defrule check-semester-number
    ?semester <- (object (is-a SEMESTER))
    (test (> (send ?semester get-current-semester-number) (send ?semester get-max-semester-number)))
    =>
    (assert (no-more-semesters)))

; Choose modules with longest chain (not UE)
(defrule select-module-longest-chain
    (declare (salience 5))
    (not (no-more-semesters))
    ?candidate <- (candidate ?module-code)
    ?module <- (MODULE (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (candidate ?other-module-code)
        (or 
            (MODULE (module-code ?other-module-code) (is-ue NO) (chain-length ?other-length&:(<= ?other-length ?length)))
            (MODULE (module-code ?other-module-code) (is-ue YES))))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 4)))
    =>
    (send ?semester put-modules-chosen-count (+ (send ?semester get-modules-chosen-count) 1))
    (assert (semester-selected ?module-code))
    (retract ?candidate))

; Choose UE module until full
(defrule select-module-ue
    (declare (salience 4))
    (not (no-more-semesters))
    ?candidate <- (candidate ?module-code)
    ?module <- (MODULE (module-code ?module-code) (is-ue YES))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 5)))
    =>
    (send ?semester put-modules-chosen-count (+ (send ?semester get-modules-chosen-count) 1))
    (assert (semester-selected ?module-code))
    (retract ?candidate))

; Fill up remaining with non-ue modules (using chain length)
(defrule select-module-fill-up
    ?candidate <- (candidate ?module-code)
    (not (no-more-semesters))
    ?module <- (MODULE (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (candidate ?other-module-code)
        (or 
            (MODULE (module-code ?other-module-code) (is-ue NO) (chain-length ?other-length&:(<= ?other-length ?length)))
            (MODULE (module-code ?other-module-code) (is-ue YES))))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 5)))
    =>
    (send ?semester put-modules-chosen-count (+ (send ?semester get-modules-chosen-count) 1))
    (assert (semester-selected ?module-code))
    (retract ?candidate))

(defrule process-current-semester
    ?semester-selected <- (semester-selected ?module-code)
    ?semester <- (object (is-a SEMESTER))
    =>
    (assert (taken ?module-code))
    (retract ?semester-selected)
    (printout t "Module taken in semester " (send ?semester get-current-semester-number) ": " ?module-code crlf))

(defrule next-semester
    (not (no-more-semesters))
    (not (semester-selected ?)) ; all selected modules previously set to taken
    ?semester <- (object (is-a SEMESTER))
    =>
    (send ?semester put-current-semester-number (+ (send ?semester get-current-semester-number) 1)) ; go to next semester
    (send ?semester put-modules-chosen-count 0))

; Test
(defglobal ?*current-semester* = (make-instance [sem] of SEMESTER (max-semester-number 2)))

(deffacts initial
    (candidate CS1)
    (candidate CS2)
    (candidate CS3)
    (candidate CS4)
    (candidate CS5)
    (candidate CS6)
    (candidate CS7)
    (candidate CS8)
    (MODULE (module-code CS1) (chain-length 4) (is-ue NO))
    (MODULE (module-code CS2) (chain-length 5) (is-ue NO))
    (MODULE (module-code CS3) (chain-length 1) (is-ue NO))
    (MODULE (module-code CS4) (chain-length 1) (is-ue NO))
    (MODULE (module-code CS5) (chain-length 2) (is-ue NO))
    (MODULE (module-code CS6) (chain-length 2) (is-ue NO))
    (MODULE (module-code CS7) (chain-length 1) (is-ue YES))
    (MODULE (module-code CS8) (chain-length 1) (is-ue YES)))

