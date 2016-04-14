; Test case 4 semesters
(defrule makemake
(declare (salience 10000))
=>
(make-instance of MODULE_STATUS (module-code MA1301) (status taken))
(make-instance of MODULE_STATUS (module-code CS1010) (status taken))

(make-instance of MODULE_STATUS (module-code CS1020) (status candidate))
(make-instance of MODULE_STATUS (module-code CS2010) (status candidate))
(make-instance of MODULE_STATUS (module-code CS1231) (status candidate))
(make-instance of MODULE_STATUS (module-code LSM1301) (status candidate))

(make-instance of MODULE_STATUS (module-code CM1111) (status candidate))
(make-instance of MODULE_STATUS (module-code LSM1302) (status candidate))
(make-instance of MODULE_STATUS (module-code CS2100) (status candidate))
(make-instance of MODULE_STATUS (module-code PC1221) (status candidate))
(make-instance of MODULE_STATUS (module-code CS2107) (status candidate))

(make-instance of MODULE_STATUS (module-code CS3201) (status candidate))
(make-instance of MODULE_STATUS (module-code CS3202) (status candidate))
(make-instance of MODULE_STATUS (module-code CS3216) (status candidate))
(make-instance of MODULE_STATUS (module-code CS2102) (status candidate))
(make-instance of MODULE_STATUS (module-code CS3230) (status candidate))

(make-instance of MODULE_STATUS (module-code ST2334) (status candidate))
(make-instance of MODULE_STATUS (module-code CS4218) (status candidate))
(make-instance of MODULE_STATUS (module-code CS3219) (status candidate))
(make-instance of MODULE_STATUS (module-code CS4215) (status candidate))
(make-instance of MODULE_STATUS (module-code CS4211) (status candidate))

(make-instance of MODULE_STATUS (module-code CS2103) (status candidate))

(make-instance of MODULE_STATUS (module-code CP4101) (status candidate))

(make-instance of MODULE_STATUS (module-code CP3200) (status candidate))
(make-instance of MODULE_STATUS (module-code CP3202) (status candidate))

(make-instance of MODULE_STATUS (module-code UE1) (status candidate))
(make-instance of MODULE_STATUS (module-code UE2) (status candidate))
(make-instance of MODULE_STATUS (module-code UE3) (status candidate))
(make-instance of MODULE_STATUS (module-code UE4) (status candidate))
(make-instance of MODULE_STATUS (module-code UE5) (status candidate))
(make-instance of MODULE_STATUS (module-code UE6) (status candidate))
(make-instance of MODULE_STATUS (module-code UE7) (status candidate))
(make-instance of MODULE_STATUS (module-code UE8) (status candidate))
)

 (defglobal ?*current-semester* = (make-instance [sem] of SEMESTER (max-semester-number 8)))