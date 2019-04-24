package com.sxt.bus.service;

import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.Rent;
import com.sxt.bus.vo.RentVo;
import com.sxt.sys.utils.DataGridView;

import java.util.List;

public interface RentService {

    //查询所有出租单
    DataGridView queryAllRent(RentVo rentVo);
    //修改
    void updateRent(RentVo rentVo);
   //添加
    void addRent(RentVo rentVo);
    //删除
    void deleteRent(String rentid);

    Rent queryRentByRentId(String rentId);
    //查询销售员年度销售额
    List<BaseBean> queryRentTjfx(String year);

    Double[] queryYearSalMoney01(String year);
}
