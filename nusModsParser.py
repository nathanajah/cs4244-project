import json
import pprint
import re

modules = []
names = {}
MCs = {}
levels = {}
prefix = {}
prerequisites = {}
preclusions = {}
chainLengths = {}
semesters = {}
examDates = {}
timetables = {}


def isScienceModule(moduleCode):
	foundationScienceModules = 	['MA1301',
						'MA1301FC',
						'MA1301X',
						'MA1101R',
						'ST2334',
						'ST2131',
						'ST2132',
						'PC1221',
						'PC1221FC',
						'PC1221X',
						'PC1222',
						'PC1222X']
	otherScienceModulesS1 =	['CM1121',
							'CM1131',
							'CM1417',
							'LSM1301',
							'LSM1302',
							'PC1141',
							'PC1142',
							'PC1143',
							'PC1144',
							'PC1221',
							'PC1222',
							'PC1432',
							'MA2213',
							'MA2214']
	otherScienceModulesS2 =	['CM1101',
							'CM1111',
							'CM1161',
							'CM1191',
							'CM1401',
							'CM1402',
							'CM1501',
							'CM1502',
							'LSM1303',
							'PC1421',
							'PC1431',
							'PC1433',
							'MA1104',
							'MA2101',
							'MA2108',
							'MA2501',
							'ST2132',
							'ST2137']
	if (moduleCode in foundationScienceModules) or (moduleCode in otherScienceModulesS1) or (moduleCode in otherScienceModulesS2):
		return True

	return False

def isRelevantModule(mod):
	if mod['Department'] == 'Computer Science' or mod['Department'] == 'Dean\'s Office (School Of Computing)' or mod['Department'] == "Information Systems":
		return True

	if isScienceModule(mod['ModuleCode']):
		return True

	return False

def parseModuleCode(moduleCode):
	flag = True
	i = 0
	while flag and i < len(moduleCode):
		if moduleCode[i].isnumeric():
			flag = False
		else:
			i+=1

	prefix = moduleCode[:i]
	level = moduleCode[i]

	return (level, prefix)

def parsePrerequisites(prerequisites):
	prerequisites = re.sub("[().!,]","",prerequisites)
	prereqs = prerequisites.split(" ")
	deleteList = []
	for word in prereqs:
		if word not in modules and word != "and":
			deleteList.append(word)

	for word in deleteList:
		prereqs.remove(word)

	parsedPrereq = ""

	for word in prereqs:
		parsedPrereq += word
		parsedPrereq += " "
	###

	# split the prereqs by and, remove empty spaces
	deleteList = []
	splitPrereqs = parsedPrereq.split("and")
	for word in splitPrereqs:
		if len(word) < 2:
			deleteList.append(word)

	for word in deleteList:
		splitPrereqs.remove(word)

	for i in range(0, len(splitPrereqs)):
		splitPrereqs[i] = splitPrereqs[i].strip()
	###

	finalPrereq = []

	for l in splitPrereqs:
		finalPrereq.append(l.split(" "))

	# Replacing mods with all equivalent modules
	equivalentModules = [["CS1010", "CS1010E", "CS1010J", "CS1010R", "CS1010S", "CS1010X", "CS1101S"],
						["CS1020", "CS1020E", "CS2020"],
						["CS2010", "CS2020"],
						["CS2103", "CS2103T"]]

	for group in finalPrereq:
		replace = [False, False, False, False]
		deleteList = []
		for i in range(0, 4):
			for mod in group:
				if mod in equivalentModules[i]:
					deleteList.append(mod)
					replace[i] = True
		for mod in deleteList:
			try:
				group.remove(mod)
			except ValueError:
				continue
		for i in range(0, 4):
			if replace[i]:
				for mod in equivalentModules[i]:
					group.append(mod)
		group = list(set(group))
	###
	return finalPrereq

def parsePreclusions(preclusions):
	global modules
	precludes = []
	for mod in modules:
		if mod in preclusions:
			precludes.append(mod)

	return precludes

def parseHistory(history):
	semester = []
	examDate = []
	for sem in history:
		if sem['Semester'] != 1 and sem['Semester'] != 2:
			continue
		semester.append(sem['Semester'])
		try:
			exD = sem['ExamDate']
			date, time = exD.split('T', 1)
			dateSplit = date.split("-")

			if dateSplit[1] == "04":
				month = "apr"
			elif dateSplit[1] == "05":
				month = "may"
			elif dateSplit[1] == "11":
				month = "nov"
			else:
				month = "dec"

			if time[0:5] == "09:00":
				TOD = "morning"
			elif time[0:5] == "17:00":
				TOD = "evening"
			else:
				TOD = "afternoon"


			examDate.append(dateSplit[2] + "-" + month + "-" + TOD)


		except KeyError:
			examDate.append('nil')

	return (semester, examDate)

def parseModule(mod):
	global prerequisites
	global names
	global MCs
	global level
	global prefix
	global semesters
	global examDates

	# module code and name
	moduleCode = mod['ModuleCode']
	names[moduleCode] = mod["ModuleTitle"]
	MCs[moduleCode] = mod["ModuleCredit"]
	###

	# module level and prefix
	levels[moduleCode], prefix[moduleCode] = parseModuleCode(moduleCode)
	###

	# prerequisites
	try:
		prerequisites[moduleCode] = parsePrerequisites(mod['Prerequisite'])
	except (KeyError, UnicodeEncodeError):
		prerequisites[moduleCode] = []
	###

	# preclusions
	try:
		preclusions[moduleCode] = parsePreclusions(mod['Preclusion'])
	except (KeyError, UnicodeEncodeError):
		preclusions[moduleCode] = []
	###

	# semester and exam date
	semesters[moduleCode], examDates[moduleCode] = parseHistory(mod['History'])
	###

