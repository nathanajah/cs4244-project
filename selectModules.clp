; Manually assert prerequisites for CS2101
(defrule assert-cs2101-prerequisites
    (declare (salience 50))
    (object (is-a MODULE_STATUS) (module-code CS2101) (status candidate))
    =>
    (assert (MODULE_PREREQUISITES (module-code CS2101) (prerequisites CS1020 CS1020E CS2020))))

; Force all module prereqs to be YES
(defrule initialize-fulfilled-prerequisites
    (declare (salience 50))
    =>
    (do-for-all-instances ((?module-status MODULE_STATUS))
        (eq ?module-status:status candidate)
        (send ?module-status put-fulfilled-prerequisites YES)))

; Auto take internship modules as semester 0
(defrule select-internship-CP3200
    (declare (salience 50))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code CP3200) (status candidate))
    =>
    (send ?module-status put-status taken)
    (assert (MODULE_SELECTED (semester 0) (module-code CP3200))))

(defrule select-internship-CP3202
    (declare (salience 50))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code CP3202) (status candidate))
    =>
    (send ?module-status put-status taken)
    (assert (MODULE_SELECTED (semester 0) (module-code CP3202))))

; Total up mcs for taken modules
(defrule add-taken-mcs
    (declare (salience 50))
    (object (is-a MODULE_STATUS) (module-code ?module-code) (status taken))
    (object (is-a MODULE) (module-code ?module-code) (mcs ?mcs))
    ?semester <- (object (is-a SEMESTER))
    =>
    (send ?semester add-total-mcs ?mcs))

; Check modules that have no prereqs
(defrule check-module-no-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code&~CP4101) (fulfilled-prerequisites NO) (status candidate))
    (not (MODULE_PREREQUISITES (module-code ?module-code)))
    =>
    (send ?module-status put-fulfilled-prerequisites YES))

; Check modules that have not fulfilled prereqs
(defrule check-module-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (status candidate))
    (MODULE_PREREQUISITES (module-code ?module-code) (prerequisites $?prerequisites))
    =>
    (bind ?count 0)
    (loop-for-count (?i 1 (length$ $?prerequisites))
        (bind ?prereq-module-code (nth$ ?i $?prerequisites))
        (if (any-instancep ((?prereq MODULE_STATUS))
            (and (eq ?prereq:module-code ?prereq-module-code)
            (eq ?prereq:status taken))) then
                (bind ?count (+ ?count 1))))
    (if (eq ?count 0) then
        (send ?module-status put-fulfilled-prerequisites NO)))

; Check FYP prerequisites
(defrule check-fyp-prerequisites
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code CP4101) (fulfilled-prerequisites YES) (status candidate))
    (object (is-a SEMESTER) (total-mc-count ?total-mc-count&:(< ?total-mc-count 112)))
    =>
    (send ?module-status put-fulfilled-prerequisites NO))

; Reset timetable and examtime check everytime new module is added
(defrule add-module-to-timetable
    (declare (salience 20))
    ?selected <- (add-module ?module-code $?timings)
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate))
    ?semester <- (object (is-a SEMESTER) (semester ?current-semester-number))
    (EXAM_TIME_SLOT (module-code ?module-code) (semester ?current-semester-number) (exam-time ?exam-time))
    (object (is-a MODULE) (module-code ?module-code) (mcs ?mcs))
    =>
    (retract ?selected)
    (send ?semester add-current-mcs ?mcs)
    (send ?semester add-to-timetable $?timings)
    (send ?semester add-to-exam-times ?exam-time)
    (assert (semester-selected ?module-code))
    (send ?module-status put-status taken)
    (do-for-all-instances ((?module-status MODULE_STATUS))
        (eq ?module-status:status candidate)
        (send ?module-status put-fulfilled-timetable NO)
        (send ?module-status put-fulfilled-exam-time NO)))

; Check module timetable
(defrule check-module-timetable
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-timetable NO) (status candidate))
    ?semester <- (object (is-a SEMESTER))
    (TIMETABLE_SLOT (module-code ?module-code) (timings $?module-timings))
    (test (send ?semester check-timetable-free $?module-timings))
    =>
    (send ?module-status put-fulfilled-timetable YES))

; Check modules that have no exam time
(defrule check-module-exam-time
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-exam-time NO) (status candidate))
    ?semester <- (object (is-a SEMESTER) (semester ?current-semester-number))
    (EXAM_TIME_SLOT (module-code ?module-code) (semester ?current-semester-number) (exam-time ?exam-time))
    (test (send ?semester check-exam-times-free ?exam-time))
    =>
    (send ?module-status put-fulfilled-exam-time YES))

; Check modules can be applied to current semester
(defrule reset-module-semester
    (declare (salience 11))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate))
    =>
    (send ?module-status put-fulfilled-semester NO))

(defrule check-module-semester
    (declare (salience 10))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate))
    (object (is-a SEMESTER) (semester ?semester))
    (object (is-a MODULE) (module-code ?module-code) (semesters $? ?semester $?))
    =>
    (send ?module-status put-fulfilled-semester YES))

; Check module fixed semester
(defrule check-module-fixed-semester
    (declare (salience 9))
    ?semester <- (object (is-a SEMESTER) (current-semester-number ?current-semester-number))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate) (fixed-semester ?fixed-semester))
    (test (and 
        (not (eq ?current-semester-number ?fixed-semester))
        (not (eq ?fixed-semester 0))))
    => 
    (send ?module-status put-fulfilled-semester NO))

; Modules that must be taken together
(defrule select-module-CS2103T
    (declare (salience 6))
    (semester-selected CS2103T)
    (object (is-a MODULE_STATUS) (module-code CS2101) (status candidate))
    (TIMETABLE_SLOT (module-code CS2101) (timings $?timings))
    =>
    (assert (add-module CS2101 $?timings)))

