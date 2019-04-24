package com.sxt.bus.service;

import com.sxt.bus.domain.Check;
import com.sxt.bus.vo.CheckVo;
import com.sxt.sys.utils.DataGridView;

import java.util.Map;

public interface CheckService {

    //查询所有出租单
    DataGridView queryAllCheck(CheckVo checkVo);
    //修改
    void updateCheck(CheckVo checkVo);
   //添加
    void addCheck(CheckVo checkVo);


    Map<String, Object> queryCustomerAndRentAndCarByRentId(String rentId);
}
