package com.sxt.bus.mapper;

import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.Rent;
import com.sxt.bus.vo.RentVo;

import java.util.List;

public interface RentMapper {
    int deleteByPrimaryKey(String rentid);

    int insert(Rent record);

    int insertSelective(Rent record);

    Rent selectByPrimaryKey(String rentid);

    int updateByPrimaryKeySelective(Rent record);

    int updateByPrimaryKey(Rent record);
    //查询
    List<Rent> queryAllRent(RentVo rentVo);


    List<BaseBean> queryRentTjfx(String year);

    Double[] queryYearSalMoney01(String year);
}