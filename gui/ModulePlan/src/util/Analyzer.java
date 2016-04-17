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
    public Map<Module, Integer> analyze(List<Module> taken, List<Module> future, List<Module> available, int semesters) throws PreprocessException {
        Environment env = new Environment();
        env.load("templates.clp");
        env.reset();
        env.load("intializeModules.clp");

        env.load("preprocessCandidates.clp");
        env.reset();
        for (Module module : taken) {
            env.makeInstance("([" + module.getCode() + "_STATUS] of MODULE_STATUS (module-code " + module.getCode() + ") (status taken))");
        }
        for (Module module : future) {
            env.makeInstance("([" + module.getCode() + "_STATUS] of MODULE_STATUS (module-code " + module.getCode() + ") (status candidate))");
        }
        env.makeInstance("([sem] of SEMESTER (max-semester-number " + semesters + "))");
        env.run();
        MultifieldValue mv = (MultifieldValue)env.eval("(find-all-facts((?f ERROR)) TRUE)");
        int num = mv.size();
        if (num > 0) {
            String[] messages = new String[num];
            for (int i = 0; i < num; i++) {
                FactAddressValue f = (FactAddressValue) mv.get(i);
                try {
                    messages[i] = ((LexemeValue)f.getFactSlot("message")).lexemeValue();
                } catch (Exception e) {
                }
            }
            throw new PreprocessException(messages);
        }

        env.load("selectModules.clp");
        env.run();
        MultifieldValue mv2 = (MultifieldValue)env.eval("(find-all-facts((?f MODULE_SELECTED)) TRUE)");
        int num2 = mv2.size();
        HashMap<Module, Integer> md = new HashMap<Module, Integer>();
        HashMap<String, Integer> mdcode = new HashMap<String, Integer>();
        if (num2 != 0) {
            for (int i = 0; i < num2; i++) {
                FactAddressValue f = (FactAddressValue)mv2.get(i);
                try {
                    IntegerValue semester = (IntegerValue) f.getFactSlot("semester");
                    LexemeValue moduleCode = (LexemeValue) f.getFactSlot("module-code");
                    mdcode.put(moduleCode.lexemeValue(), semester.intValue());
                }catch (Exception e) {
                }
            }
        }
        for (Module module : future) {
            md.put(module, mdcode.get(module.getCode()));
        }
        for (Module module : available) {
            md.put(module, mdcode.get(module.getCode()));
        }

        return md;
    }
}
