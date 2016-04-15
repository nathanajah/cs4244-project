package util;

import models.Module;
import net.sf.clipsrules.jni.*;

import java.util.*;

/**
 * Created by nathanajah on 4/15/16.
 */
public class ErrorHighlighter {
    Set<String> highlightedCode;
    Environment clips;
    Map<Module, ArrayList<String> > prerequisites;
    Map<Module, ArrayList<String>> preclusions;
    Set<String> scienceModules;


    public ErrorHighlighter() {
        highlightedCode = new HashSet<String>();
        clips = new Environment();
        String[] scienceModulesArray = { "CM1121",
            "CM1131", "CM1417", "LSM1301",
            "LSM1302", "PC1141", "PC1142",
            "PC1143", "PC1144", "PC1221",
            "PC1222", "PC1432", "MA2213",
            "MA2214", "CM1101", "CM1111",
            "CM1161", "CM1191", "CM1401",
            "CM1402", "CM1501", "CM1502",
            "LSM1303", "PC1421", "PC1431",
            "PC1433", "MA1104", "MA2101",
            "MA2108", "MA2501", "ST2132",
            "ST2137"};
        scienceModules = new HashSet<String>(Arrays.asList(scienceModulesArray));
    }

    public boolean isHighlighted(String moduleCode) {
        return highlightedCode.contains(moduleCode);
    }

    void highlightScienceModules() {
        for (String scienceModule : scienceModules) {
            highlightedCode.add(scienceModule);
        }
    }

    void highlightLevel4() {
        clips = new Environment();
        clips.load("../../templates.clp");
        clips.load("../../intializeModules.clp");
        clips.reset();
        clips.run();
        MultifieldValue mv = (MultifieldValue)clips.eval("(find-all-instances ((?m MODULE)) TRUE)");
        int size = mv.size();
        for (int i = 0; i < size; i++) {
            InstanceNameValue name =  (InstanceNameValue)mv.get(i);
            InstanceAddressValue f = (InstanceAddressValue)clips.eval("(instance-address " + name.instanceNameValue() + ")");
            try {
                int level = ((IntegerValue) f.directGetSlot("level")).intValue();
                String moduleCode = ((LexemeValue) f.directGetSlot("module-code")).lexemeValue();
                String modulePrefix = ((LexemeValue) f.directGetSlot("module-prefix")).lexemeValue();
                if (level == 4 && modulePrefix.equals("CS")) {
                    highlightedCode.add(moduleCode);
                }
            } catch (Exception e) {

            }
        }
    }

    void highlightPreclusion(String moduleCode) {
        clips = new Environment();
        clips.load("../../templates.clp");
        clips.load("../../intializeModules.clp");
        clips.reset();
        clips.run();
        MultifieldValue mv = (MultifieldValue)clips.eval("(find-all-facts ((?m MODULE_PREREQUISITES)) TRUE)");
        int size = mv.size();
        for (int i = 0; i < size; i++) {
            FactAddressValue f = (FactAddressValue)mv.get(i);
            try {
                String resultModuleCode = ((LexemeValue) f.getFactSlot("module-code")).lexemeValue();
                if (resultModuleCode.equals(moduleCode)) {
                    MultifieldValue mv2 = (MultifieldValue) f.getFactSlot("preclusions");
                    int num = mv2.size();
                    for (int j = 0; j < num; j++) {
                        LexemeValue prereq = (LexemeValue)mv2.get(j);
                        highlightedCode.add(prereq.lexemeValue());
                    }
                }
            } catch (Exception e) {

            }
        }
    }

    void highlightPrerequisite(String moduleCode) {
        clips = new Environment();
        clips.load("../../templates.clp");
        clips.load("../../intializeModules.clp");
        clips.reset();
        clips.run();
        MultifieldValue mv = (MultifieldValue)clips.eval("(find-all-facts ((?m MODULE_PREREQUISITES)) TRUE)");
        int size = mv.size();
        for (int i = 0; i < size; i++) {
            FactAddressValue f = (FactAddressValue)mv.get(i);
            try {
                String resultModuleCode = ((LexemeValue) f.getFactSlot("module-code")).lexemeValue();
                if (resultModuleCode.equals(moduleCode)) {
                    MultifieldValue mv2 = (MultifieldValue) f.getFactSlot("prerequisites");
                    int num = mv2.size();
                    for (int j = 0; j < num; j++) {
                        LexemeValue prereq = (LexemeValue)mv2.get(j);
                        highlightedCode.add(prereq.lexemeValue());
                    }
                }
            } catch (Exception e) {

            }
        }
    }

    public void setHighlight(String error) {
        highlightedCode.clear();
        if (error == null) {
            return;
        }
        if (error.equals("Missing CS1010 or CS1101S")) {
            highlightedCode.add("CS1010");
            highlightedCode.add("CS1101S");
        } else if (error.equals("Missing (CS1020 and CS2010) or CS2020")){
            highlightedCode.add("CS1020");
            highlightedCode.add("CS2010");
            highlightedCode.add("CS2020");
        } else if (error.equals("Missing PC1221 or PC1222")) {
            highlightedCode.add("PC1221");
            highlightedCode.add("PC1222");
        } else if (error.equals("Missing ST2334 or (ST2131 and ST2132)")) {
            highlightedCode.add("ST2334");
            highlightedCode.add("ST2131");
            highlightedCode.add("ST2132");
        } else if (error.equals("Missing Science module")) {
            highlightScienceModules();
        } else if (error.equals("Missing 1A Science module")) {
            highlightScienceModules();
        } else if (error.equals("Missing 1B Science module")) {
            highlightScienceModules();
        } else if (error.equals("Missing 1C Science module")) {
            highlightScienceModules();
        } else if (error.equals("Missing 2A Science module")) {
            highlightScienceModules();
        } else if (error.equals("Missing 2B Science module")) {
            highlightScienceModules();
        } else if (error.equals("Missing Focus Area")) {
            //do nothing
        } else if (error.equals("Missing level-4000 CS modules")) {
            highlightLevel4();
        } else if (error.equals("Missing Team Project")) {
            highlightedCode.add("CS3201");
            highlightedCode.add("CS3202");
            highlightedCode.add("CS3216");
            highlightedCode.add("CS3217");
            highlightedCode.add("CS3281");
            highlightedCode.add("CS3282");
            highlightedCode.add("CS3283");
            highlightedCode.add("CS3284");
        } else if (error.equals("Missing Industry Experience")) {
            highlightedCode.add("CP3200");
            highlightedCode.add("CP3202");
            highlightedCode.add("CP3880");
            highlightedCode.add("CP4101");
        } else {
            String[] tmp = error.split(" ");
            if (tmp[2].equals("prerequisites")) {
                highlightPrerequisite(tmp[0]);
            } else {
                highlightPreclusion(tmp[0]);
            }
        }

    }

}
