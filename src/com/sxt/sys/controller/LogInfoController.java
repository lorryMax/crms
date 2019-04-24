package com.sxt.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxt.sys.service.LogInfoService;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.utils.ResultObj;
import com.sxt.sys.vo.LogInfoVo;



@Controller
@RequestMapping("logInfo")
public class LogInfoController {
	
	@Autowired 	
	private LogInfoService logInfoService;
	/**
	 * 跳转到日志管理页面
	 * 
	 */
	@RequestMapping("toLogInfoManager")
	 public String toLogInfoManager(){	
		return "system/logInfoManager";		 
	 }
	
	/**
	 * 日志数据显示
	 */
	@RequestMapping("logInfo")
	@ResponseBody
	 public DataGridView logInfo(LogInfoVo logInfoVo){	
		DataGridView gridView = this.logInfoService.queryAllLogInfo(logInfoVo);
		return gridView; 
	 }
	
	/**
	 * 删除日志
	 * @return
	 */
	@RequestMapping("deleteLogInfo")
	@ResponseBody
	 public ResultObj deleteLogInfo(LogInfoVo  logInfoVo){	
		try {		
			this.logInfoService.deleteLogInfo(logInfoVo.getId());
			//删除成功		
			return ResultObj.deleteOk();		
		} catch (Exception e) {
			e.printStackTrace();
			//失败
			return ResultObj.deleteError();
		}
	 }
	
	
}
