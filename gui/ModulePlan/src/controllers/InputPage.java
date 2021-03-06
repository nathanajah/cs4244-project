package controllers;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import models.Module;

import java.io.IOException;
import java.util.List;

/**
 * Created by nathanajah on 3/20/16.
 */
public class InputPage extends VBox {
    @FXML
    private ModuleSelector moduleSelector;

    @FXML
    private TextField semesters;

    @FXML
    private Label errorLabel;

    @FXML
    private VBox errorVBox;

    /**
     * onAction handler for the analyze button.
     *
     * @param event The ActionEvent from the button click.
     */
    @FXML
    public void analyze(ActionEvent event) {
        propertyOnAnalyze.get().handle(event);
    }

    /**
     * onAction handler for the Reset button.
     * Resets the moduleSelector.
     *
     * @param event The ActionEvent from the button click.
     */
    @FXML
    public void reset(ActionEvent event) {
        moduleSelector.reset();
    }

    /**
     * Return the modules that the student wants to take.
     *
     * @return The modules that the student wants to take.
     */
    public List<Module> getFutureModules() {
        return moduleSelector.getFutureModules();
    }

    /**
     * Return the modules that the student has taken.
     *
     * @return The modules that the student has taken.
     */
    public List<Module> getTakenModules() {
        return moduleSelector.getTakenModules();
    }

    public List<Module> getAvailableModules() {
        return moduleSelector.getAvailableModules();
    }

    /**
     * Return the number of semesters left.
     *
     * @return The number of semesters left.
     */
    public int getSemesters() {
        return Integer.parseInt(semesters.getText());
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

    public void setError(String[] messages) {
        errorVBox.setVisible(true);
        StringBuilder x = new StringBuilder();
        for (String message : messages) {
            x.append(message);
            x.append("\n");
        }
        errorLabel.setText(x.toString());
    }

    public void clearError() {
        errorVBox.setVisible(false);
    }

    private ObjectProperty<EventHandler<ActionEvent>> propertyOnAnalyze = new SimpleObjectProperty<>();

    public final ObjectProperty<EventHandler<ActionEvent>> onAnalyzeProperty() {
        return propertyOnAnalyze;
    }

    public final void setOnAnalyze(EventHandler<ActionEvent> handler) {
        propertyOnAnalyze.set(handler);
    }

    public final EventHandler<ActionEvent> getOnAnalyze() {
        return propertyOnAnalyze.get();
    }
}
