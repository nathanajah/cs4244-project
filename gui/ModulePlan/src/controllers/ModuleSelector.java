package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ListView;
import javafx.scene.input.*;
import javafx.scene.layout.GridPane;
import models.Module;
import util.IModuleLoader;
import util.MockModuleLoader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by nathanajah on 3/17/16.
 */
public class ModuleSelector extends GridPane {
    @FXML
    private ListView<Module> takenView;
    @FXML
    private ListView<Module> availableView;
    @FXML
    private ListView<Module> futureView;

    private ObservableList<Module> takenModules = FXCollections.observableArrayList();
    private ObservableList<Module> futureModules = FXCollections.observableArrayList();
    private ObservableList<Module> availableModules = FXCollections.observableArrayList();
    private List<Module> moduleList = new ArrayList<Module>();

    private DataFormat moduleDataFormat = new DataFormat("module");

    /**
     * Generate the onDragDetected EventHandler for a list.
     * The handler will create a Dragboard and put the module data inside the content.
     * @param list The list that we want to watch.
     * @return The onDragDetected EventHandler.
     */
    private EventHandler<MouseEvent> generateOnDragDetectedHandler(ListView<Module> list) {
        return event -> {
            Module selected = list.getSelectionModel().getSelectedItem();
            if (selected != null) {
                Dragboard db = list.startDragAndDrop(TransferMode.ANY);
                ClipboardContent content = new ClipboardContent();
                content.put(moduleDataFormat, list.getSelectionModel().getSelectedItem());
                db.setContent(content);
            }
            event.consume();
        };
    }

    /**
     * Generate the onDragOver EventHandler for a list.
     * The handler will check if the source is not the same as this list, and accept the transfer.
     * @param list The list that we want to watch.
     * @return The onDragOver EventHandler.
     */
    private EventHandler<DragEvent> generateOnDragOverHandler(ListView<Module> list) {
        return event -> {
            if ((event.getGestureSource() != list) &&
                    event.getDragboard().hasContent(moduleDataFormat) &&
                    (event.getGestureSource() instanceof ListView)) {
                event.acceptTransferModes(TransferMode.ANY);
            }
            event.consume();
        };
    }

    /**
     * Generate the onDragDropped EventHandler for a list.
     * The handler will remove the module from the source list, and add it into the new list.
     * It will also re-sort the list.
     * @param list The list that we want to watch.
     * @return The onDragDropped EventHandler.
     */
    private EventHandler<DragEvent> generateOnDragDroppedHandler(ListView<Module> list) {
        return event -> {
            Dragboard db = event.getDragboard();
            boolean success = false;
            if (db.hasContent(moduleDataFormat)){
                Module module = (Module)db.getContent(moduleDataFormat);
                ObservableList<Module> originalList = ((ListView<Module>)event.getGestureSource()).getItems();
                list.getItems().add(module);
                originalList.remove(module);
                Collections.sort(list.getItems());
                Collections.sort(originalList);
                success = true;
            }
            event.setDropCompleted(success);
            event.consume();
        };
    }

    /**
     * Load the modules into the availableModules list.
     */
    private void loadModules() {
        IModuleLoader moduleLoader = new MockModuleLoader();
        List<Module> modules = moduleLoader.loadModule();
        for (Module module : modules) {
            moduleList.add(module);
        }
        reset();
    }

    /**
     * Attach the EventHandlers to the ListViews.
     */
    private void attachViews() {
        takenView.setItems(takenModules);
        availableView.setItems(availableModules);
        futureView.setItems(futureModules);

        takenView.setOnDragDetected(generateOnDragDetectedHandler(takenView));
        availableView.setOnDragDetected(generateOnDragDetectedHandler(availableView));
        futureView.setOnDragDetected(generateOnDragDetectedHandler(futureView));

        takenView.setOnDragDropped(generateOnDragDroppedHandler(takenView));
        availableView.setOnDragDropped(generateOnDragDroppedHandler(availableView));
        futureView.setOnDragDropped(generateOnDragDroppedHandler(futureView));

        takenView.setOnDragOver(generateOnDragOverHandler(takenView));
        availableView.setOnDragOver(generateOnDragOverHandler(availableView));
        futureView.setOnDragOver(generateOnDragOverHandler(futureView));
    }

    /**
     * Return the list of modules that the student has taken.
     * @return The list of modules that the student has taken.
     */
    public List<Module> getTakenModules() {
       return new ArrayList<>(takenModules);
    }

    /**
     * Get the list of modules that the student wants to take.
     * @return The list of modules that the student wants to take.
     */
    public List<Module> getFutureModules() {
        return new ArrayList<>(futureModules);
    }

    /**
     * Resets the interface.
     */
    public void reset() {
        takenModules.setAll();
        futureModules.setAll();
        availableModules.setAll(moduleList);
    }

    public ModuleSelector() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/module_selector.fxml"));
        loader.setRoot(this);
        loader.setController(this);
        try {
            loader.load();
            loadModules();
            attachViews();
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
