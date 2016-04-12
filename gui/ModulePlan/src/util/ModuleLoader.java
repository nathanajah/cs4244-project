package util;

import models.Module;
import net.sf.clipsrules.jni.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nathanajah on 4/12/16.
 */
public class ModuleLoader implements IModuleLoader{
    @Override
    public List<Module> loadModule() {
        Environment env = new Environment();
        env.load("../../Templates.clp");
        env.load("../../intializeModules.clp");
        env.run();
        List<Module> modules = new ArrayList<Module>();
        MultifieldValue mv = (MultifieldValue)env.eval("(find-all-instances ((?m MODULE)) TRUE)");
        int num = mv.size();
        for (int i = 0; i < num; i++) {
            InstanceNameValue name =  (InstanceNameValue)mv.get(i);
            InstanceAddressValue x = (InstanceAddressValue)env.eval("(instance-address " + name.instanceNameValue() + ")");
            Module module = new Module();
            String moduleCode = ((LexemeValue)x.directGetSlot("module-code")).lexemeValue();
            module.setCode(moduleCode);
            System.out.println(moduleCode);
            module.setName("");
            String level = "";
            for (int j = 0; j < moduleCode.length(); j++) {
                if (Character.isDigit(moduleCode.charAt(j))) {
                    level = moduleCode.substring(j, j + 1);
                    break;
                }
            }
            module.setLevel(level);
            modules.add(module);
        }
        return modules;

    }
}
