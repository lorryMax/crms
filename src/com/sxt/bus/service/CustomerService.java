package com.sxt.bus.service;

import java.util.List;

import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.Customer;
import com.sxt.bus.vo.CustomerVo;
import com.sxt.sys.utils.DataGridView;

public interface CustomerService {
	//查询全部
	DataGridView queryAllCustomer(CustomerVo customerVo);
	
	//添加
	void addCustomer(CustomerVo customerVo);
	
	//删除
	void deleteCustomer(String identity);
	//修改
	void updateCustomer(CustomerVo customerVo);

	Customer queryCustomerByIdentity(String identity);

    List<BaseBean> queryAllTjfxCustomer();
	//查询所有
    List<Customer> queryAllCustomerForList(CustomerVo customerVo);
}
