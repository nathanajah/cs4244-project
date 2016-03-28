; Check modules that have no prereqs
(defrule check-module-no-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites NO) (status candidate))
    (not (MODULE_PREREQUISITES (module-code ?module-code)))
    =>
    (send ?module-status put-fulfilled-prerequisites YES))

; Check modules that have fulfilled prereqs
(defrule check-module-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites NO) (status candidate))
    (MODULE_PREREQUISITES (module-code ?module-code) (prerequisites $?prerequisites))
    =>
    (bind ?count 0)
    (loop-for-count (?i 1 (length$ $?prerequisites))
        (bind ?prereq-module-code (nth$ ?i $?prerequisites))
        (if (any-instancep ((?prereq MODULE_STATUS)) 
            (and (eq ?prereq:module-code ?prereq-module-code) 
            (eq ?prereq:status taken))) then 
                (bind ?count (+ ?count 1))))
    (if (eq ?count (length$ $?prerequisites)) then
        (send ?module-status put-fulfilled-prerequisites YES)))

; Reset timetable and examtime check everytime new module is added
(defrule add-module-to-timetable
    (declare (salience 20))
    ?selected <- (add-module ?module-code $?timings)
    ?semester <- (object (is-a SEMESTER) (current-semester-number ?current-semester-number))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code))
    (EXAM_TIME_SLOT (module-code ?module-code) (semester ?current-semester-number) (exam-time ?exam-time))
    =>
    (retract ?selected)
    (send ?semester add-to-timetable $?timings)
    (send ?semester add-to-exam-times ?exam-time)
    (send ?semester add-modules-chosen 1)
    (assert (semester-selected ?module-code))
    (send ?module-status put-status taken)
    (do-for-all-instances ((?module-status MODULE_STATUS))
        (eq ?module-status:status candidate)
        (send ?module-status put-fulfilled-timetable NO)
        (send ?module-status put-fulfilled-exam-time NO)))

; Check modules that have no timetable
(defrule check-module-no-timetable
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-timetable NO) (status candidate))
    (not (TIMETABLE_SLOT (module-code ?module-code)))
    =>
    (send ?module-status put-fulfilled-timetable YES))

; Check module timetable
(defrule check-module-timetable
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-timetable NO) (status candidate))
    (TIMETABLE_SLOT (module-code ?module-code) (timings $?module-timings))
    ?semester <- (object (is-a SEMESTER))
    (test (send ?semester check-timetable-free $?module-timings))
    =>
    (send ?module-status put-fulfilled-timetable YES))

; Check modules that have no exam time
(defrule check-module-exam-time
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-exam-time NO) (status candidate))
    ?semester <- (object (is-a SEMESTER) (current-semester-number ?current-semester-number))
    (EXAM_TIME_SLOT (module-code ?module-code) (semester ?current-semester-number) (exam-time ?exam-time))
    (test (send ?semester check-exam-times-free ?exam-time))
    =>
    (send ?module-status put-fulfilled-exam-time YES))

; Check modules can be applied to current semester
(defrule reset-module-semester
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate))
    =>
    (send ?module-status put-fulfilled-semester NO))

(defrule check-module-semester
    (declare (salience 10))
    (object (is-a SEMESTER) (semester ?semester))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate))
    (object (is-a MODULE) (module-code ?module-code) (semesters $? ?semester $?))
    =>
    (send ?module-status put-fulfilled-semester YES))

; Choose modules with longest chain (not UE)
(defrule select-module-longest-chain
    (declare (salience 5))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 4)))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (status candidate))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (object (is-a MODULE_STATUS) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (module-code ?other-module-code) (status candidate))
        (or 
            (object (is-a MODULE) (module-code ?other-module-code) (chain-length ?other-length&:(<= ?other-length ?length)) (is-ue NO))
            (object (is-a MODULE) (module-code ?other-module-code) (is-ue YES))))
    (TIMETABLE_SLOT (module-code ?module-code) (timings $?timings))
    =>
    (assert (add-module ?module-code $?timings)))

; Choose UE module until full
(defrule select-module-ue
    (declare (salience 4))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 5)))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-exam-time YES) (status candidate) (fulfilled-semester YES))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (is-ue YES))
    =>
    (assert (add-module ?module-code)))

; Fill up remaining with non-ue modules (using chain length)
(defrule select-module-fill-up
    (declare (salience 3))
    ?semester <- (object (is-a SEMESTER) (modules-chosen-count ?count&:(< ?count 5)))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (status candidate))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (object (is-a MODULE_STATUS) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (module-code ?other-module-code) (status candidate))
        (or 
            (object (is-a MODULE) (module-code ?other-module-code) (chain-length ?other-length&:(<= ?other-length ?length)) (is-ue NO))
            (object (is-a MODULE) (module-code ?other-module-code) (is-ue YES))))
    (TIMETABLE_SLOT (module-code ?module-code) (timings $?timings))
    =>
    (assert (add-module ?module-code $?timings)))

(defrule process-current-semester
    ?semester-selected <- (semester-selected ?module-code)
    ?semester <- (object (is-a SEMESTER))
    =>
    (retract ?semester-selected)
    (assert (module-selected (send ?semester get-current-semester-number) ?module-code)))

(defrule next-semester
    ?semester <- (object (is-a SEMESTER))
    (not (semester-selected ?)) ; all selected modules previously set to taken
    (test (send ?semester has-next-semester))
    =>
    (send ?semester add-semester 1) ; go to next semester
    (send ?semester reset-semester)
    (refresh check-module-prerequisites)
    (refresh reset-module-semester))