def parseTimetable(modCode, timetable):
	global timetables
	timings = []
	for slot in timetable:
		if slot['LessonType'] == "Lecture":
			day = slot['DayText']
			startTime = int(slot['StartTime'])
			endTime = int(slot['EndTime'])
			while startTime < endTime:
				curr = (startTime-800)/100
				timings.append(day + "-" + str(curr))
				startTime +=100
	timetables[modCode] = timings

def computeChainLengths():
	global chainLengths
	resolved = 0
	target = len(modules)

	while resolved < target:
		for mod in modules:
			if chainLengths.has_key(mod):
				continue
			prereq = prerequisites[mod]
			if len(prereq) == 0:
				chainLengths[mod] = 0
				resolved+=1
			else:
				try:
					maxChainLength = 0
					for pr in prereq:
						for p in pr:
							maxChainLength = max(maxChainLength, chainLengths[p])
					chainLengths[mod] = maxChainLength+1
					resolved+=1

				except KeyError:
					continue

	return

def parseModuleInfo():
	global modules
	with open('moduleInformation.json') as data_file:    
	    data = json.load(data_file)

	pp = pprint.PrettyPrinter(indent=4)

	for mod in data:
		if isRelevantModule(mod):
			modules.append(mod['ModuleCode'])

	for mod in data:
		if mod['ModuleCode'] in modules:
			parseModule(mod)

	computeChainLengths()

def parseTimetableInfo():
	global timetables
	with open('timetable_sem1.json') as data_file:    
		data = json.load(data_file)

	for mod in data:
		if (mod['ModuleCode'] in modules) and (1 in semesters[mod['ModuleCode']]):
			try:
				parseTimetable(mod['ModuleCode'], mod['Timetable'])
			except KeyError:
				timetables[mod['ModuleCode']] = []

	with open('timetable_sem2.json') as data_file:    
		data = json.load(data_file)

	for mod in data:
		if (mod['ModuleCode'] in modules) and (2 in semesters[mod['ModuleCode']]):
			try:
				parseTimetable(mod['ModuleCode'], mod['Timetable'])
			except KeyError:
				timetables[mod['ModuleCode']] = []

def writeCLIPSFile():
	clpFile = open("intializeModules.clp", "wb")
	clpFile.write("(defrule initialize-modules\n\t(declare (salience 10000))\n\t=>\n")
	for mod in modules:
		clpFile.write("\t(make-instance [" + str(mod) + "] of MODULE (module-code " + str(mod) + ") (module-name \"" + str(names[mod]) 
			+ "\") (mcs " + str(MCs[mod]) + ") (level " + str(levels[mod]) + ") (module-prefix " + str(prefix[mod]) + ") (is-ue NO) (chain-length " + str(chainLengths[mod]) + ") (semesters")
		for sem in semesters[mod]:
			clpFile.write(" " + str(sem))
		clpFile.write("))\n")

		# clpFile.write("\t(make-instance of MODULE_STATUS (module-code " + str(mod) + ") (status candidate))\n")

		if len(prerequisites[mod]) > 0:
			for prereq in prerequisites[mod]:
				clpFile.write("\t(assert (MODULE_PREREQUISITES (module-code " + str(mod) + ") (prerequisites")
				for pr in prereq:
					clpFile.write(" " + str(pr))
				clpFile.write(")))\n")

		if len(preclusions[mod]) > 0:
			clpFile.write("\t(assert (MODULE_PRECLUSIONS (module-code " + str(mod) + ") (preclusions")
			for preclude in preclusions[mod]:
				clpFile.write(" " + str(preclude))
			clpFile.write(")))\n")

		for i in range(0, len(semesters[mod])):
			clpFile.write("\t(assert (EXAM_TIME_SLOT (module-code " + str(mod) + ") (semester " + str(semesters[mod][i]) + ") (exam-time " + str(examDates[mod][i]) + ")))\n")

		if len(timetables[mod]) > 0:
			clpFile.write("\t(assert (TIMETABLE_SLOT (module-code " +str(mod) + ") (timings")
			for timing in timetables[mod]:
				clpFile.write(" " + str(timing))
			clpFile.write(")))\n")
		else:
			clpFile.write("\t(assert (TIMETABLE_SLOT (module-code " +str(mod) + ") (timings nil)))\n")

		clpFile.write("\n")

	for i in range (1, 11):
		clpFile.write("\t(make-instance [UE" + str(i) + "] of MODULE (module-code UE" + str(i) + ") (module-name UE" + str(i) + ") (mcs 4) (level 1) (module-prefix SS) (is-ue YES) (chain-length 0) semesters(1,2))\n")
		clpFile.write("\t(assert (EXAM_TIME_SLOT (module-code UE" + str(i) + ") (semester 1) (exam-time nil)))\n")
		clpFile.write("\t(assert (EXAM_TIME_SLOT (module-code UE" + str(i) + ") (semester 2) (exam-time nil)))\n")
		clpFile.write("\t(assert (TIMETABLE_SLOT (module-code UE" + str(i) + ") (timings nil)))\n\n")

	clpFile.write(")\n\n (defglobal ?*current-semester* = (make-instance [sem] of SEMESTER (max-semester-number 3)))") 

def main():
	parseModuleInfo()
	parseTimetableInfo()
	writeCLIPSFile()

main()