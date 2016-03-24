(defclass MODULE
    (is-a USER)
    (role concrete)
    (slot module-code
        (type SYMBOL))
    (slot module-name
        (type SYMBOL))
    (slot mcs
        (type INTEGER))
    (slot chain-length
        (type INTEGER))
    (slot level
        (type INTEGER))
    (slot module-prefix
        (type SYMBOL))
    (slot is-ue
        (type SYMBOL) (default NO))
    (multislot semesters
        (type INTEGER))
    (multislot exam-times
        (type SYMBOL))
    (multislot lecture-times
        (type SYMBOL)))

(deftemplate TIMETABLE_SLOT
    (slot module-code (type SYMBOL))
    (multislot timings (type SYMBOL)))

(deftemplate MODULE_PREREQUISITES
    (slot module-code (type SYMBOL))
    (multislot prerequisites (type SYMBOL)))

(deftemplate MODULE_PRECLUSIONS
    (slot module-code)
    (multislot preclusions (type SYMBOL)))

(defclass MODULE_STATUS
    (is-a USER)
    (role concrete)
    (slot module-code (type SYMBOL))
    (slot fulfilled-prerequisites (type SYMBOL) (default NO))
    (slot fulfilled-semester (type SYMBOL) (default NO))
    (slot status (type SYMBOL) (default none)))

(defclass SEMESTER
    (is-a USER)
    (slot semester
        (type INTEGER) (default 1))
    (slot current-semester-number
        (type INTEGER) (default 1))
    (slot max-semester-number
        (type INTEGER) (default 0))
    (slot modules-chosen-count
        (type INTEGER) (default 0)))

(defmessage-handler SEMESTER has-next-semester()
    (< ?self:current-semester-number ?self:max-semester-number))

(defmessage-handler SEMESTER add-semester(?i)
    (bind ?self:current-semester-number (+ ?self:current-semester-number ?i))
    (bind ?self:semester (+ (mod ?self:semester 2) 1)))

(defmessage-handler SEMESTER add-modules-chosen(?i)
    (bind ?self:modules-chosen-count (+ ?self:modules-chosen-count ?i)))

(defmessage-handler SEMESTER reset-modules-chosen()
    (bind ?self:modules-chosen-count 0))
