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
import java.util.Collections;
import java.util.List;

/**
 * Created by nathanajah on 3/17/16.
 */
public class ModuleSelectorController extends GridPane {
    @FXML
    private ListView<Module> takenView;
    @FXML
    private ListView<Module> availableView;
    @FXML
    private ListView<Module> futureView;

    private ObservableList<Module> takenModules = FXCollections.observableArrayList();
    private ObservableList<Module> futureModules = FXCollections.observableArrayList();
    private ObservableList<Module> availableModules = FXCollections.observableArrayList();

    private DataFormat moduleDataFormat = new DataFormat("module");

    private EventHandler<MouseEvent> generateOnDragDetectedHandler(ListView<Module> list) {
        return event -> {
            Module selected = list.getSelectionModel().getSelectedItem();
            if (selected != null) {
                Dragboard db = list.startDragAndDrop(TransferMode.ANY);
                ClipboardContent content = new ClipboardContent();
                content.put(moduleDataFormat, list.getSelectionModel().getSelectedItem());
                content.putString(list.getSelectionModel().getSelectedItem().toString());
                db.setContent(content);
            }
            event.consume();
        };
    }

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

    private void loadModules() {
        IModuleLoader moduleLoader = new MockModuleLoader();
        List<Module> modules = moduleLoader.loadModule();
        for (Module module : modules) {
            availableModules.add(module);
        }
    }

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


    public ModuleSelectorController() {
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
