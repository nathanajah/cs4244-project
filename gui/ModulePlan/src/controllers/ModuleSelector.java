package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.input.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.util.Callback;
import models.Module;
import util.IModuleLoader;
import util.MockModuleLoader;
import util.ModuleLoader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by nathanajah on 3/17/16.
 */
public class ModuleSelector extends HBox {
    @FXML
    private ListView<Module> takenView;
    @FXML
    private ListView<Module> availableView;
    @FXML
    private ListView<Module> futureView;

    @FXML
    private TextField searchField;

    private ObservableList<Module> takenModules = FXCollections.observableArrayList();
    private ObservableList<Module> futureModules = FXCollections.observableArrayList();
    private ObservableList<Module> availableModules = FXCollections.observableArrayList();
    private ObservableList<Module> filteredAvailableModules = FXCollections.observableArrayList();
    private List<Module> moduleList = new ArrayList<Module>();

    private DataFormat moduleDataFormat = new DataFormat("module");

    /**
     * Generate the onDragDetected EventHandler for a list.
     * The handler will create a Dragboard and put the module data inside the content.
     *
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
     *
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
     *
     * @param list The list that we want to watch.
     * @return The onDragDropped EventHandler.
     */
    private EventHandler<DragEvent> generateOnDragDroppedHandler(ListView<Module> list) {
        return event -> {
            Dragboard db = event.getDragboard();
            boolean success = false;
            if (db.hasContent(moduleDataFormat)) {
                Module module = (Module) db.getContent(moduleDataFormat);
                ObservableList<Module> originalList = ((ListView<Module>) event.getGestureSource()).getItems();
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
        IModuleLoader moduleLoader = new ModuleLoader();
        List<Module> modules = moduleLoader.loadModule();
        for (Module module : modules) {
            moduleList.add(module);
        }
        reset();
    }

    class AvailableCell extends ListCell<Module> {
        @Override
        public void updateItem(Module item, boolean empty) {
            super.updateItem(item, empty);
            if (empty) {
                setText(null);
                setGraphic(null);
            } else {
                setText(item.toString());
            }
        }
    }
    /**
     * Attach the EventHandlers to the ListViews.
     */
    private void attachViews() {
        takenView.setItems(takenModules);
        availableView.setCellFactory(new Callback<ListView<Module>, ListCell<Module>>() {
            public ListCell<Module> call(ListView<Module> list) {
                AvailableCell cell = new AvailableCell();
                cell.getStyleClass().add("highlighted");
                return cell;
            }
        });

        availableView.setItems(filteredAvailableModules);
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

    public List<Module> getAvailableModules() {
        return new ArrayList<>(availableModules);
    }
    /**
     * Resets the interface.
     */
    public void reset() {
        takenModules.setAll();
        futureModules.setAll();
        availableModules.setAll(moduleList);
        filteredAvailableModules.setAll(moduleList);
    }

    public ModuleSelector() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/module_selector.fxml"));
        loader.setRoot(this);
        loader.setController(this);
        try {
            loader.load();
            loadModules();
            attachViews();
            searchField.textProperty().addListener((observable, oldValue, newValue) -> {
                filteredAvailableModules.setAll();
                for (Module module : availableModules) {
                    if (module.getCode().contains(newValue) || module.getName().contains(newValue)) {
                        filteredAvailableModules.add(module);
                    }
                }
            });

            filteredAvailableModules.addListener(new ListChangeListener<Module>(){

                @Override
                public void onChanged(Change<? extends Module> change) {
                    while (change.next()) {
                        for (Module remModule : change.getRemoved()) {
                            if (takenModules.contains(remModule)) {
                                availableModules.remove(remModule);
                            }
                            if (futureModules.contains(remModule)) {
                                availableModules.remove(remModule);
                            }
                        }
                        for (Module addModule : change.getAddedSubList()) {
                            if (!availableModules.contains(addModule)) {
                                availableModules.add(addModule);

                            }
                        }
                    }
                }
            });
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
