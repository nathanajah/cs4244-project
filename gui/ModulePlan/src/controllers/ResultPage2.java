package controllers;

import javafx.beans.property.*;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableStringValue;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.ObservableMap;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeItem;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.util.Callback;
import models.Module;

import java.io.IOException;
import java.util.*;

/**
 * Created by nathanajah on 4/15/16.
 */
public class ResultPage2 extends VBox {
    @FXML
    private TableView table;

    public ResultPage2() {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/views/result_page_2.fxml"));
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
        table.getColumns().clear();
        Map<Integer, List<Module>> reverseMapping = new HashMap<Integer, List<Module>>();
        ObservableList<List<Module>> semesters = FXCollections.observableArrayList();
        int maxSemester = 0;

        for (Map.Entry<Module, Integer> entry : semesterMapping.entrySet()) {
            if (entry.getValue() != null) {
                maxSemester = Math.max(maxSemester, entry.getValue());
            }
        }
        for (int i = 0; i < maxSemester; i++) {
            semesters.add(new ArrayList<Module>());
        }

        for (Map.Entry<Module, Integer> entry : semesterMapping.entrySet()) {
            if (entry.getValue() != null) {
                semesters.get(entry.getValue() - 1).add(entry.getKey());
            }
        }

        int maxRows = 0;
        for (int i = 0; i < maxSemester; i++) {
            maxRows = Math.max(maxRows, semesters.get(i).size());
        }

        ObservableList<List<Module>> rows = FXCollections.observableArrayList();
        for (int i = 0; i < maxRows; i++) {
            List<Module> row = new ArrayList<Module>();
            for (int j = 0; j < maxSemester; j++) {
                if (semesters.get(j).size() <= i) {
                    row.add(null);
                } else {
                    row.add(semesters.get(j).get(i));
                }
            }
            rows.add(row);
        }

        List<TableColumn> columns = new ArrayList<TableColumn>();
        for (int i = 0; i < maxSemester; i++) {
            final int x = i;
            columns.add(new TableColumn("Semester " + (i + 1)));
            columns.get(i).setCellValueFactory(
                    new Callback<TableColumn.CellDataFeatures<ArrayList<Module>, String>, ObservableValue<String>>() {
                        public ObservableValue<String> call(TableColumn.CellDataFeatures<ArrayList<Module>, String> cell) {
                            if (cell == null || cell.getValue() == null || cell.getValue().get(x) == null) {
                                return new SimpleStringProperty("");
                            } else {
                                return new SimpleStringProperty(cell.getValue().get(x).getCode());
                            }
                        }
                    });
        }
        table.setItems(rows);

        for (int i = 0; i < maxSemester; i++) {
            table.getColumns().add(columns.get(i));
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
