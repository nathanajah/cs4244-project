; Verification of user input;
; TEMPLATES
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
        (type INTEGER))
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

; FACTS
(deffacts foundation-modules
    (foundation CS1231)
    (foundation CS2100)
    (foundation CS2103T)
    (foundation CS2105)
    (foundation CS2106)
    (foundation CS3230)
    (foundation IS1103)
    (foundation CS2101)
    (foundation ES2660)
    (foundation MA1301)
    (foundation MA1521)
    (foundation MA1101R))

(deffacts science-modules
    (science CM1121)
    (science CM1131)
    (science CM1417)
    (science LSM1301)
    (science LSM1302)
    (science PC1141)
    (science PC1142)
    (science PC1143)
    (science PC1144)
    (science PC1221) ; NOTE: PC12221 or PC1222 is foundation
    (science PC1222)
    (science PC1432)
    (science MA2213)
    (science MA2214)
    (science CM1101)
    (science CM1111)
    (science CM1161)
    (science CM1191)
    (science CM1401)
    (science CM1402)
    (science CM1501)
    (science CM1502)
    (science LSM1303)
    (science PC1421)
    (science PC1431)
    (science PC1433)
    (science MA1104)
    (science MA2101)
    (science MA2108)
    (science MA2501)
    (science ST2132)
    (science ST2137))

(deffacts focus-area-modules
    ; Algorithms and Theory
    (focus-algorithms CS3230)
    (focus-algorithms CS3236)
    (focus-algorithms CS4231)
    (focus-algorithms CS4232)
    (focus-algorithms CS4234)
    ; Aritficial Intelligence
    (focus-AI CS3243)
    (focus-AI CS3244)
    (focus-AI CS4244)
    (focus-AI CS4246)
    ; Computer Graphics and Games
    (focus-graphics CS3241)
    (focus-graphics CS3242)
    (focus-graphics CS3247)
    (focus-graphics CS4247)
    (focus-graphics CS4350)
    ; Computer Security
    (focus-security CS2107)
    (focus-security CS3235)
    (focus-security CS4236)
    (focus-security CS4238)
    ; Database Systems
    (focus-database CS2102)
    (focus-database CS3223)
    (focus-database CS4221)
    (focus-database CS4224)
    ; Multimedia Information Retrieval
    (focus-information CS2108)
    (focus-information CS3245)
    (focus-information CS4242)
    (focus-information CS4248)
    ; Networking and Distributed Systems
    (focus-network CS2105)
    (focus-network CS3103)
    (focus-network CS4222)
    (focus-network CS4226)
    (focus-network CS4274)
    ; Parallel Computing
    (focus-parallel CS3210)
    (focus-parallel CS3211)
    (focus-parallel CS4231)
    (focus-parallel CS4223)
    ; Programming Languages
    (focus-language CS2104)
    (focus-language CS3211)
    (focus-language CS4215)
    (focus-language CS4212)
    ; Software Engineering
    (focus-SE CS2103T)
    (focus-SE CS3213)
    (focus-SE CS3219)
    (focus-SE CS4211)
    (focus-SE CS4218)
    )

; Check foundation modules with no alternatives
; If the module is not taken and not intended to be taken then choose as candidate module
(defrule foundation-check
    (foundation ?module-code)
    (not (taken ?module-code))
    (not (candidate ?module-code))
    =>
    (assert (candidate ?module-code)))

(defrule foundation-check-CS2010
    (or (taken CS1020)
        (candidate CS1020))
    (not (taken CS2010))
    (not (candidate CS2010))
    (not (taken CS2020))
    (not (candidate CS2020))
    =>
    (assert (candidate CS2010)))

; Check foundation modules with alternatives
; If the modules are not taken and intended to be taken then prompt as candidate modules
; CS1010
; CS2010
; Statistics
; Physics
; Science
(defrule foundation-check-CS1010
    (not
        (or (taken CS1010)
            (candidate CS1010)
            (taken CS1101S)
            (candidate CS1101S)))
    =>
    (printout t "Missing CS1010 or CS1101S" crlf))

(defrule foundation-check-CS2010
    (not
        (or (taken CS2020)
            (candidate CS2020)
            (and
                (or (taken CS1020)
                    (candidate CS1020))
                (or (taken CS2010)
                    (candidate CS2010)))))
    =>
    (printout t "Missing (CS1020 and CS2010) or CS2020" crlf))

(defrule foundation-check-physics
    (not
        (or (taken PC1221)
            (candidate PC1221)
            (taken PC1222)
            (candidate PC1222)))
    =>
    (printout t "Missing PC1221 or PC1222" crlf))

(defrule foundation-check-statistics
    (not 
        (or (taken ST2334)
            (candidate ST2334)
            (and
                (or (taken ST2131)
                    (candidate ST2131))
                (or (taken ST2132)
                    (candidate ST2132)))))    
    =>
    (printout t "Missing ST2334 or (ST2131 and ST2132)" crlf))

(defrule foundation-check-science
    (not
        (exists (science ?module-code)
            (or (taken ?module-code)
                (candidate ?module-code))))
    =>
    (printout t "Missing Science module" crlf))


(defrule foundation-check-science-1A
    (not 
        (or (taken ST2334)
            (candidate ST2334)))
    (or (taken PC1221)
        (candidate PC1221))
    (not 
        (or (taken PC1222)
            (candidate PC1222)))
    (not
        (exists (science ?module-code&~PC1221)
            (or (taken ?module-code)
                (candidate ?module-code))))
    =>
    (printout t "Missing 1A Science module" crlf))

