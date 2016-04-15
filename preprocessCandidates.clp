; Verification of user input;
(defrule init
    (declare (salience 10000))
    =>
    (make-instance [mc] of MODULE_CREDITS (credits-cleared 0)))

; FACTS
(deffacts foundation-modules
    (foundation CS1231)
    (foundation CS2100)
    (foundation CS2103T)
    (foundation CS2101)
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
    (MODULE_FOCUS (module-code CS3230) (area algorithms))
    (MODULE_FOCUS (module-code CS3236) (area algorithms))
    (MODULE_FOCUS (module-code CS4231) (area algorithms))
    (MODULE_FOCUS (module-code CS4232) (area algorithms))
    (MODULE_FOCUS (module-code CS4234) (area algorithms))
    ; Aritficial Intelligence
    (MODULE_FOCUS (module-code CS3243) (area AI))
    (MODULE_FOCUS (module-code CS3244) (area AI))
    (MODULE_FOCUS (module-code CS4244) (area AI))
    (MODULE_FOCUS (module-code CS4246) (area AI))
    ; Computer Graphics and Games
    (MODULE_FOCUS (module-code CS3241) (area graphics))
    (MODULE_FOCUS (module-code CS3242) (area graphics))
    (MODULE_FOCUS (module-code CS3247) (area graphics))
    (MODULE_FOCUS (module-code CS4247) (area graphics))
    (MODULE_FOCUS (module-code CS4350) (area graphics))
    ; Computer Security
    (MODULE_FOCUS (module-code CS2107) (area security))
    (MODULE_FOCUS (module-code CS3235) (area security))
    (MODULE_FOCUS (module-code CS4236) (area security))
    (MODULE_FOCUS (module-code CS4238) (area security))
    ; Database Systems
    (MODULE_FOCUS (module-code CS2102) (area database))
    (MODULE_FOCUS (module-code CS3223) (area database))
    (MODULE_FOCUS (module-code CS4221) (area database))
    (MODULE_FOCUS (module-code CS4224) (area database))
    ; Multimedia Information Retrieval
    (MODULE_FOCUS (module-code CS2108) (area information))
    (MODULE_FOCUS (module-code CS3245) (area information))
    (MODULE_FOCUS (module-code CS4242) (area information))
    (MODULE_FOCUS (module-code CS4248) (area information))
    ; Networking and Distributed Systems
    (MODULE_FOCUS (module-code CS2105) (area network))
    (MODULE_FOCUS (module-code CS3103) (area network))
    (MODULE_FOCUS (module-code CS4222) (area network))
    (MODULE_FOCUS (module-code CS4226) (area network))
    (MODULE_FOCUS (module-code CS4274) (area network))
    ; Parallel Computing
    (MODULE_FOCUS (module-code CS3210) (area parallel))
    (MODULE_FOCUS (module-code CS3211) (area parallel))
    (MODULE_FOCUS (module-code CS4231) (area parallel))
    (MODULE_FOCUS (module-code CS4223) (area parallel))
    ; Programming Languages
    (MODULE_FOCUS (module-code CS2104) (area language))
    (MODULE_FOCUS (module-code CS3211) (area language))
    (MODULE_FOCUS (module-code CS4215) (area language))
    (MODULE_FOCUS (module-code CS4212) (area language))
    ; Software Engineering
    (MODULE_FOCUS (module-code CS2103T) (area SE))
    (MODULE_FOCUS (module-code CS3213) (area SE))
    (MODULE_FOCUS (module-code CS3219) (area SE))
    (MODULE_FOCUS (module-code CS4211) (area SE))
    (MODULE_FOCUS (module-code CS4218) (area SE))
    )

; Check foundation modules with no alternatives
; If the module is not taken and not intended to be taken then choose as candidate module
; (defrule foundation-check
;     (declare (salience 103))
;     (foundation ?module-code)
;     ?module-status <- (object (is-a MODULE_STATUS) (module-code ?module-code) (status ~candidate&~taken))
;     =>
;     (send ?module-status put-status candidate))

