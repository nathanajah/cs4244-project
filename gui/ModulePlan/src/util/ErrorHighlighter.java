package util;

import models.Module;
import net.sf.clipsrules.jni.Environment;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by nathanajah on 4/15/16.
 */
public class ErrorHighlighter {
    Set<String> highlightedCode;
    Environment clips;
    Map<Module, ArrayList<String> > prerequisites;
    Map<Module, ArrayList<String>> preclusions;

    public ErrorHighlighter() {
        highlightedCode = new HashSet<String>();
        clips = new Environment();
    }

    boolean isHighlighted(String moduleCode) {
        return highlightedCode.contains(moduleCode);
    }


    void setHighlight(String error) {
        highlightedCode.clear();
        if (error.equals("Missing CS1010 or CS1101S")) {
            highlightedCode.add("CS1010", "CS1101S");
        } else if (error.equals("Missing (CS1020 and CS2010) or CS2020")){
            highlightedCode.add("CS1020", "CS2010", "CS2020");
        } else if (erro)
    }

}
