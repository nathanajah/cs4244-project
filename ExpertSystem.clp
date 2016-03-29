; Template used in expert system
; NUS module template
(deftemplate MODULE
    (slot is-ue
        (type SYMBOL) (default FALSE))
    (slot module-code
        (type SYMBOL)
        (default ?NONE))
    (slot module-name
        (type SYMBOL)
        (default ?NONE))
    (slot level
        (type SYMBOL))
    (slot module-prefix
        (type SYMBOL))
    (slot mcs
        (type INTEGER)
        (default 4))
    (multislot prerequisites
        (type SYMBOL))
    (multislot preclusions
        (type SYMBOL))
    ; attributes for scheduling
    (slot chain-length
        (type INTEGER)
        (default 0))
    (multislot semester
        (type SYMBOL)
        (allowed-values sem1 sem2)
        (default ?NONE))
    (multislot lectures
        (type SYMBOL))
    (slot exam-schedule
        (type SYMBOL)))
