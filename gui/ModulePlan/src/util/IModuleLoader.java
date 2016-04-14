package util;

import models.Module;

import java.io.FileNotFoundException;
import java.util.List;

/**
 * Created by nathanajah on 3/17/16.
 */
public interface IModuleLoader {
    public List<Module> loadModule();
}
