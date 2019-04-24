package com.sxt.sys.mapper;

import java.util.List;

import com.sxt.sys.domain.LogInfo;

public interface LogInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogInfo record);

    int insertSelective(LogInfo record);

    LogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogInfo record);

    int updateByPrimaryKey(LogInfo record);
    
    //查询所有用户日志
    List<LogInfo> queryAllLogInfo(LogInfo logInfo);
}