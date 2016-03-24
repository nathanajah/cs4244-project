(defclass MODULE
    (is-a USER)
    
    (slot module-code
        (type SYMBOL))
    (slot module-name
        (type SYMBOL))
    (slot mcs
        (type INTEGER))
    (slot chain-length
        (type INTEGER))
    (slot semester
        (type INTEGER))
    (slot level
        (type INTEGER))
    (slot module-prefix
        (type SYMBOL))
    (slot is-ue
        (type SYMBOL) (default NO))
    (multislot prerequisites
        (type SYMBOL))
    (multislot preclusions
        (type SYMBOL)))

(defclass REQUIREMENTS
    (is-a USER)
    (slot level4-mcs-left
        (type INTEGER) (default 12))
    (slot team-project
        (type SYMBOL) (default NO)))

; Check all foundation modules
; If the module is not taken then choose as candidate module
(defrule foundation-check-CS1010
    (not (or (taken CS1010)
        (taken CS1101S)))
    =>
    (assert (candidate CS1010)))

(defrule foundation-check-CS1020
    (not (or 
        (and (taken CS1020)
            (taken CS2010))
        (taken CS2020)))
    =>
    (assert (candidate CS1020) (candidate CS2010)))

(defrule foundation-check
    (foundation ?module-code)
    (not (taken ?module-code))
    =>
    (assert (candidate ?module-code)))

; 12 MCS level 4k and above
(defrule breadth-and-depth
    (taken ?module-code)
    (MODULE (module-code ?module-code) (mcs ?mcs) (module-prefix CS) (level ?level&:(>= ?level 4)))
    ?requirements <- (object (is-a REQUIREMENTS))
    =>
    (bind ?requirements-mcs-left (send ?requirements get-level4-mcs-left))
    (send ?requirements put-level4-mcs-left (- ?requirements-mcs-left ?mcs)))

; Team project modules
(defrule team-project
    (or
        (and (taken CS3201) (taken CS3201))
        (and (taken CS3216) (taken CS3217))
        (and (taken CS3281) (taken CS3282))
        (and (taken CS3283) (taken CS3284)))
    ?requirements <- (object (is-a REQUIREMENTS))
    =>
    (send ?requirements put-team-project YES))

; Test
(defglobal ?*reqs* = (make-instance [reqs] of REQUIREMENTS))

(deffacts foundation-modules
    (foundation CS1231)
    (foundation CS2100)
    (foundation CS2103T)
    (foundation CS2105)
    (foundation CS2106)
    (foundation CS3230)
    (foundation IS1103)
    (foundation CS2101)
    (foundation ES2660))

(deffacts taken-modules
    (taken CS1101S)
    (taken CS1020)
    (taken CS2010)
    (taken CS1231)
    (taken CS2100)
    (taken CS2103T)
    (taken CS2105)
    (taken CS2106)
    (taken CS3230)
    (taken IS1103)
    (taken CS2101)
    (taken ES2660)
    (taken CS4123)
    (taken CS4111)
    (taken CS4222)
    (MODULE (module-code CS4123) (module-prefix CS) (level 4) (mcs 4))
    (MODULE (module-code CS4111) (module-prefix CS) (level 4) (mcs 4))
    (MODULE (module-code CS4222) (module-prefix CS) (level 4) (mcs 4)))



