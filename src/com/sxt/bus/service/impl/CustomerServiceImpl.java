package com.sxt.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.Customer;
import com.sxt.bus.mapper.CustomerMapper;
import com.sxt.bus.service.CustomerService;
import com.sxt.bus.vo.CustomerVo;
import com.sxt.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public DataGridView queryAllCustomer(CustomerVo customerVo) {
        //分页
        Page<Object> page = PageHelper.startPage(customerVo.getPage(), customerVo.getRows());
        //查询数据
        List<Customer> rows = this.customerMapper.queryAllCustomer(customerVo);

        return new DataGridView(page.getTotal(), rows);
    }

    @Override
    public void addCustomer(CustomerVo customerVo) {
        this.customerMapper.insertSelective(customerVo);
    }

    @Override
    public void deleteCustomer(String identity) {
        this.customerMapper.deleteByPrimaryKey(identity);

    }

    @Override
    public void updateCustomer(CustomerVo customerVo) {
        this.customerMapper.updateByPrimaryKeySelective(customerVo);
    }

    @Override
    public Customer queryCustomerByIdentity(String identity) {
        Customer customer = this.customerMapper.selectByPrimaryKey(identity);
        return customer;
    }

    @Override
    public List<BaseBean> queryAllTjfxCustomer() {
        return this.customerMapper.queryAllTjfxCustomer();
    }

    @Override
    public List<Customer> queryAllCustomerForList(CustomerVo customerVo) {
        return this.customerMapper.queryAllCustomer(customerVo);
    }
}
