package com.sxt.sys.vo;

import com.sxt.sys.domain.Role;

public class RoleVo extends Role {

    private Integer[] Ids;
    private Integer page;//页号
    private Integer rows;//每页条数

    public Integer[] getIds() {
        return Ids;
    }

    public void setIds(Integer[] ids) {
        Ids = ids;
    }

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
