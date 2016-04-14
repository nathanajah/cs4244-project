(defclass MODULE
    (is-a USER)
    (role concrete)
    (slot module-code
        (type SYMBOL))
    (slot module-name
        (type STRING))
    (slot mcs
        (type INTEGER))
    (slot chain-length
        (type INTEGER)
        (default 0))
    (slot level
        (type INTEGER))
    (slot module-prefix
        (type SYMBOL))
    (slot is-ue
        (type SYMBOL) (default NO))
    (multislot semesters
        (type INTEGER)))

(deftemplate TIMETABLE_SLOT
    (slot module-code (type SYMBOL))
    (slot semester (type INTEGER))
    (multislot timings (type SYMBOL)))

(deftemplate EXAM_TIME_SLOT
    (slot module-code (type SYMBOL))
    (slot semester (type INTEGER))
    (slot exam-time (type SYMBOL)))

(deftemplate MODULE_PREREQUISITES
    (slot module-code (type SYMBOL))
    (multislot prerequisites (type SYMBOL)))

(deftemplate MODULE_PRECLUSIONS
    (slot module-code)
    (multislot preclusions (type SYMBOL)))

(deftemplate MODULE_FOCUS
    (slot module-code)
    (slot area))

(deftemplate ERROR
    (slot message))

(defclass MODULE_STATUS
    (is-a USER)
    (role concrete)
    (slot module-code (type SYMBOL))
    (slot fixed-semester (type INTEGER) (default 0))
    (slot fulfilled-prerequisites (type SYMBOL) (default NO))
    (slot fulfilled-semester (type SYMBOL) (default NO))
    (slot fulfilled-timetable (type SYMBOL) (default NO))
    (slot fulfilled-exam-time (type SYMBOL) (default NO))
    (slot status (type SYMBOL) (default none)))

(defclass SEMESTER
    (is-a USER)
    (slot semester
        (type INTEGER) (default 1))
    (slot current-semester-number
        (type INTEGER) (default 1))
    (slot max-semester-number
        (type INTEGER) (default 0))
    (slot total-mc-count
        (type INTEGER) (default 0))
    (slot current-mc-count
        (type INTEGER) (default 0))
    (multislot timetable
        (type SYMBOL))
    (multislot exam-times
        (type SYMBOL)))

(deftemplate MODULE_SELECTED
    (slot semester (type INTEGER))
    (slot module-code (type SYMBOL)))

(defmessage-handler SEMESTER has-next-semester()
    (< ?self:current-semester-number ?self:max-semester-number))

(defmessage-handler SEMESTER add-semester(?i)
    (bind ?self:current-semester-number (+ ?self:current-semester-number ?i))
    (bind ?self:semester (+ (mod ?self:semester 2) 1)))

(defmessage-handler SEMESTER reset-semester()
    (bind ?self:current-mc-count 0)
    (bind ?self:timetable nil)
    (bind ?self:exam-times nil))

(defmessage-handler SEMESTER add-to-timetable($?timings)
    (if (not (eq $?timings nil)) then
        (slot-insert$ ?self timetable 1 $?timings)))

(defmessage-handler SEMESTER add-to-exam-times(?timing)
    (if (not (eq ?timing nil)) then
        (slot-insert$ ?self exam-times 1 (create$ ?timing))))

(defmessage-handler SEMESTER check-timetable-free($?timings)
    (bind ?is-free TRUE)
    (loop-for-count (?i 1 (length$ $?timings))
        (bind ?timing (nth$ ?i $?timings))
        (if (subsetp (create$ ?timing) $?self:timetable) then
            (bind ?is-free FALSE))
        (if (eq ?timing nil) then (bind ?is-free TRUE)))
    return ?is-free)

(defmessage-handler SEMESTER check-exam-times-free(?timing)
    (bind ?is-free TRUE)
    (if (subsetp (create$ ?timing) $?self:exam-times) then
        (bind ?is-free FALSE))
    (if (eq ?timing nil) then (bind ?is-free TRUE))
    return ?is-free)

(defmessage-handler SEMESTER add-current-mcs(?mcs)
    (bind ?self:current-mc-count (+ ?self:current-mc-count ?mcs)))


(defmessage-handler SEMESTER add-total-mcs(?mcs)
    (bind ?self:total-mc-count (+ ?self:total-mc-count ?mcs)))
