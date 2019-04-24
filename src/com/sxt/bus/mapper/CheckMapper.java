package com.sxt.bus.mapper;

import com.sxt.bus.domain.Check;
import java.util.List;

public interface CheckMapper {
    void deleteByPrimaryKey(String checkid);

    void insert(Check record);

    void insertSelective(Check record);

    Check selectByPrimaryKey(String checkid);

    void updateByPrimaryKeySelective(Check record);

    void updateByPrimaryKey(Check record);

    List<Check> queryAllCheck(Check check);
}