(defrule foundation-add
    (declare (salience 103))
    (foundation ?module-code)
    (not (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate|taken)))
    =>
    (make-instance of MODULE_STATUS (module-code ?module-code) (status candidate)))


; Check foundation modules with alternatives
; If the modules are not taken and intended to be taken then prompt as candidate modules
; CS1010
; CS2010
; Statistics
; Physics
; Science
(defrule foundation-check-CS1010
    (declare (salience 103))
    (not
        (or
            (object (is-a MODULE_STATUS) (module-code CS1010) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code CS1101S) (status candidate|taken))
            ))
    =>
    (printout t "Missing CS1010 or CS1101S" crlf)
    (assert (ERROR (message "Missing CS1010 or CS1101S"))))

(defrule foundation-check-CS2010
    (declare (salience 103))
    (not
        (or 
            (object (is-a MODULE_STATUS) (module-code CS2020) (status candidate|taken))
            (and
                (object (is-a MODULE_STATUS) (module-code CS1020) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code CS2010) (status candidate|taken))
                )))
    =>
    (printout t "Missing (CS1020 and CS2010) or CS2020" crlf)
    (assert (ERROR (message "Missing (CS1020 and CS2010) or CS2020"))))

(defrule foundation-check-physics
    (declare (salience 103))
    (not
        (or 
            (object (is-a MODULE_STATUS) (module-code PC1221) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code PC1222) (status candidate|taken))
            ))
    =>
    (printout t "Missing PC1221 or PC1222" crlf)
    (assert (ERROR (message "Missing PC1221 or PC1222"))))

(defrule foundation-check-statistics
    (declare (salience 103))
    (not 
        (or 
            (object (is-a MODULE_STATUS) (module-code ST2334) (status candidate|taken))
            (and
                (object (is-a MODULE_STATUS) (module-code ST2131) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code ST2132) (status candidate|taken))
                )))
    =>
    (printout t "Missing ST2334 or (ST2131 and ST2132)" crlf)
    (assert (ERROR (message "Missing ST2334 or (ST2131 and ST2132)"))))

(defrule foundation-check-science
    (declare (salience 103))
    (not
        (exists
            (science ?module-code)
            (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate|taken))
            ))
    =>
    (printout t "Missing Science module" crlf)
    (assert (ERROR (message "Missing Science module"))))

(defrule foundation-check-science-1A
    (declare (salience 103))
    (not (object (is-a MODULE_STATUS) (module-code ST2334) (status candidate|taken)))
    (object (is-a MODULE_STATUS) (module-code PC1221) (status candidate|taken))
    (not (object (is-a MODULE_STATUS) (module-code PC1222) (status candidate|taken)))
    
    (not
        (exists
            (science ?module-code&~PC1221)
            (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate|taken))
            ))
    =>
    (printout t "Missing 1A Science module" crlf)
    (assert (ERROR (message "Missing 1A Science module"))))

(defrule foundation-check-science-1B
    (declare (salience 103))
    (not (object (is-a MODULE_STATUS) (module-code ST2334) (status candidate|taken)))
    (object (is-a MODULE_STATUS) (module-code PC1222) (status candidate|taken))
    (not (object (is-a MODULE_STATUS) (module-code PC1221) (status candidate|taken)))
    
    (not
        (exists
            (science ?module-code&~PC1222)
            (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate|taken))
            ))
    =>
    (printout t "Missing 1B Science module" crlf)
    (assert (ERROR (message "Missing 1B Science module"))))

