package com.sxt.sys.service;

import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.vo.LogInfoVo;

public interface LogInfoService {

	//删除
	void deleteLogInfo(Integer id);
	//添加
	void addLogInfo(LogInfoVo logInfoVo);
	
	//查询所有日志数
	DataGridView queryAllLogInfo(LogInfoVo logInfoVo);
}