(defrule select-module-CS2101
    (declare (salience 6))
    (semester-selected CS2101)
    (object (is-a MODULE_STATUS) (module-code CS2103T) (status candidate))
    (TIMETABLE_SLOT (module-code CS2103T) (timings $?timings))
    =>
    (assert (add-module CS2103T $?timings)))

(defrule select-module-CS3201
    (declare (salience 6))
    (semester-selected CS3201)
    (object (is-a MODULE_STATUS) (module-code CS3202) (status candidate))
    (TIMETABLE_SLOT (module-code CS3201) (timings $?timings))
    =>
    (assert (add-module CS3202 $?timings)))

(defrule select-module-CS3202
    (declare (salience 6))
    (semester-selected CS3202)
    (object (is-a MODULE_STATUS) (module-code CS3201) (status candidate))
    (TIMETABLE_SLOT (module-code CS3201) (timings $?timings))
    =>
    (assert (add-module CS3201 $?timings)))

(defrule select-module-CS3281
    (declare (salience 6))
    (semester-selected CS3281)
    (object (is-a MODULE_STATUS) (module-code CS3282) (status candidate))
    (TIMETABLE_SLOT (module-code CS3282) (timings $?timings))
    =>
    (assert (add-module CS3282 $?timings)))

(defrule select-module-CS3282
    (declare (salience 6))
    (semester-selected CS3282)
    (object (is-a MODULE_STATUS) (module-code CS3281) (status candidate))
    (TIMETABLE_SLOT (module-code CS3281) (timings $?timings))
    =>
    (assert (add-module CS3281 $?timings)))

; Choose module that is fixed at semester
(defrule select-fixed-semester-module
    (declare (salience 5))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (status candidate) (fixed-semester ?current-semester-number))
    (object (is-a SEMESTER) (current-semester-number ?current-semester-number))
    (TIMETABLE_SLOT (module-code ?module-code) (timings $?timings))
    =>
    (assert (add-module ?module-code $?timings)))

; Choose modules with longest chain (not UE)
(defrule select-module-longest-chain
    (declare (salience 5))
    ?semester <- (object (is-a SEMESTER) (current-mc-count ?count&:(< ?count 16)))
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
    ?semester <- (object (is-a SEMESTER) (current-mc-count ?count&:(< ?count 20)))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-exam-time YES) (status candidate) (fulfilled-semester YES))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (is-ue YES))
    =>
    (assert (add-module ?module-code)))

; Fill up remaining with non-ue modules (using chain length)
(defrule select-module-fill-up
    (declare (salience 3))
    ?semester <- (object (is-a SEMESTER) (current-mc-count ?count&:(< ?count 20)))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (status candidate))
    ?module <- (object (is-a MODULE) (module-code ?module-code) (chain-length ?length) (is-ue NO))
    (forall (object (is-a MODULE_STATUS) (fulfilled-prerequisites YES) (fulfilled-timetable YES) (fulfilled-semester YES) (fulfilled-exam-time YES) (module-code ?other-module-code) (status candidate))
        (or
            (object (is-a MODULE) (module-code ?other-module-code) (chain-length ?other-length&:(<= ?other-length ?length)) (is-ue NO))
            (object (is-a MODULE) (module-code ?other-module-code) (is-ue YES))))
    (TIMETABLE_SLOT (module-code ?module-code) (timings $?timings))
    =>
    (assert (add-module ?module-code $?timings)))

(defrule fixed-semester-error
    (declare (salience 1))
    ?semester <- (object (is-a SEMESTER) (current-semester-number ?current-semester-number))
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate) (fixed-semester ?current-semester-number))
    (not (semester-selected ?module-code))
    =>
    (bind ?error (str-cat "Cannot fix " ?module-code " at semester " ?current-semester-number ": "))
    (if (eq (send ?module-status get-fulfilled-semester) NO) then (assert (error (str-cat ?error "not available in semester"))))
    (if (eq (send ?module-status get-fulfilled-prerequisites) NO) then (assert (error (str-cat ?error "prerequisites not fulfilled"))))
    )

(defrule process-current-semester
    ?semester-selected <- (semester-selected ?module-code)
    ?semester <- (object (is-a SEMESTER))
    =>
    (retract ?semester-selected)
    (assert (MODULE_SELECTED (semester (send ?semester get-current-semester-number)) (module-code ?module-code))))

(defrule next-semester
    ?semester <- (object (is-a SEMESTER))
    (not (semester-selected ?)) ; all selected modules previously set to taken
    (test (send ?semester has-next-semester))
    =>
    (send ?semester add-semester 1) ; go to next semester
    (send ?semester reset-semester)
    ; Set all prerequisites to be fulfilled
    (do-for-all-instances ((?module-status MODULE_STATUS))
        (eq ?module-status:status candidate)
        (send ?module-status put-fulfilled-prerequisites YES))
    (refresh check-module-prerequisites)
    (refresh reset-module-semester))

; Error message for modules that cannot be put into timetable
(defrule remaining-modules-error
    ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate))
    =>
    (bind ?error (str-cat ?module-code " could not fit into plan: "))
    (if (eq (send ?module-status get-fulfilled-semester) NO) then 
        (assert (error (str-cat ?error "not available in semester"))))
    (if (eq (send ?module-status get-fulfilled-prerequisites) NO) then 
        (assert (error (str-cat ?error "prerequisites not fulfilled"))))
    (if (eq (send ?module-status get-fulfilled-timetable) NO) then 
        (assert (error (str-cat ?error "could not put into timetable"))))
    (if (eq (send ?module-status get-fulfilled-exam-time) NO) then 
        (assert (error (str-cat ?error "exam time clash")))))
