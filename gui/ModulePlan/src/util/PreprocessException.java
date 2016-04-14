package util;

/**
 * Created by nathanajah on 4/14/16.
 */
public class PreprocessException extends Exception {
    String[] messages;

    public PreprocessException(String[] messages) {
        this.messages = messages;
    }

    public String[] getMessages() {
        return messages;
    }
}
