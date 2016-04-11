package util;

import models.Module;

import java.util.List;
import java.util.Map;

/**
 * Created by nathanajah on 3/20/16.
 */
public interface IAnalyzer {
    Map<Module, Integer> analyze(List<Module> taken, List<Module> future, int semesters);
}
