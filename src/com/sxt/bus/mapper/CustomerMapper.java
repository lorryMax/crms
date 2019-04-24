package com.sxt.bus.mapper;

import java.util.List;

import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(String identity);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(String identity);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    //查询全部客户信息
    List<Customer> queryAllCustomer(Customer customer);

    List<BaseBean> queryAllTjfxCustomer();
}