(defrule foundation-check-science-1C
    (declare (salience 103))
    (object (is-a MODULE_STATUS) (module-code ST2334) (status candidate|taken))
    (object (is-a MODULE_STATUS) (module-code PC1222) (status candidate|taken))
    (object (is-a MODULE_STATUS) (module-code PC1221) (status candidate|taken))
    
    (not
        (exists
            (science ?module-code&~PC1221&~PC1222)
            (object (is-a MODULE_STATUS) (module-code ?module-code) (status candidate|taken))
            ))
    =>
    (printout t "Missing 1C Science module" crlf)
    (assert (ERROR (message "Missing 1C Science module"))))

(defrule foundation-check-science-2A
    (declare (salience 103))
    (object (is-a MODULE_STATUS) (module-code ST2334) (status candidate|taken))
    (object (is-a MODULE_STATUS) (module-code PC1221) (status candidate|taken))
    (not (object (is-a MODULE_STATUS) (module-code PC1222) (status candidate|taken)))
    
    (not
        (exists
            (science ?module-code-1&~PC1221)
            (science ?module-code-2&~?module-code-1&~PC1221)
            (object (is-a MODULE_STATUS) (module-code ?module-code-1) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code ?module-code-2) (status candidate|taken))
            ))

    =>
    (printout t "Missing 2A Science module" crlf)
    (assert (ERROR (message "Missing 2A Science module"))))

(defrule foundation-check-science-2B
    (declare (salience 103))
    (object (is-a MODULE_STATUS) (module-code ST2334) (status candidate|taken))
    (object (is-a MODULE_STATUS) (module-code PC1222) (status candidate|taken))
    (not (object (is-a MODULE_STATUS) (module-code PC1221) (status candidate|taken)))
    
    (not
        (exists
            (science ?module-code-1&~PC1222)
            (science ?module-code-2&~?module-code-1&~PC1222)
            (object (is-a MODULE_STATUS) (module-code ?module-code-1) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code ?module-code-2) (status candidate|taken))
            ))
    =>
    (printout t "Missing 2B Science module" crlf)
    (assert (ERROR (message "Missing 2B Science module"))))

; Check focus area
(defrule focus-area-check
    (declare (salience 103))
    (not
        (exists
            (MODULE_FOCUS (area ?area) (module-code ?module-code-1))
            (MODULE_FOCUS (area ?area) (module-code ?module-code-2&~?module-code-1))
            (MODULE_FOCUS (area ?area) (module-code ?module-code-3&~?module-code-1&~?module-code-2))
            (object (is-a MODULE_STATUS) (module-code ?module-code-1) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code ?module-code-2) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code ?module-code-3) (status candidate|taken))
            (object (is-a MODULE) (module-code ?module-code-1|?module-code-2|?module-code-3) (level ?level&:(>= ?level 4)))))
    =>
    (printout t "Missing Focus Area" crlf)
    (assert (ERROR (message "Missing Focus Area"))))

; Team project modules
(defrule team-project-check
    (declare (salience 103))
    (not
        (or
            (and
                (object (is-a MODULE_STATUS) (module-code CS3201) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code CS3202) (status candidate|taken)))
            (and
                (object (is-a MODULE_STATUS) (module-code CS3216) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code CS3217) (status candidate|taken)))
            (and
                (object (is-a MODULE_STATUS) (module-code CS3281) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code CS3282) (status candidate|taken)))
            (and
                (object (is-a MODULE_STATUS) (module-code CS3283) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code CS3284) (status candidate|taken)))
            ))
    =>
    (printout t "Missing Team Project" crlf)
    (assert (ERROR (message "Missing Team Project"))))

; Industry experience requirement
(defrule industry-experience-check
    (declare (salience 103))
    (not
        (or
            (and
                (object (is-a MODULE_STATUS) (module-code CP3200) (status candidate|taken))
                (object (is-a MODULE_STATUS) (module-code CP3202) (status candidate|taken)))
            (object (is-a MODULE_STATUS) (module-code CP3880) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code CP4101) (status candidate|taken))
            ))
    ; iLead or NOC?
    ; CP3200 and an Industry Course e.g. CP3101A
    =>
    (printout t "Missing Industry Experience" crlf)
    (assert (ERROR (message "Missing Industry Experience"))))