(defrule foundation-check-science-1B
    (not 
        (or (taken ST2334)
            (candidate ST2334)))
    (or (taken PC1222)
        (candidate PC1222))
    (not 
        (or (taken PC1221)
            (candidate PC1221)))
    (not
        (exists (science ?module-code&~PC1222)
            (or (taken ?module-code)
                (candidate ?module-code))))
    =>
    (printout t "Missing 1B Science module" crlf))

(defrule foundation-check-science-1C
    (or (taken ST2334)
        (candidate ST2334))
    (or (taken PC1221)
        (candidate PC1221))
    (or (taken PC1222)
        (candidate PC1222))
    (not
        (exists (science ?module-code&~PC1221&~PC1222)
            (or (taken ?module-code)
                (candidate ?module-code))))
    =>
    (printout t "Missing 1C Science module" crlf))

(defrule foundation-check-science-2A
    (or (taken ST2334)
        (candidate ST2334))
    (or (taken PC1221)
        (candidate PC1221))
    (not 
        (or (taken PC1222)
            (candidate PC1222)))
    (not
        (exists (science ?module-code-1&~PC1221)
            (science ?module-code-2&~?module-code-1&~PC1221)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))))
    =>
    (printout t "Missing 2A Science module" crlf))

(defrule foundation-check-science-2B
    (or (taken ST2334)
        (candidate ST2334))
    (or (taken PC1222)
        (candidate PC1222))
    (not 
        (or (taken PC1221)
            (candidate PC1221)))
    (not
        (exists (science ?module-code-1&~PC1222)
            (science ?module-code-2&~?module-code-1&~PC1222)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))))
    =>
    (printout t "Missing 2B Science module" crlf))

; Check focus area
(defrule focus-area-check-algorithms
    (not
        (exists (focus-algorithms ?module-code-1)
            (focus-algorithms ?module-code-2&~?module-code-1)
            (focus-algorithms ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-algorithms" crlf))

(defrule focus-area-check-AI
    (not
        (exists (focus-AI ?module-code-1)
            (focus-AI ?module-code-2&~?module-code-1)
            (focus-AI ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-AI" crlf))

(defrule focus-area-check-graphics
    (not
        (exists (focus-graphics ?module-code-1)
            (focus-graphics ?module-code-2&~?module-code-1)
            (focus-graphics ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-graphics" crlf))

(defrule focus-area-check-security
    (not
        (exists (focus-security ?module-code-1)
            (focus-security ?module-code-2&~?module-code-1)
            (focus-security ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-security" crlf))

(defrule focus-area-check-database
    (not
        (exists (focus-database ?module-code-1)
            (focus-database ?module-code-2&~?module-code-1)
            (focus-database ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-database" crlf))

(defrule focus-area-check-information
    (not
        (exists (focus-information ?module-code-1)
            (focus-information ?module-code-2&~?module-code-1)
            (focus-information ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-information" crlf))

(defrule focus-area-check-network
    (not
        (exists (focus-network ?module-code-1)
            (focus-network ?module-code-2&~?module-code-1)
            (focus-network ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-network" crlf))

(defrule focus-area-check-parallel
    (not
        (exists (focus-parallel ?module-code-1)
            (focus-parallel ?module-code-2&~?module-code-1)
            (focus-parallel ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-parallel" crlf))

(defrule focus-area-check-language
    (not
        (exists (focus-language ?module-code-1)
            (focus-language ?module-code-2&~?module-code-1)
            (focus-language ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-language" crlf))

(defrule focus-area-check-SE
    (not
        (exists (focus-SE ?module-code-1)
            (focus-SE ?module-code-2&~?module-code-1)
            (focus-SE ?module-code-3&~?module-code-1&~?module-code-2)
            (or (taken ?module-code-1)
                (candidate ?module-code-1))
            (or (taken ?module-code-2)
                (candidate ?module-code-2))
            (or (taken ?module-code-3)
                (candidate ?module-code-3))
            (MODULE (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing focus-SE" crlf))


; 12 MCS level 4k and above
; (defrule breadth-and-depth
;     (taken ?module-code)
;     (MODULE (module-code ?module-code) (mcs ?mcs) (module-prefix CS) (level ?level&:(>= ?level 4)))
;     ?requirements <- (object (is-a REQUIREMENTS))
;     =>
;     (bind ?requirements-mcs-left (send ?requirements get-level4-mcs-left))
;     (send ?requirements put-level4-mcs-left (- ?requirements-mcs-left ?mcs)))

; Team project modules
; (defrule team-project
;     (or
;         (and (taken CS3201) (taken CS3201))
;         (and (taken CS3216) (taken CS3217))
;         (and (taken CS3281) (taken CS3282))
;         (and (taken CS3283) (taken CS3284)))
;     ?requirements <- (object (is-a REQUIREMENTS))
;     =>
;     (send ?requirements put-team-project YES))

; TESTING
(deffacts test-facts
    (MODULE (module-code CS3230) (module-name algo1) (semester sem1) (level 3))
    (MODULE (module-code CS3236) (module-name algo2) (semester sem1) (level 3))
    (MODULE (module-code CS4231) (module-name algo3) (semester sem1) (level 4))
    (MODULE (module-code CS3241) (module-name graphics1) (semester sem1) (level 3))
    (MODULE (module-code CS3242) (module-name graphics1) (semester sem1) (level 3))
    (MODULE (module-code CS3247) (module-name graphics1) (semester sem1) (level 3))
    (MODULE (module-code CS4247) (module-name graphics1) (semester sem1) (level 4))
    (MODULE (module-code CS4350) (module-name graphics1) (semester sem1) (level 4))
    )


; QUESTIONS
; Prequisites check
; Industry experience requirement
; At least 12 MCs
