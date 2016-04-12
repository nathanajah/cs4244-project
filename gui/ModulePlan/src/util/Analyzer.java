package util;

import models.Module;
import net.sf.clipsrules.jni.*;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by nathanajah on 4/11/16.
 */
public class Analyzer implements IAnalyzer {
    @Override
    public Map<Module, Integer> analyze(List<Module> taken, List<Module> future, int semesters) {
        Environment env = new Environment();
        env.load("../../Templates.clp");
        env.load("../../test.clp");

        env.load("../../preprocess-candidates.CLP");
        env.reset();
        for (Module module : taken) {
            env.makeInstance("(of MODULE_STATUS (module-code " + module.getCode() + ") (status taken))");
        }
        for (Module module : future) {
            env.makeInstance("(of MODULE_STATUS (module-code " + module.getCode() + ") (status candidate))");
        }
        env.run();
        MultifieldValue mv = (MultifieldValue)env.eval("(find-all-facts((?f error)) TRUE)");
        int num = mv.size();

        env.load("../../SelectModules.CLP");
        for (Module module : taken) {
            env.makeInstance("(of MODULE_STATUS (module-code " + module.getCode() + ") (status taken))");
        }
        for (Module module : future) {
            env.makeInstance("(of MODULE_STATUS (module-code " + module.getCode() + ") (status candidate))");
        }
        env.makeInstance("([sem] of SEMESTER (max-semester-number 3))");
        env.run();
        MultifieldValue mv2 = (MultifieldValue)env.eval("(find-all-facts((?f MODULE_SELECTED)) TRUE)");
        int num2 = mv2.size();
        HashMap<Module, Integer> md = new HashMap<Module, Integer>();
        HashMap<String, Integer> mdcode = new HashMap<String, Integer>();
        env.eval("(facts)");
        env.eval("(instances)");
        System.out.println(num2);
        if (num2 != 0) {
            for (int i = 0; i < num2; i++) {
                FactAddressValue f = (FactAddressValue)mv2.get(i);
                try {
                    IntegerValue semester = (IntegerValue) f.getFactSlot("semester");
                    LexemeValue moduleCode = (LexemeValue) f.getFactSlot("module-code");
                    System.out.println(semester);
                    System.out.println(moduleCode);
                    mdcode.put(moduleCode.lexemeValue(), semester.intValue());
                }catch (Exception e) {
                }
            }
        }
        for (Module module : future) {
            md.put(module, mdcode.get(module.getCode()));
        }

        return md;
    }
}
