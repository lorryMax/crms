package com.sxt.sys.vo;

import com.sxt.sys.domain.Menu;

public class MenuVo extends Menu {


    private Integer page;//页号
    private Integer rows;//每页条数

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
