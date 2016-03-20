package models;

import java.io.Serializable;

/**
 * Created by nathanajah on 3/17/16.
 */
public class Module implements Serializable, Comparable<Module> {
    String code;
    String name;
    String level;

    /**
     * Set the module code of this module.
     * @param code The module code.
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * Get the module code of this module.
     * @return The code for this module.
     */
    public String getCode() {
        return code;
    }

    /**
     * Set the module name of this module.
     * @param name The module name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Get the module name of this module.
     * @return The name of this module.
     */
    public String getName() {
        return name;
    }

    /**
     * Get the level of this module.
     * @return The level of this module.
     */
    public String getLevel() {
        return level;
    }

    /**
     * Set the level of this module.
     * @param level The module level.
     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * Check if this object is equal to another object.
     * @param obj Object to be compared to.
     * @return true if the object is a module and the module code is the same, false otherwise.
     */
    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Module)) {
            return false;
        }
        return compareTo((Module)obj) == 0;
    }

    /**
     * Compare this module with another module. Comparison is lexicographic, based on the module code.
     * @param module Another module to be compared with.
     * @return A negative integer if this module's module code is lexicographically smaller,
     * A positive integer if this module's module code is lexicographically larger, and zero if they are the same.
     */
    @Override
    public int compareTo(Module module) {
        return code.compareTo(module.code);
    }

    /**
     * Return a hash code for this module. Since we are using module code as the identifier, it only hashes
     * the module code.
     * @return The hashcode for the module.`
     */
    @Override
    public int hashCode() {
        return code.hashCode();
    }

    /**
     * Get the string representation of this module, which is "<code> - <name>".
     */
    @Override
    public String toString() {
        return code + " - " + name;
    }
}
