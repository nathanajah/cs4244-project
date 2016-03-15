; Templates
(deftemplate module
    (slot status
        (type SYMBOL)
        (allowed-values cleared uncleared clearing) 
        (default uncleared))
    (slot code
        (type SYMBOL)
        (default ?NONE))
    (slot title
        (type STRING)
        (default ?NONE))
    (slot mc
        (type INTEGER)
        (default 4))
    (slot exam-schedule
        (type SYMBOL))
    (slot chain
        (type INTEGER)
        (default 0))
    (multislot prereqs
        (type SYMBOL))
    (multislot preclus
        (type SYMBOL))
    (multislot lectures
        (type SYMBOL))
    (multislot semesters
        (type SYMBOL)
        (allowed-values sem1 sem2)
        (default ?NONE)))

; Facts
(deffacts NUS-modules)

; Rules