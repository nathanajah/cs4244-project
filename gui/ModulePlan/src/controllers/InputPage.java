package controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.GridPane;
import models.Module;

import java.io.IOException;
import java.util.List;

/**
 * Created by nathanajah on 3/20/16.
 */
public class InputPage extends GridPane {
    @FXML
    private ModuleSelector moduleSelector;

    /**
     * onAction handler for the analyze button.
     * @param event The ActionEvent from the button click.
     */
    @FXML
    public void analyze(ActionEvent event) {
        List<Module> futureModule = moduleSelector.getFutureModules();
        List<Module> takenModule = moduleSelector.getTakenModules();
        //TODO: actually analyze
    }

    /**
     * onAction handler for the Reset button.
     * Resets the moduleSelector.
     * @param event The ActionEvent from the button click.
     */
    @FXML
    public void reset(ActionEvent event) {
        moduleSelector.reset();
    }

    public InputPage() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/input_page.fxml"));
        loader.setRoot(this);
        loader.setController(this);
        try {
            loader.load();
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