; 12 MCS level 4k and above
(defrule level-4000-check
    (declare (salience 103))
    (not
        (and
            (object (is-a MODULE_STATUS) (module-code ?module-code-1) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code ?module-code-2&~?module-code-1) (status candidate|taken))
            (object (is-a MODULE_STATUS) (module-code ?module-code-3&~?module-code-1&~?module-code-2) (status candidate|taken))
            (object (is-a MODULE) (module-code ?module-code-1) (module-prefix CS) (level ?level&:(>= ?level 4)))
            (object (is-a MODULE) (module-code ?module-code-2) (module-prefix CS) (level ?level&:(>= ?level 4)))
            (object (is-a MODULE) (module-code ?module-code-3) (module-prefix CS) (level ?level&:(>= ?level 4)))
            ))
    =>
    (printout t "Missing level-4000 CS modules" crlf)
    (assert (ERROR (message "Missing level-4000 CS modules"))))

; Preclusions check
(defrule preclusions-check
    (declare (salience 102))
    (object (is-a MODULE_STATUS) (module-code ?module-code) (status taken|candidate))
    (MODULE_PRECLUSIONS (module-code ?module-code) (preclusions $?preclusions))
    =>
    (loop-for-count (?i 1 (length$ $?preclusions))
        (bind ?preclu-module-code (nth$ ?i $?preclusions))
        (if (any-instancep ((?preclu MODULE_STATUS)) 
            (and
                (eq ?preclu:module-code ?preclu-module-code)
                (or
                    (eq ?preclu:status taken)
                    (eq ?preclu:status candidate)
                )
                (neq ?preclu-module-code ?module-code)
                ))
            then 
                (printout t (str-cat ?module-code " failed preclusion check") crlf)
                (assert (ERROR (message (str-cat ?module-code " failed preclusion check"))))
                (break)
                )))

; Prerequisites check
(defrule prerequisites-check
    (declare (salience 102))
    (object (is-a MODULE_STATUS) (module-code ?module-code) (status taken|candidate))
    (MODULE_PREREQUISITES (module-code ?module-code) (prerequisites $?prerequisites))
    =>
    (bind ?count 0)
    (loop-for-count (?i 1 (length$ $?prerequisites))
        (bind ?prereq-module-code (nth$ ?i $?prerequisites))
        (if (any-instancep ((?prereq MODULE_STATUS)) 
            (and
                (eq ?prereq:module-code ?prereq-module-code)
                (or
                    (eq ?prereq:status taken)
                    (eq ?prereq:status candidate)
                    )))
            then 
                (bind ?count (+ ?count 1))
            ))
    (if (eq ?count 0)
        then
            (printout t (str-cat ?module-code " failed prerequisites check") crlf)
            (assert (ERROR (message (str-cat ?module-code " failed prerequisites check"))))
        ))

; Adding UEs

(defrule module-credits-sum
    (declare(salience 101))
    ?module-credits <- (object (is-a MODULE_CREDITS))
    (object (is-a MODULE_STATUS) (module-code ?module-code) (status taken|candidate))
    (object (is-a MODULE) (module-code ?module-code) (mcs ?mcs))
    =>
    (send ?module-credits add-credits-cleared ?mcs))

(defrule add-ues
    (declare (salience 100))
    ?module-credits <- (object (is-a MODULE_CREDITS) (credits-cleared ?credits-cleared&:(< ?credits-cleared 160)))
    (object (is-a MODULE) (module-code ?module-code) (is-ue YES) (mcs ?mcs))
    (not (object (is-a MODULE_STATUS) (module-code ?module-code) (status taken|candidate)))
    =>
    (make-instance of MODULE_STATUS (module-code ?module-code) (status candidate))   )