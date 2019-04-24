package com.sxt.bus.domain;

import java.util.ArrayList;
import java.util.List;

public class ColumnBean {

    private List<String> names= new ArrayList<>();
    private List<Double> values= new ArrayList<>();

    public List<String> getNames() {
        return names;
    }

    public void setNames(List<String> names) {
        this.names = names;
    }

    public List<Double> getValues() {
        return values;
    }

    public void setValues(List<Double> values) {
        this.values = values;
    }
}
