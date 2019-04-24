package com.sxt.bus.controller;

import com.sun.deploy.net.HttpResponse;
import com.sxt.bus.domain.Customer;
import com.sxt.bus.utlis.ExportCustomerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxt.bus.service.CustomerService;
import com.sxt.bus.vo.CustomerVo;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.utils.ResultObj;

import java.util.List;


@Controller
@RequestMapping("customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	/**
	 * 跳到客户页面
	 * @return
	 */
	@RequestMapping("toCustomerManager")
	public String toCustomerManager(){
		return "business/customerManager";
	}
	/**
	 * 查询所有客户
	 * @return
	 */
	@RequestMapping("loadAllCustomer")
	@ResponseBody
	public DataGridView  loadAllCustomer(CustomerVo customerVo){
		return this.customerService.queryAllCustomer(customerVo);
	}
	/**
	 * 添加客户
	 * @return
	 */
	@RequestMapping("addCustomer")
	@ResponseBody
	public ResultObj addCustomer(CustomerVo customerVo){	
		try {
			this.customerService.addCustomer(customerVo);
			//成功
			return ResultObj.addOk();
			
		} catch (Exception e) {
			e.printStackTrace();
			//添加失败
			return ResultObj.addError();
		}
		
		
	}
	/**
	 * 修改客户
	 * @return
	 */
	@RequestMapping("updateCustomer")
	@ResponseBody
	public ResultObj updateCustomer(CustomerVo customerVo){
		
		try {
			this.customerService.updateCustomer(customerVo);
			//修改成功
			return ResultObj.updateOk();
			
		} catch (Exception e) {
			e.printStackTrace();
			//修改失败
			return ResultObj.updateError();
		}
	}
	/**
	 * 删除客户
	 * @return
	 */
	@RequestMapping("deleteCustomer")
	@ResponseBody
	public ResultObj deleteCustomer(String identity){
		
		try {
			this.customerService.deleteCustomer(identity);
			//删除成功
			return ResultObj.deleteOk();
			
		} catch (Exception e) {
			e.printStackTrace();
			//删除失败
			return ResultObj.deleteError();
		}
	}

	/**
	 * 导出客户数据
	 */
	@RequestMapping("exportCustomer")
	public void exportCustomer(CustomerVo customerVo, HttpResponse response){
		//查询所有客户信息
		List<Customer> customers =this.customerService.queryAllCustomerForList(customerVo);
		//设置excel的标题名
		String sheetName="客户信息表";
		String fileName="客户信息表.xls";
		ExportCustomerUtils.exportCustomers(customers,sheetName,fileName,response);

	}
}
