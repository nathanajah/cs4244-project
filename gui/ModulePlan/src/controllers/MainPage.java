package controllers;

import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.StackPane;
import models.Module;
import util.Analyzer;
import util.IAnalyzer;
import util.MockAnalyzer;
import util.PreprocessException;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by nathanajah on 3/17/16.
 */
public class MainPage extends StackPane {
    @FXML
    private InputPage inputPage;

    @FXML
    private ResultPage resultPage;

    private IAnalyzer analyzer;

    /**
     * Analyze the data from inputPage and display it in a new page.
     * @param event The ActionEvent of the analyze button.
     */
    @FXML
    public void analyze(ActionEvent event) {
        List<Module> takenModules = inputPage.getTakenModules();
        List<Module> futureModules = inputPage.getFutureModules();
        int semesters = inputPage.getSemesters();

        try {
            Map<Module, Integer> semesterMappings = analyzer.analyze(takenModules, futureModules, semesters);
            resultPage.setSemesterMapping(FXCollections.observableMap(semesterMappings));
            inputPage.clearError();
            inputPage.setVisible(false);
            resultPage.setVisible(true);
        } catch (PreprocessException e) {
            String[] messages = e.getMessages();
            inputPage.setError(messages);
        }
    }

    @FXML
    public void backFromResult(ActionEvent event) {
        inputPage.setVisible(true);
        resultPage.setVisible(false);
    }

    public MainPage() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/main_page.fxml"));
        loader.setRoot(this);
        loader.setController(this);

        analyzer = new Analyzer();
        try {
            loader.load();
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
