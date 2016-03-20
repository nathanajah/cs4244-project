package controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.GridPane;
import models.Module;
import util.IAnalyzer;
import util.MockAnalyzer;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by nathanajah on 3/17/16.
 */
public class MainPage extends GridPane {
    @FXML
    private InputPage inputPage;

    private IAnalyzer analyzer;

    /**
     * Analyze the data from inputPage and display it in a new page.
     * @param event The ActionEvent of the analyze button.
     */
    @FXML
    public void analyze(ActionEvent event) {
        List<Module> takenModules = inputPage.getTakenModules();
        List<Module> futureModules = inputPage.getFutureModules();

        Map<Module, Integer> semesterMappings = analyzer.analyze(takenModules, futureModules);
    }

    public MainPage() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/main_page.fxml"));
        loader.setRoot(this);
        loader.setController(this);

        analyzer = new MockAnalyzer();
        try {
            loader.load();
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
