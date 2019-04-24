package com.sxt.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.bus.domain.Car;
import com.sxt.bus.domain.Check;
import com.sxt.bus.domain.Customer;
import com.sxt.bus.domain.Rent;
import com.sxt.bus.mapper.CarMapper;
import com.sxt.bus.mapper.CheckMapper;
import com.sxt.bus.service.CheckService;
import com.sxt.bus.service.CustomerService;
import com.sxt.bus.service.RentService;
import com.sxt.bus.vo.CheckVo;
import com.sxt.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckServiceImpl implements CheckService {
    @Autowired
    private CarMapper carMapper;
    @Autowired
    private RentService rentService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CheckMapper checkMapper;

    @Override
    public DataGridView queryAllCheck(CheckVo checkVo) {
        Page<Object> page = PageHelper.startPage(checkVo.getPage(), checkVo.getRows());
        List<Check> rows = this.checkMapper.queryAllCheck(checkVo);
        return new DataGridView(page.getTotal(),rows);
    }

    @Override
    public void updateCheck(CheckVo checkVo) {
    this.checkMapper.updateByPrimaryKeySelective(checkVo);
    }

    @Override
    public void addCheck(CheckVo checkVo) {
        this.checkMapper.insertSelective(checkVo);
    }

    @Override
    public Map<String, Object> queryCustomerAndRentAndCarByRentId(String rentid) {
        Map<String, Object> map =new HashMap<>();
        //获取Rent
        Rent rent = this.rentService.queryRentByRentId(rentid);
        //获取Customer
        Customer customer = this.customerService.queryCustomerByIdentity(rent.getIdentity());
        //获取Car
        Car car = this.carMapper.selectByPrimaryKey(rent.getCarnumber());
        map.put("rent",rent);
        map.put("car",car);
        map.put("customer",customer);
        return map;
    }
}
