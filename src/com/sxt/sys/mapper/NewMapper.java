package com.sxt.sys.mapper;

import com.sxt.sys.domain.New;

public interface NewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(New record);

    int insertSelective(New record);

    New selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(New record);

    int updateByPrimaryKey(New record);
}