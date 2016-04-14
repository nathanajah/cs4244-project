(defrule initialize-modules
	(declare (salience 10000))
	=>
	(make-instance [BT5110] of MODULE (module-code BT5110) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code BT5110) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code BT5110) (timings Wednesday-10 Wednesday-11 Wednesday-6 Wednesday-7)))

	(make-instance [CM1111] of MODULE (module-code CM1111) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CM1111) (semester 1) (exam-time 27-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CM1111) (timings Tuesday-8 Tuesday-9 Wednesday-1 Friday-8 Friday-9)))

	(make-instance [CM1121] of MODULE (module-code CM1121) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CM1121) (prerequisites CM1417)))
	(assert (EXAM_TIME_SLOT (module-code CM1121) (semester 2) (exam-time 25-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CM1121) (timings Monday-2 Monday-3 Thursday-2 Thursday-3)))

	(make-instance [CM1131] of MODULE (module-code CM1131) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CM1131) (semester 1) (exam-time 24-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CM1131) (timings Monday-0 Monday-1 Wednesday-0 Thursday-0 Thursday-1)))

	(make-instance [CM1191] of MODULE (module-code CM1191) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CM1191) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CM1191) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CM1191) (timings Monday-0 Monday-1)))

	(make-instance [CM1401] of MODULE (module-code CM1401) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CM1401) (prerequisites CM1417)))
	(assert (EXAM_TIME_SLOT (module-code CM1401) (semester 1) (exam-time 24-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CM1401) (semester 2) (exam-time 05-may-morning)))
	(assert (TIMETABLE_SLOT (module-code CM1401) (timings Tuesday-2 Tuesday-3)))

	(make-instance [CM1402] of MODULE (module-code CM1402) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CM1402) (prerequisites CM1417)))
	(assert (EXAM_TIME_SLOT (module-code CM1402) (semester 2) (exam-time 04-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CM1402) (timings Wednesday-0 Wednesday-1 Friday-0 Friday-1)))

	(make-instance [CM1417] of MODULE (module-code CM1417) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CM1417) (semester 1) (exam-time 01-dec-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CM1417) (timings Monday-6 Monday-7 Thursday-6 Thursday-7)))

	(make-instance [CM1501] of MODULE (module-code CM1501) (is-ue NO) (chain-length 1) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CM1501) (prerequisites CM1417)))
	(assert (EXAM_TIME_SLOT (module-code CM1501) (semester 1) (exam-time 26-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CM1501) (timings Monday-5 Thursday-8 Thursday-9)))

	(make-instance [CM1502] of MODULE (module-code CM1502) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CM1502) (prerequisites CM1417)))
	(assert (EXAM_TIME_SLOT (module-code CM1502) (semester 2) (exam-time 29-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CM1502) (timings Monday-6 Monday-7 Wednesday-9)))

	(make-instance [CP2201] of MODULE (module-code CP2201) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CP2201) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP2201) (timings Monday-10 Monday-11 Monday-12)))

	(make-instance [CP3101A] of MODULE (module-code CP3101A) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CP3101A) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CP3101A) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3101A) (timings nil)))

	(make-instance [CP3106] of MODULE (module-code CP3106) (is-ue NO) (chain-length 4) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CP3106) (prerequisites CS2102 CS2105 CS3201 CS3281)))
	(assert (EXAM_TIME_SLOT (module-code CP3106) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3106) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3106) (timings nil)))

	(make-instance [CP3108A] of MODULE (module-code CP3108A) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP3108A) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3108A) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3108A) (timings nil)))

	(make-instance [CP3108B] of MODULE (module-code CP3108B) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP3108B) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3108B) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3108B) (timings nil)))

	(make-instance [CP3109] of MODULE (module-code CP3109) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP3109) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3109) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3109) (timings nil)))

	(make-instance [CP3200] of MODULE (module-code CP3200) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP3200) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3200) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3200) (timings nil)))

	(make-instance [CP3201] of MODULE (module-code CP3201) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CP3201) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3201) (timings Thursday-6 Thursday-7)))

	(make-instance [CP3202] of MODULE (module-code CP3202) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CP3202) (prerequisites CP3200)))
	(assert (EXAM_TIME_SLOT (module-code CP3202) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3202) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3202) (timings nil)))

	(make-instance [CP3208] of MODULE (module-code CP3208) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP3208) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3208) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3208) (timings nil)))

	(make-instance [CP3209] of MODULE (module-code CP3209) (is-ue NO) (chain-length 4) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CP3209) (prerequisites CS2309)))
	(assert (EXAM_TIME_SLOT (module-code CP3209) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3209) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3209) (timings nil)))

	(make-instance [CP3880] of MODULE (module-code CP3880) (is-ue NO) (chain-length 3) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CP3880) (prerequisites CS2103 CS2103T)))
	(assert (EXAM_TIME_SLOT (module-code CP3880) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP3880) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP3880) (timings nil)))

	(make-instance [CP4101] of MODULE (module-code CP4101) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP4101) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP4101) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP4101) (timings nil)))

	(make-instance [CP5010] of MODULE (module-code CP5010) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP5010) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP5010) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP5010) (timings nil)))

	(make-instance [CP5101] of MODULE (module-code CP5101) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP5101) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP5101) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP5101) (timings nil)))

	(make-instance [CP5102] of MODULE (module-code CP5102) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CP5102) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP5102) (timings nil)))

	(make-instance [CP6010] of MODULE (module-code CP6010) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CP6010) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CP6010) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CP6010) (timings nil)))

	(make-instance [CS1010] of MODULE (module-code CS1010) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS1010) (semester 1) (exam-time 26-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code CS1010) (semester 2) (exam-time 28-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS1010) (timings nil)))

	(make-instance [CS1010E] of MODULE (module-code CS1010E) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS1010E) (semester 1) (exam-time 24-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code CS1010E) (semester 2) (exam-time 26-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS1010E) (timings nil)))

	(make-instance [CS1010J] of MODULE (module-code CS1010J) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CS1010J) (semester 1) (exam-time 26-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS1010J) (timings Tuesday-4 Tuesday-5)))

	(make-instance [CS1010R] of MODULE (module-code CS1010R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS1010R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS1010R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS1010R) (timings nil)))

	(make-instance [CS1010S] of MODULE (module-code CS1010S) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS1010S) (semester 1) (exam-time 26-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code CS1010S) (semester 2) (exam-time 28-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS1010S) (timings Wednesday-4 Wednesday-5)))

	(make-instance [CS1010X] of MODULE (module-code CS1010X) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS1010X) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS1010X) (timings nil)))

	(make-instance [CS1020] of MODULE (module-code CS1020) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS1020) (prerequisites CS1010)))
	(assert (EXAM_TIME_SLOT (module-code CS1020) (semester 1) (exam-time 23-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code CS1020) (semester 2) (exam-time 03-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS1020) (timings nil)))

	(make-instance [CS1020E] of MODULE (module-code CS1020E) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS1020E) (prerequisites CS1010 CS1010E)))
	(assert (EXAM_TIME_SLOT (module-code CS1020E) (semester 1) (exam-time 23-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code CS1020E) (semester 2) (exam-time 03-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS1020E) (timings Tuesday-6 Tuesday-7)))

	(make-instance [CS1101S] of MODULE (module-code CS1101S) (is-ue NO) (chain-length 1) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS1101S) (prerequisites MA1301 MA1301X)))
	(assert (EXAM_TIME_SLOT (module-code CS1101S) (semester 1) (exam-time 26-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS1101S) (timings Wednesday-2 Wednesday-3 Friday-2)))

	(make-instance [CS1231] of MODULE (module-code CS1231) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS1231) (prerequisites MA1301 MA1301X)))
	(assert (EXAM_TIME_SLOT (module-code CS1231) (semester 1) (exam-time 25-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code CS1231) (semester 2) (exam-time 30-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS1231) (timings nil)))

	(make-instance [CS1231R] of MODULE (module-code CS1231R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS1231R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS1231R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS1231R) (timings nil)))

	(make-instance [CS2010] of MODULE (module-code CS2010) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2010) (prerequisites CS1020 CS1020E)))
	(assert (EXAM_TIME_SLOT (module-code CS2010) (semester 1) (exam-time 23-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code CS2010) (semester 2) (exam-time 28-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS2010) (timings Tuesday-4 Tuesday-5)))

	(make-instance [CS2010R] of MODULE (module-code CS2010R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2010R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2010R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2010R) (timings nil)))

	(make-instance [CS2020] of MODULE (module-code CS2020) (is-ue NO) (chain-length 2) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS2020) (prerequisites CS1010 CS1010S CS1101S)))
	(assert (EXAM_TIME_SLOT (module-code CS2020) (semester 2) (exam-time 25-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS2020) (timings Wednesday-2 Wednesday-3 Friday-2 Friday-3)))

	(make-instance [CS2100] of MODULE (module-code CS2100) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2100) (prerequisites CS1010)))
	(assert (EXAM_TIME_SLOT (module-code CS2100) (semester 1) (exam-time 23-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CS2100) (semester 2) (exam-time 27-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS2100) (timings Wednesday-4 Wednesday-5 Thursday-7)))

	(make-instance [CS2100R] of MODULE (module-code CS2100R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2100R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2100R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2100R) (timings nil)))

	(make-instance [CS2102] of MODULE (module-code CS2102) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2102) (prerequisites CS1020 CS1231)))
	(assert (EXAM_TIME_SLOT (module-code CS2102) (semester 1) (exam-time 28-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CS2102) (semester 2) (exam-time 28-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS2102) (timings Wednesday-6 Wednesday-7)))

	(make-instance [CS2102R] of MODULE (module-code CS2102R) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2102R) (prerequisites CS1020 CS1231)))
	(assert (EXAM_TIME_SLOT (module-code CS2102R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2102R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2102R) (timings nil)))

	(make-instance [CS2103] of MODULE (module-code CS2103) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2103) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS2103) (semester 1) (exam-time 26-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code CS2103) (semester 2) (exam-time 25-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS2103) (timings Friday-8 Friday-9)))

	(make-instance [CS2103R] of MODULE (module-code CS2103R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2103R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2103R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2103R) (timings nil)))

	(make-instance [CS2103T] of MODULE (module-code CS2103T) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2103T) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS2103T) (semester 1) (exam-time 26-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code CS2103T) (semester 2) (exam-time 25-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS2103T) (timings nil)))

	(make-instance [CS2104] of MODULE (module-code CS2104) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS2104) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS2104) (semester 1) (exam-time 25-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS2104) (timings Friday-1 Friday-2)))

	(make-instance [CS2104R] of MODULE (module-code CS2104R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2104R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2104R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2104R) (timings nil)))

	(make-instance [CS2105] of MODULE (module-code CS2105) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2105) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS2105) (semester 1) (exam-time 25-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CS2105) (semester 2) (exam-time 27-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS2105) (timings Monday-6 Monday-7)))

	(make-instance [CS2105R] of MODULE (module-code CS2105R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2105R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2105R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2105R) (timings nil)))

	(make-instance [CS2106] of MODULE (module-code CS2106) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS2106) (prerequisites CS2100)))
	(assert (EXAM_TIME_SLOT (module-code CS2106) (semester 1) (exam-time 27-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code CS2106) (semester 2) (exam-time 25-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS2106) (timings Friday-6 Friday-7)))

	(make-instance [CS2106R] of MODULE (module-code CS2106R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2106R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2106R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2106R) (timings nil)))

	(make-instance [CS2107] of MODULE (module-code CS2107) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS2107) (prerequisites CS1010)))
	(assert (EXAM_TIME_SLOT (module-code CS2107) (semester 2) (exam-time 26-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS2107) (timings Friday-4 Friday-5)))

	(make-instance [CS2108] of MODULE (module-code CS2108) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS2108) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS2108) (semester 1) (exam-time 21-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS2108) (timings Monday-2 Monday-3)))

	(make-instance [CS2220] of MODULE (module-code CS2220) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS2220) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS2220) (semester 1) (exam-time 24-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS2220) (timings Thursday-1 Thursday-2 Thursday-3)))

	(make-instance [CS2220R] of MODULE (module-code CS2220R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS2220R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS2220R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS2220R) (timings nil)))

	(make-instance [CS2309] of MODULE (module-code CS2309) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS2309) (prerequisites CS1231 CS2010)))
	(assert (EXAM_TIME_SLOT (module-code CS2309) (semester 1) (exam-time 24-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS2309) (timings Thursday-2 Thursday-3)))

	(make-instance [CS3103] of MODULE (module-code CS3103) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS3103) (prerequisites CS2105)))
	(assert (EXAM_TIME_SLOT (module-code CS3103) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3103) (timings Thursday-4 Thursday-5)))

	(make-instance [CS3201] of MODULE (module-code CS3201) (is-ue NO) (chain-length 3) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS3201) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS3201) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3201) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3201) (timings Monday-4 Monday-5)))

	(make-instance [CS3202] of MODULE (module-code CS3202) (is-ue NO) (chain-length 3) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS3202) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS3202) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3202) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3202) (timings Monday-8 Monday-9)))

	(make-instance [CS3210] of MODULE (module-code CS3210) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS3210) (prerequisites CS2100)))
	(assert (EXAM_TIME_SLOT (module-code CS3210) (semester 1) (exam-time 27-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3210) (timings Tuesday-6 Tuesday-7)))

	(make-instance [CS3211] of MODULE (module-code CS3211) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3211) (prerequisites CS2106)))
	(assert (EXAM_TIME_SLOT (module-code CS3211) (semester 2) (exam-time 25-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3211) (timings Thursday-6 Thursday-7)))

	(make-instance [CS3216] of MODULE (module-code CS3216) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS3216) (prerequisites CS2103 CS2103T)))
	(assert (EXAM_TIME_SLOT (module-code CS3216) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3216) (timings Monday-10 Monday-11)))

	(make-instance [CS3217] of MODULE (module-code CS3217) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3217) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS3217) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3217) (timings Monday-8 Monday-9 Friday-5)))

	(make-instance [CS3218] of MODULE (module-code CS3218) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3218) (prerequisites CS2108 MA1101R)))
	(assert (EXAM_TIME_SLOT (module-code CS3218) (semester 2) (exam-time 28-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS3218) (timings Friday-6 Friday-7)))

	(make-instance [CS3219] of MODULE (module-code CS3219) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS3219) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS3219) (semester 1) (exam-time 23-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3219) (timings Wednesday-6 Wednesday-7)))

	(make-instance [CS3223] of MODULE (module-code CS3223) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3223) (prerequisites CS2010 CS2102)))
	(assert (EXAM_TIME_SLOT (module-code CS3223) (semester 2) (exam-time 03-may-evening)))
	(assert (TIMETABLE_SLOT (module-code CS3223) (timings Thursday-8 Thursday-9)))

	(make-instance [CS3223R] of MODULE (module-code CS3223R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3223R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3223R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3223R) (timings nil)))

	(make-instance [CS3225] of MODULE (module-code CS3225) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3225) (prerequisites CS2010 CS2220)))
	(assert (EXAM_TIME_SLOT (module-code CS3225) (semester 2) (exam-time 25-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS3225) (timings Thursday-6 Thursday-7)))

	(make-instance [CS3226] of MODULE (module-code CS3226) (is-ue NO) (chain-length 2) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3226) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS3226) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3226) (timings Tuesday-2 Tuesday-3)))

	(make-instance [CS3230] of MODULE (module-code CS3230) (is-ue NO) (chain-length 3) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS3230) (prerequisites CS1231 CS2010)))
	(assert (EXAM_TIME_SLOT (module-code CS3230) (semester 1) (exam-time 24-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CS3230) (semester 2) (exam-time 23-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3230) (timings Wednesday-4 Wednesday-5)))

	(make-instance [CS3230R] of MODULE (module-code CS3230R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3230R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3230R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3230R) (timings nil)))

	(make-instance [CS3233] of MODULE (module-code CS3233) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3233) (prerequisites CS2010)))
	(assert (EXAM_TIME_SLOT (module-code CS3233) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3233) (timings Wednesday-9 Wednesday-10 Wednesday-11 Wednesday-12 Wednesday-13)))

	(make-instance [CS3233R] of MODULE (module-code CS3233R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3233R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3233R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3233R) (timings nil)))

	(make-instance [CS3234] of MODULE (module-code CS3234) (is-ue NO) (chain-length 2) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3234) (prerequisites CS1231)))
	(assert (EXAM_TIME_SLOT (module-code CS3234) (semester 2) (exam-time 28-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS3234) (timings Wednesday-6 Wednesday-7)))

	(make-instance [CS3234R] of MODULE (module-code CS3234R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3234R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3234R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3234R) (timings nil)))

	(make-instance [CS3235] of MODULE (module-code CS3235) (is-ue NO) (chain-length 3) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS3235) (prerequisites CS2105 CS2106 CS2107)))
	(assert (EXAM_TIME_SLOT (module-code CS3235) (semester 1) (exam-time 25-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CS3235) (semester 2) (exam-time 04-may-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3235) (timings Tuesday-6 Tuesday-7)))

	(make-instance [CS3240] of MODULE (module-code CS3240) (is-ue NO) (chain-length 2) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3240) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS3240) (semester 2) (exam-time 25-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3240) (timings Wednesday-3 Wednesday-4 Wednesday-5)))

	(make-instance [CS3241] of MODULE (module-code CS3241) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS3241) (prerequisites CS1020)))
	(assert (EXAM_TIME_SLOT (module-code CS3241) (semester 1) (exam-time 28-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code CS3241) (semester 2) (exam-time 30-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3241) (timings Thursday-2 Thursday-3)))

	(make-instance [CS3241R] of MODULE (module-code CS3241R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3241R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3241R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3241R) (timings nil)))

	(make-instance [CS3242] of MODULE (module-code CS3242) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3242) (prerequisites CS3241 MA1101R PC1221)))
	(assert (EXAM_TIME_SLOT (module-code CS3242) (semester 2) (exam-time 29-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3242) (timings Tuesday-4 Tuesday-5)))

	(make-instance [CS3243] of MODULE (module-code CS3243) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3243) (prerequisites CS1231 CS2010)))
	(assert (EXAM_TIME_SLOT (module-code CS3243) (semester 2) (exam-time 26-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS3243) (timings Monday-6 Monday-7)))

	(make-instance [CS3243R] of MODULE (module-code CS3243R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3243R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3243R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3243R) (timings nil)))

	(make-instance [CS3244] of MODULE (module-code CS3244) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS3244) (prerequisites CS2010 ST2131 ST2132 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS3244) (semester 1) (exam-time 30-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS3244) (timings Tuesday-6 Tuesday-7)))

	(make-instance [CS3244R] of MODULE (module-code CS3244R) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS3244R) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3244R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3244R) (timings nil)))

	(make-instance [CS3245] of MODULE (module-code CS3245) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3245) (prerequisites CS2010)))
	(assert (EXAM_TIME_SLOT (module-code CS3245) (semester 2) (exam-time 03-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS3245) (timings Friday-3 Friday-4)))

	(make-instance [CS3246R] of MODULE (module-code CS3246R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS3246R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3246R) (timings nil)))

	(make-instance [CS3247] of MODULE (module-code CS3247) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3247) (prerequisites CS3241 PC1221)))
	(assert (EXAM_TIME_SLOT (module-code CS3247) (semester 2) (exam-time 26-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS3247) (timings Tuesday-8 Tuesday-9)))

	(make-instance [CS3249] of MODULE (module-code CS3249) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3249) (prerequisites CS2103 CS2103T)))
	(assert (EXAM_TIME_SLOT (module-code CS3249) (semester 2) (exam-time 27-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS3249) (timings Thursday-4 Thursday-5)))

	(make-instance [CS3281] of MODULE (module-code CS3281) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3281) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS3281) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3281) (timings Monday-4 Monday-5)))

	(make-instance [CS3281R] of MODULE (module-code CS3281R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS3281R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3281R) (timings nil)))

	(make-instance [CS3282] of MODULE (module-code CS3282) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS3282) (prerequisites CS3281)))
	(assert (EXAM_TIME_SLOT (module-code CS3282) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3282) (timings Thursday-4 Thursday-5)))

	(make-instance [CS3282R] of MODULE (module-code CS3282R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS3282R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3282R) (timings nil)))

	(make-instance [CS3283] of MODULE (module-code CS3283) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS3283) (prerequisites CS2103 CS2103T CS3218 CS3240 CS3241 CS3242 CS3245 CS3247 CS3249)))
	(assert (EXAM_TIME_SLOT (module-code CS3283) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3283) (timings Thursday-8 Thursday-9)))

	(make-instance [CS3284] of MODULE (module-code CS3284) (is-ue NO) (chain-length 5) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code CS3284) (prerequisites CS3283)))
	(assert (EXAM_TIME_SLOT (module-code CS3284) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS3284) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS3284) (timings Friday-8 Friday-9)))

	(make-instance [CS4211] of MODULE (module-code CS4211) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4211) (prerequisites CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS4211) (semester 1) (exam-time 23-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4211) (timings Tuesday-10 Tuesday-11 Tuesday-12)))

	(make-instance [CS4212] of MODULE (module-code CS4212) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4212) (prerequisites CS2104)))
	(assert (EXAM_TIME_SLOT (module-code CS4212) (semester 1) (exam-time 24-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4212) (timings Thursday-10 Thursday-11 Thursday-12)))

	(make-instance [CS4215] of MODULE (module-code CS4215) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4215) (prerequisites CS2010 CS2104)))
	(assert (EXAM_TIME_SLOT (module-code CS4215) (semester 2) (exam-time 27-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4215) (timings Tuesday-2 Tuesday-3)))

	(make-instance [CS4215R] of MODULE (module-code CS4215R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4215R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4215R) (timings nil)))

	(make-instance [CS4218] of MODULE (module-code CS4218) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4218) (prerequisites CS3219)))
	(assert (EXAM_TIME_SLOT (module-code CS4218) (semester 2) (exam-time 03-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4218) (timings Tuesday-6 Tuesday-7)))

	(make-instance [CS4220] of MODULE (module-code CS4220) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4220) (prerequisites CS2220)))
	(assert (EXAM_TIME_SLOT (module-code CS4220) (semester 2) (exam-time 28-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4220) (timings Thursday-1 Thursday-2 Thursday-3)))

	(make-instance [CS4220R] of MODULE (module-code CS4220R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4220R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4220R) (timings nil)))

	(make-instance [CS4221] of MODULE (module-code CS4221) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4221) (prerequisites CS3223)))
	(assert (EXAM_TIME_SLOT (module-code CS4221) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4221) (timings Thursday-1 Thursday-2 Thursday-3)))

	(make-instance [CS4222] of MODULE (module-code CS4222) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4222) (prerequisites CS2105 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS4222) (semester 2) (exam-time 23-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4222) (timings Monday-7 Monday-8 Monday-9)))

	(make-instance [CS4223] of MODULE (module-code CS4223) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4223) (prerequisites CS2106 CS3210)))
	(assert (EXAM_TIME_SLOT (module-code CS4223) (semester 1) (exam-time 25-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4223) (timings Friday-5 Friday-6 Friday-7)))

	(make-instance [CS4223R] of MODULE (module-code CS4223R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4223R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4223R) (timings nil)))

	(make-instance [CS4224] of MODULE (module-code CS4224) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4224) (prerequisites CS3223)))
	(assert (EXAM_TIME_SLOT (module-code CS4224) (semester 1) (exam-time 23-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4224) (timings Wednesday-10 Wednesday-11 Wednesday-12)))

	(make-instance [CS4225] of MODULE (module-code CS4225) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4225) (prerequisites CS3223)))
	(assert (EXAM_TIME_SLOT (module-code CS4225) (semester 2) (exam-time 26-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4225) (timings Monday-4 Monday-5)))

	(make-instance [CS4226] of MODULE (module-code CS4226) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4226) (prerequisites CS2105 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS4226) (semester 1) (exam-time 27-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4226) (timings Friday-2 Friday-3)))

	(make-instance [CS4231] of MODULE (module-code CS4231) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4231) (prerequisites CS3210 CS3230)))
	(assert (EXAM_TIME_SLOT (module-code CS4231) (semester 2) (exam-time 25-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4231) (timings Tuesday-1 Tuesday-2 Tuesday-3)))

	(make-instance [CS4232] of MODULE (module-code CS4232) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4232) (prerequisites CS1231)))
	(assert (EXAM_TIME_SLOT (module-code CS4232) (semester 1) (exam-time 30-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4232) (timings Thursday-4 Thursday-5)))

	(make-instance [CS4232R] of MODULE (module-code CS4232R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4232R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4232R) (timings nil)))

	(make-instance [CS4234] of MODULE (module-code CS4234) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4234) (prerequisites CS3230 MA1101R)))
	(assert (EXAM_TIME_SLOT (module-code CS4234) (semester 1) (exam-time 25-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4234) (timings Tuesday-4 Tuesday-5)))

	(make-instance [CS4236] of MODULE (module-code CS4236) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4236) (prerequisites CS2107 CS3230)))
	(assert (EXAM_TIME_SLOT (module-code CS4236) (semester 1) (exam-time 25-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4236) (timings Thursday-10 Thursday-11 Thursday-12)))

	(make-instance [CS4238] of MODULE (module-code CS4238) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4238) (prerequisites CS3235)))
	(assert (EXAM_TIME_SLOT (module-code CS4238) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4238) (timings Wednesday-10 Wednesday-11)))

	(make-instance [CS4239] of MODULE (module-code CS4239) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4239) (prerequisites CS2103 CS2103T CS3235)))
	(assert (EXAM_TIME_SLOT (module-code CS4239) (semester 1) (exam-time 30-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4239) (timings Monday-4 Monday-5)))

	(make-instance [CS4242] of MODULE (module-code CS4242) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4242) (prerequisites CS2108 CS3245)))
	(assert (EXAM_TIME_SLOT (module-code CS4242) (semester 2) (exam-time 30-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4242) (timings Monday-10 Monday-11 Monday-12)))

	(make-instance [CS4243] of MODULE (module-code CS4243) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4243) (prerequisites CS1020 MA1101R ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS4243) (semester 1) (exam-time 24-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4243) (timings Monday-10 Monday-11)))

	(make-instance [CS4243R] of MODULE (module-code CS4243R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4243R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4243R) (timings nil)))

	(make-instance [CS4244] of MODULE (module-code CS4244) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4244) (prerequisites CS3243)))
	(assert (EXAM_TIME_SLOT (module-code CS4244) (semester 2) (exam-time 03-may-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4244) (timings Friday-6 Friday-7)))

	(make-instance [CS4246] of MODULE (module-code CS4246) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4246) (prerequisites CS3243 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS4246) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4246) (timings Thursday-4 Thursday-5)))

	(make-instance [CS4246R] of MODULE (module-code CS4246R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4246R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4246R) (timings nil)))

	(make-instance [CS4247] of MODULE (module-code CS4247) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4247) (prerequisites CS3241)))
	(assert (EXAM_TIME_SLOT (module-code CS4247) (semester 2) (exam-time 26-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4247) (timings Monday-2 Monday-3 Wednesday-3)))

	(make-instance [CS4248] of MODULE (module-code CS4248) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4248) (prerequisites CS3243 CS3245 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS4248) (semester 1) (exam-time 26-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code CS4248) (timings Friday-7 Friday-8 Friday-9)))

	(make-instance [CS4248R] of MODULE (module-code CS4248R) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS4248R) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4248R) (timings nil)))

	(make-instance [CS4249] of MODULE (module-code CS4249) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4249) (prerequisites CS3240)))
	(assert (EXAM_TIME_SLOT (module-code CS4249) (semester 1) (exam-time 26-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code CS4249) (timings Tuesday-1 Tuesday-2 Tuesday-3)))

	(make-instance [CS4340] of MODULE (module-code CS4340) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS4340) (prerequisites CS4243 CS4247)))
	(assert (EXAM_TIME_SLOT (module-code CS4340) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4340) (timings Wednesday-4 Wednesday-5)))

	(make-instance [CS4345] of MODULE (module-code CS4345) (is-ue NO) (chain-length 3) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4345) (prerequisites CS3241)))
	(assert (EXAM_TIME_SLOT (module-code CS4345) (semester 1) (exam-time 23-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS4345) (timings Thursday-6 Thursday-7)))

	(make-instance [CS4350] of MODULE (module-code CS4350) (is-ue NO) (chain-length 6) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS4350) (prerequisites CS3247 CS3283 CS3284)))
	(assert (EXAM_TIME_SLOT (module-code CS4350) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS4350) (timings nil)))

	(make-instance [CS5201] of MODULE (module-code CS5201) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS5201) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS5201) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5201) (timings nil)))

	(make-instance [CS5202] of MODULE (module-code CS5202) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS5202) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS5202) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5202) (timings nil)))

	(make-instance [CS5214] of MODULE (module-code CS5214) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5214) (prerequisites CS4212)))
	(assert (EXAM_TIME_SLOT (module-code CS5214) (semester 2) (exam-time 30-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS5214) (timings Friday-10 Friday-11 Friday-12)))

	(make-instance [CS5218] of MODULE (module-code CS5218) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5218) (prerequisites CS4212 CS4215)))
	(assert (EXAM_TIME_SLOT (module-code CS5218) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5218) (timings Thursday-10 Thursday-11)))

	(make-instance [CS5222] of MODULE (module-code CS5222) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5222) (prerequisites CS4223)))
	(assert (EXAM_TIME_SLOT (module-code CS5222) (semester 1) (exam-time 01-dec-morning)))
	(assert (TIMETABLE_SLOT (module-code CS5222) (timings Thursday-10 Thursday-11)))

	(make-instance [CS5223] of MODULE (module-code CS5223) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5223) (prerequisites CS3211)))
	(assert (EXAM_TIME_SLOT (module-code CS5223) (semester 1) (exam-time 28-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS5223) (timings Monday-10 Monday-11)))

	(make-instance [CS5224] of MODULE (module-code CS5224) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS5224) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5224) (timings Tuesday-10 Tuesday-11)))

	(make-instance [CS5226] of MODULE (module-code CS5226) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5226) (prerequisites CS3223)))
	(assert (EXAM_TIME_SLOT (module-code CS5226) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5226) (timings Thursday-10 Thursday-11)))

	(make-instance [CS5228] of MODULE (module-code CS5228) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5228) (prerequisites CS2102 CS3243 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS5228) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5228) (timings Tuesday-10 Tuesday-11)))

	(make-instance [CS5229] of MODULE (module-code CS5229) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5229) (prerequisites CS4226)))
	(assert (EXAM_TIME_SLOT (module-code CS5229) (semester 1) (exam-time 21-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS5229) (timings Friday-10 Friday-11)))

	(make-instance [CS5230] of MODULE (module-code CS5230) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5230) (prerequisites CS4232)))
	(assert (EXAM_TIME_SLOT (module-code CS5230) (semester 2) (exam-time 04-may-morning)))
	(assert (TIMETABLE_SLOT (module-code CS5230) (timings Tuesday-10 Tuesday-11 Tuesday-12)))

	(make-instance [CS5231] of MODULE (module-code CS5231) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5231) (prerequisites CS3235)))
	(assert (EXAM_TIME_SLOT (module-code CS5231) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5231) (timings Friday-10 Friday-11)))

	(make-instance [CS5232] of MODULE (module-code CS5232) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5232) (prerequisites CS1231 CS2103)))
	(assert (EXAM_TIME_SLOT (module-code CS5232) (semester 2) (exam-time 29-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code CS5232) (timings Monday-10 Monday-11)))

	(make-instance [CS5233] of MODULE (module-code CS5233) (is-ue NO) (chain-length 5) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5233) (prerequisites CS4231 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS5233) (semester 2) (exam-time 27-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code CS5233) (timings Wednesday-10 Wednesday-11)))

	(make-instance [CS5240] of MODULE (module-code CS5240) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5240) (prerequisites CS1020 MA1101R ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS5240) (semester 1) (exam-time 26-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code CS5240) (timings Friday-10 Friday-11 Friday-12)))

	(make-instance [CS5248] of MODULE (module-code CS5248) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5248) (prerequisites CS2106 CS4226)))
	(assert (EXAM_TIME_SLOT (module-code CS5248) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5248) (timings Wednesday-10 Wednesday-11)))

	(make-instance [CS5321] of MODULE (module-code CS5321) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5321) (prerequisites CS3235)))
	(assert (EXAM_TIME_SLOT (module-code CS5321) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5321) (timings Friday-10 Friday-11)))

	(make-instance [CS5331] of MODULE (module-code CS5331) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5331) (prerequisites CS3235)))
	(assert (EXAM_TIME_SLOT (module-code CS5331) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5331) (timings Tuesday-10 Tuesday-11)))

	(make-instance [CS5340] of MODULE (module-code CS5340) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS5340) (prerequisites CS3243 ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code CS5340) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5340) (timings Wednesday-10 Wednesday-11)))

	(make-instance [CS5342] of MODULE (module-code CS5342) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS5342) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5342) (timings Friday-10 Friday-11)))

	(make-instance [CS5344] of MODULE (module-code CS5344) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS5344) (prerequisites BT5110)))
	(assert (EXAM_TIME_SLOT (module-code CS5344) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5344) (timings Friday-10 Friday-11)))

	(make-instance [CS5345] of MODULE (module-code CS5345) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS5345) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS5345) (timings Wednesday-10 Wednesday-11)))

	(make-instance [CS6101] of MODULE (module-code CS6101) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code CS6101) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code CS6101) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6101) (timings nil)))

	(make-instance [CS6202] of MODULE (module-code CS6202) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS6202) (prerequisites CS4212)))
	(assert (EXAM_TIME_SLOT (module-code CS6202) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6202) (timings Tuesday-8 Tuesday-9 Tuesday-11)))

	(make-instance [CS6203] of MODULE (module-code CS6203) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS6203) (prerequisites CS3223)))
	(assert (EXAM_TIME_SLOT (module-code CS6203) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6203) (timings Thursday-4 Thursday-5)))

	(make-instance [CS6204] of MODULE (module-code CS6204) (is-ue NO) (chain-length 5) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS6204) (prerequisites CS5229)))
	(assert (EXAM_TIME_SLOT (module-code CS6204) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6204) (timings Friday-3 Friday-4)))

	(make-instance [CS6205] of MODULE (module-code CS6205) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CS6205) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6205) (timings Friday-5 Friday-6)))

	(make-instance [CS6210] of MODULE (module-code CS6210) (is-ue NO) (chain-length 4) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS6210) (prerequisites CS3230)))
	(assert (EXAM_TIME_SLOT (module-code CS6210) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6210) (timings Thursday-1 Thursday-2)))

	(make-instance [CS6213] of MODULE (module-code CS6213) (is-ue NO) (chain-length 5) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS6213) (prerequisites CS3211 CS4231)))
	(assert (EXAM_TIME_SLOT (module-code CS6213) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6213) (timings Wednesday-5 Wednesday-6)))

	(make-instance [CS6220] of MODULE (module-code CS6220) (is-ue NO) (chain-length 5) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS6220) (prerequisites CS5228)))
	(assert (EXAM_TIME_SLOT (module-code CS6220) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6220) (timings Friday-1 Friday-2)))

	(make-instance [CS6222] of MODULE (module-code CS6222) (is-ue NO) (chain-length 3) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code CS6222) (prerequisites CS2220)))
	(assert (EXAM_TIME_SLOT (module-code CS6222) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6222) (timings Monday-3 Monday-4)))

	(make-instance [CS6234] of MODULE (module-code CS6234) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS6234) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6234) (timings Wednesday-1 Wednesday-2)))

	(make-instance [CS6241] of MODULE (module-code CS6241) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS6241) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6241) (timings Tuesday-2 Tuesday-3)))

	(make-instance [CS6242] of MODULE (module-code CS6242) (is-ue NO) (chain-length 4) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS6242) (prerequisites CS3245)))
	(assert (EXAM_TIME_SLOT (module-code CS6242) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6242) (timings Monday-4 Monday-5)))

	(make-instance [CS6244] of MODULE (module-code CS6244) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code CS6244) (prerequisites CS1020 MA1101R)))
	(assert (EXAM_TIME_SLOT (module-code CS6244) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6244) (timings Tuesday-2 Tuesday-3)))

	(make-instance [CS6281] of MODULE (module-code CS6281) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code CS6281) (semester 1) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6281) (timings Thursday-8 Thursday-9)))

	(make-instance [CS6282] of MODULE (module-code CS6282) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code CS6282) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code CS6282) (timings Tuesday-4 Tuesday-5 Tuesday-6)))

	(make-instance [FMC1206] of MODULE (module-code FMC1206) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code FMC1206) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code FMC1206) (timings nil)))

	(make-instance [GET1031] of MODULE (module-code GET1031) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code GET1031) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code GET1031) (timings Tuesday-8 Tuesday-9)))

	(make-instance [IT1005] of MODULE (module-code IT1005) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code IT1005) (semester 1) (exam-time 30-nov-afternoon)))
	(assert (TIMETABLE_SLOT (module-code IT1005) (timings Monday-1 Monday-2 Thursday-7)))

	(make-instance [IT2001] of MODULE (module-code IT2001) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code IT2001) (prerequisites CS1010)))
	(assert (EXAM_TIME_SLOT (module-code IT2001) (semester 2) (exam-time 28-apr-evening)))
	(assert (TIMETABLE_SLOT (module-code IT2001) (timings Friday-4 Friday-5)))

	(make-instance [IT2002] of MODULE (module-code IT2002) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code IT2002) (prerequisites CS1010)))
	(assert (EXAM_TIME_SLOT (module-code IT2002) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code IT2002) (timings Friday-1 Friday-2)))

	(make-instance [LSM1301] of MODULE (module-code LSM1301) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code LSM1301) (semester 1) (exam-time 28-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code LSM1301) (semester 2) (exam-time 27-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code LSM1301) (timings Monday-4 Monday-5 Thursday-4 Thursday-5 Tuesday-6 Tuesday-7 Friday-6 Friday-7)))

	(make-instance [LSM1302] of MODULE (module-code LSM1302) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code LSM1302) (semester 2) (exam-time 29-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code LSM1302) (timings Monday-6 Monday-7 Thursday-6 Thursday-7 Tuesday-6 Tuesday-7 Friday-6 Friday-7)))

	(make-instance [LSM1303] of MODULE (module-code LSM1303) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code LSM1303) (semester 2) (exam-time 04-may-evening)))
	(assert (TIMETABLE_SLOT (module-code LSM1303) (timings Wednesday-2 Wednesday-3)))

	(make-instance [MA1101R] of MODULE (module-code MA1101R) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code MA1101R) (prerequisites MA1301 MA1301X)))
	(assert (EXAM_TIME_SLOT (module-code MA1101R) (semester 1) (exam-time 28-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code MA1101R) (semester 2) (exam-time 28-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code MA1101R) (timings Monday-8 Monday-9 Thursday-8 Thursday-9)))

	(make-instance [MA1104] of MODULE (module-code MA1104) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code MA1104) (semester 1) (exam-time 23-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code MA1104) (semester 2) (exam-time 04-may-morning)))
	(assert (TIMETABLE_SLOT (module-code MA1104) (timings Tuesday-2 Tuesday-3 Friday-2 Friday-3)))

	(make-instance [MA1301] of MODULE (module-code MA1301) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code MA1301) (semester 1) (exam-time 25-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code MA1301) (semester 2) (exam-time 05-may-morning)))
	(assert (TIMETABLE_SLOT (module-code MA1301) (timings Monday-8 Monday-9 Thursday-8 Thursday-9)))

	(make-instance [MA1301X] of MODULE (module-code MA1301X) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code MA1301X) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code MA1301X) (timings nil)))

	(make-instance [MA2101] of MODULE (module-code MA2101) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code MA2101) (prerequisites MA1101R)))
	(assert (EXAM_TIME_SLOT (module-code MA2101) (semester 1) (exam-time 01-dec-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code MA2101) (semester 2) (exam-time 28-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code MA2101) (timings Monday-6 Monday-7 Thursday-6 Thursday-7)))

	(make-instance [MA2108] of MODULE (module-code MA2108) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code MA2108) (semester 1) (exam-time 28-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code MA2108) (semester 2) (exam-time 26-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code MA2108) (timings Monday-4 Monday-5 Thursday-4 Thursday-5)))

	(make-instance [MA2213] of MODULE (module-code MA2213) (is-ue NO) (chain-length 2) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code MA2213) (prerequisites MA1101R)))
	(assert (EXAM_TIME_SLOT (module-code MA2213) (semester 1) (exam-time 30-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code MA2213) (semester 2) (exam-time 03-may-evening)))
	(assert (TIMETABLE_SLOT (module-code MA2213) (timings Tuesday-0 Tuesday-1 Friday-0 Friday-1)))

	(make-instance [MA2214] of MODULE (module-code MA2214) (is-ue NO) (chain-length 2) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code MA2214) (prerequisites CS1231 MA1101R)))
	(assert (EXAM_TIME_SLOT (module-code MA2214) (semester 1) (exam-time 02-dec-afternoon)))
	(assert (TIMETABLE_SLOT (module-code MA2214) (timings Tuesday-10 Tuesday-11 Friday-10 Friday-11)))

	(make-instance [MA2501] of MODULE (module-code MA2501) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code MA2501) (semester 1) (exam-time 26-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code MA2501) (timings Monday-1 Monday-2 Wednesday-3)))

	(make-instance [PC1141] of MODULE (module-code PC1141) (is-ue NO) (chain-length 1) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code PC1141) (prerequisites PC1221 PC1221X PC1222)))
	(assert (EXAM_TIME_SLOT (module-code PC1141) (semester 1) (exam-time 30-nov-evening)))
	(assert (TIMETABLE_SLOT (module-code PC1141) (timings Monday-8 Monday-9 Thursday-8 Thursday-9)))

	(make-instance [PC1142] of MODULE (module-code PC1142) (is-ue NO) (chain-length 1) (semesters 1))
	(assert (MODULE_PREREQUISITES (module-code PC1142) (prerequisites PC1221 PC1221X PC1222)))
	(assert (EXAM_TIME_SLOT (module-code PC1142) (semester 1) (exam-time 24-nov-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1142) (timings Monday-2 Monday-3 Thursday-2 Thursday-3)))

	(make-instance [PC1143] of MODULE (module-code PC1143) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code PC1143) (prerequisites PC1221 PC1221X PC1222 PC1222X)))
	(assert (EXAM_TIME_SLOT (module-code PC1143) (semester 2) (exam-time 03-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code PC1143) (timings Monday-2 Monday-3 Thursday-2 Thursday-3)))

	(make-instance [PC1144] of MODULE (module-code PC1144) (is-ue NO) (chain-length 1) (semesters 2))
	(assert (MODULE_PREREQUISITES (module-code PC1144) (prerequisites PC1221 PC1221X PC1222 PC1222X)))
	(assert (EXAM_TIME_SLOT (module-code PC1144) (semester 2) (exam-time 27-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1144) (timings Tuesday-8 Tuesday-9 Friday-8 Friday-9)))

	(make-instance [PC1221] of MODULE (module-code PC1221) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code PC1221) (semester 1) (exam-time 02-dec-evening)))
	(assert (EXAM_TIME_SLOT (module-code PC1221) (semester 2) (exam-time 04-may-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1221) (timings Monday-4 Monday-5 Thursday-4 Thursday-5)))

	(make-instance [PC1221X] of MODULE (module-code PC1221X) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code PC1221X) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code PC1221X) (timings nil)))

	(make-instance [PC1222] of MODULE (module-code PC1222) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code PC1222) (semester 1) (exam-time 24-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code PC1222) (semester 2) (exam-time 03-may-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1222) (timings Monday-0 Monday-1 Thursday-0 Thursday-1)))

	(make-instance [PC1222X] of MODULE (module-code PC1222X) (is-ue NO) (chain-length 0) (semesters 2))
	(assert (EXAM_TIME_SLOT (module-code PC1222X) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code PC1222X) (timings nil)))

	(make-instance [PC1421] of MODULE (module-code PC1421) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code PC1421) (semester 1) (exam-time 01-dec-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1421) (timings Monday-4 Monday-5 Thursday-4 Thursday-5)))

	(make-instance [PC1431] of MODULE (module-code PC1431) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code PC1431) (prerequisites PC1221 PC1221X PC1222)))
	(assert (EXAM_TIME_SLOT (module-code PC1431) (semester 1) (exam-time 24-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code PC1431) (semester 2) (exam-time 28-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1431) (timings Wednesday-4 Wednesday-5 Friday-9)))

	(make-instance [PC1432] of MODULE (module-code PC1432) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code PC1432) (prerequisites PC1221 PC1221X PC1222)))
	(assert (EXAM_TIME_SLOT (module-code PC1432) (semester 1) (exam-time 30-nov-morning)))
	(assert (EXAM_TIME_SLOT (module-code PC1432) (semester 2) (exam-time 29-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1432) (timings Wednesday-6 Wednesday-7 Friday-1 Tuesday-5 Thursday-4 Thursday-5)))

	(make-instance [PC1433] of MODULE (module-code PC1433) (is-ue NO) (chain-length 0) (semesters 1))
	(assert (EXAM_TIME_SLOT (module-code PC1433) (semester 1) (exam-time 02-dec-morning)))
	(assert (TIMETABLE_SLOT (module-code PC1433) (timings Tuesday-2 Tuesday-3 Friday-9)))

	(make-instance [ST2131] of MODULE (module-code ST2131) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code ST2131) (semester 1) (exam-time 24-nov-evening)))
	(assert (EXAM_TIME_SLOT (module-code ST2131) (semester 2) (exam-time 30-apr-afternoon)))
	(assert (TIMETABLE_SLOT (module-code ST2131) (timings Wednesday-4 Wednesday-5 Friday-4 Friday-5 Monday-10 Monday-11 Thursday-10 Thursday-11 Tuesday-2 Tuesday-3 Friday-2 Friday-3)))

	(make-instance [ST2132] of MODULE (module-code ST2132) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code ST2132) (prerequisites ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code ST2132) (semester 1) (exam-time 02-dec-morning)))
	(assert (EXAM_TIME_SLOT (module-code ST2132) (semester 2) (exam-time 27-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code ST2132) (timings Monday-0 Monday-1 Thursday-0 Thursday-1)))

	(make-instance [ST2137] of MODULE (module-code ST2137) (is-ue NO) (chain-length 1) (semesters 1 2))
	(assert (MODULE_PREREQUISITES (module-code ST2137) (prerequisites ST2131 ST2334)))
	(assert (EXAM_TIME_SLOT (module-code ST2137) (semester 1) (exam-time 26-nov-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code ST2137) (semester 2) (exam-time 04-may-afternoon)))
	(assert (TIMETABLE_SLOT (module-code ST2137) (timings Tuesday-6 Tuesday-7 Friday-6 Friday-7)))

	(make-instance [ST2334] of MODULE (module-code ST2334) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code ST2334) (semester 1) (exam-time 03-dec-afternoon)))
	(assert (EXAM_TIME_SLOT (module-code ST2334) (semester 2) (exam-time 25-apr-morning)))
	(assert (TIMETABLE_SLOT (module-code ST2334) (timings Monday-2 Monday-3 Thursday-2 Thursday-3)))

	(make-instance [XFC4101] of MODULE (module-code XFC4101) (is-ue NO) (chain-length 0) (semesters 1 2))
	(assert (EXAM_TIME_SLOT (module-code XFC4101) (semester 1) (exam-time nil)))
	(assert (EXAM_TIME_SLOT (module-code XFC4101) (semester 2) (exam-time nil)))
	(assert (TIMETABLE_SLOT (module-code XFC4101) (timings nil)))

)

 (defglobal ?*current-semester* = (make-instance [sem] of SEMESTER (max-semester-number 3)))