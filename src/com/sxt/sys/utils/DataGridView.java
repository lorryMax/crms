package com.sxt.sys.utils;

import java.util.List;

public class DataGridView {
    /**
     * 封装适配easyui表格的数据
     */
    private Long total;//总记录数
    private List<?> rows;//分页数据

    public DataGridView() {
        super();
        // TODO Auto-generated constructor stub
    }

    public DataGridView(Long total, List<?> rows) {
        super();
        this.total = total;
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }


}