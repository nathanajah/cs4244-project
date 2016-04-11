package controllers;

import javafx.beans.InvalidationListener;
import javafx.beans.property.*;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.MapChangeListener;
import javafx.collections.ObservableMap;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.TreeItem;
import javafx.scene.layout.GridPane;
import models.Module;

import java.io.IOException;
import java.util.*;

/**
 * Created by nathanajah on 3/21/16.
 */
public class ResultPage extends GridPane {
    @FXML
    private TreeItem root;

    public ResultPage() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/result_page.fxml"));
        loader.setRoot(this);
        loader.setController(this);
        semesterMappingProperty().addListener(new ChangeListener<ObservableMap<Module, Integer>>() {
            @Override
            public void changed(ObservableValue<? extends ObservableMap<Module, Integer>> observableValue, ObservableMap<Module, Integer> moduleIntegerObservableMap, ObservableMap<Module, Integer> t1) {
                initializeItems();
            }
        });
        try {
            loader.load();
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }

    private void initializeItems() {
        Map<Integer, List<Module>> reverseMapping = new HashMap<Integer, List<Module>>();
        for (Map.Entry<Module, Integer> entry : semesterMapping.entrySet()) {
            if (!reverseMapping.containsKey(entry.getValue())) {
                reverseMapping.put(entry.getValue(), new ArrayList<Module>());
            }
            reverseMapping.get(entry.getValue()).add(entry.getKey());
            System.out.println(entry.getValue());
        }

        root.getChildren().setAll();
        for (Map.Entry<Integer, List<Module>> entry : reverseMapping.entrySet()) {
            Collections.sort(entry.getValue());
            TreeItem<String> semesterItem = new TreeItem<String>("Semester " + entry.getKey());
            for (Module module : entry.getValue()) {
                TreeItem<String> moduleItem = new TreeItem<String>(module.getCode());
                semesterItem.getChildren().add(moduleItem);
            }
            root.getChildren().add(semesterItem);
        }
    }

    @FXML
    public void back(ActionEvent event) {
        propertyOnBack.get().handle(event);
    }

    private MapProperty<Module, Integer> semesterMapping = new SimpleMapProperty<Module, Integer>();

    public final MapProperty<Module, Integer> semesterMappingProperty() {
        return semesterMapping;
    }

    public final void setSemesterMapping(ObservableMap<Module, Integer> mapping) {
        semesterMapping.set(mapping);
    }

    public final ObservableMap<Module, Integer> getSemesterMapping() {
        return semesterMapping.get();
    }


    private ObjectProperty<EventHandler<ActionEvent>> propertyOnBack = new SimpleObjectProperty<>();

    public final ObjectProperty<EventHandler<ActionEvent>> onBackProperty() {
        return propertyOnBack;
    }

    public final void setOnBack(EventHandler<ActionEvent> handler) {
        propertyOnBack.set(handler);
    }

    public final EventHandler<ActionEvent> getOnBack() {
        return propertyOnBack.get();
    }
}
