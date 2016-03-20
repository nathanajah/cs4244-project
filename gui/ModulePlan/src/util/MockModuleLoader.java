package util;

import models.Module;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nathanajah on 3/17/16.
 */
public class MockModuleLoader implements IModuleLoader {

    @Override
    public List<Module> loadModule() {
        List<Module> moduleList = new ArrayList<Module>();
        moduleList.add(createModule("Programming Methodology", "CS1010", "1000"));
        moduleList.add(createModule("Computing and Society", "IS1101FC", "1000"));
        moduleList.add(createModule("Data Structures and Algorithms I", "CS1020", "1000"));
        moduleList.add(createModule("Data Structures and Algorithms II", "CS2010", "2000"));
        moduleList.add(createModule("Introduction to Operating System", "CS2106", "2000"));
        moduleList.add(createModule("Computer Organization", "CS2100", "2000"));
        return moduleList;
    }

    private Module createModule(String name, String code, String level) {
        Module module = new Module();
        module.setName(name);
        module.setCode(code);
        module.setLevel(level);
        return module;
    }
}
