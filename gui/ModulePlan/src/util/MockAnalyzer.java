package util;

import models.Module;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by nathanajah on 3/20/16.
 */
public class MockAnalyzer implements IAnalyzer {

    @Override
    public Map<Module, Integer> analyze(List<Module> taken, List<Module> future) {
        Map<Module, Integer> semesterMapping = new HashMap<Module, Integer>();
        for (Module module : taken) {
            semesterMapping.put(module, 1);
        }
        for (Module module : taken) {
            semesterMapping.put(module, 2);
        }
        return semesterMapping;
    }
}
