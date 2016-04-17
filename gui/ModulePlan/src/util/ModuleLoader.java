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
        env.load("templates.clp");
        env.load("intializeModules.clp");
        env.run();
        List<Module> modules = new ArrayList<Module>();
        MultifieldValue mv = (MultifieldValue)env.eval("(find-all-instances ((?m MODULE)) TRUE)");
        int num = mv.size();
        for (int i = 0; i < num; i++) {
            InstanceNameValue name =  (InstanceNameValue)mv.get(i);
            InstanceAddressValue x = (InstanceAddressValue)env.eval("(instance-address " + name.instanceNameValue() + ")");
            Module module = new Module();
            String moduleCode = ((LexemeValue)x.directGetSlot("module-code")).lexemeValue();
            String moduleName = ((LexemeValue)x.directGetSlot("module-name")).lexemeValue();
            String moduleLevel = String.valueOf(((IntegerValue)x.directGetSlot("level")).intValue());
            module.setCode(moduleCode);
            module.setName(moduleName);
            module.setLevel(moduleLevel);
            modules.add(module);
        }
        return modules;

    }
}
