; Test case 4 semesters
(defrule makemake
=>
(make-instance of MODULE_STATUS (module-code CS1010) (status candidate))
(make-instance of MODULE_STATUS (module-code CS1020) (status candidate))
(make-instance of MODULE_STATUS (module-code CS2010) (status candidate) (fixed-semester 2))
(make-instance of MODULE_STATUS (module-code CS2100) (status candidate))
(make-instance of MODULE_STATUS (module-code LSM1301) (status candidate))
(make-instance of MODULE_STATUS (module-code CM1111) (status candidate))
(make-instance of MODULE_STATUS (module-code LSM1302) (status candidate) (fixed-semester 1))
(make-instance of MODULE_STATUS (module-code MA1301) (status candidate) (fixed-semester 2))
(make-instance of MODULE_STATUS (module-code UE1) (status candidate))
(make-instance of MODULE_STATUS (module-code UE2) (status candidate))
(make-instance of MODULE_STATUS (module-code UE3) (status candidate))
(make-instance of MODULE_STATUS (module-code UE4) (status candidate))
)