package util;

import models.Module;
import net.sf.clipsrules.jni.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by nathanajah on 4/12/16.
 */
public class ModuleLoader implements IModuleLoader{
    @Override
    public List<Module> loadModule() {
        Environment env = new Environment();
        env.load("../../templates.clp");
        env.load("../../intializeModules.clp");
        env.run();

        Map<String, String> moduleNameMap = new HashMap<String, String>();
        try {
            File file = new File("../../timetable_sem1.json");

            JSONTokener tokener = new JSONTokener(new FileInputStream(file));
            JSONArray array = new JSONArray(tokener);
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.getJSONObject(i);
                String code = obj.getString("ModuleCode");
                String name = obj.getString("ModuleTitle");
                moduleNameMap.put(code, name);
            }

            file = new File("../../timetable_sem2.json");
            tokener = new JSONTokener(new FileInputStream(file));
            array = new JSONArray(tokener);
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.getJSONObject(i);
                String code = obj.getString("ModuleCode");
                String name = obj.getString("ModuleTitle");
                moduleNameMap.put(code, name);
            }
        } catch(FileNotFoundException e) {
        }
        List<Module> modules = new ArrayList<Module>();
        MultifieldValue mv = (MultifieldValue)env.eval("(find-all-instances ((?m MODULE)) TRUE)");
        int num = mv.size();
        for (int i = 0; i < num; i++) {
            InstanceNameValue name =  (InstanceNameValue)mv.get(i);
            InstanceAddressValue x = (InstanceAddressValue)env.eval("(instance-address " + name.instanceNameValue() + ")");
            Module module = new Module();
            String moduleCode = ((LexemeValue)x.directGetSlot("module-code")).lexemeValue();
            module.setCode(moduleCode);
            module.setName(moduleNameMap.get(moduleCode));
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
