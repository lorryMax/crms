package com.sxt.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.bus.constast.BUSConstast;
import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.Car;
import com.sxt.bus.domain.Rent;
import com.sxt.bus.mapper.CarMapper;
import com.sxt.bus.mapper.RentMapper;
import com.sxt.bus.service.RentService;
import com.sxt.bus.vo.RentVo;
import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RentServiceImpl implements RentService {

	@Autowired
	private RentMapper rentMapper;
	@Autowired
    private CarMapper carMapper;
	@Override
	public DataGridView queryAllRent(RentVo rentVo) {
		//分页
		Page<Object> page = PageHelper.startPage(rentVo.getPage(), rentVo.getRows());
		//查询数据
		List<Rent> rows = this.rentMapper.queryAllRent(rentVo);
		return new DataGridView(page.getTotal(), rows);
	}
	@Override
	public void addRent(RentVo rentVo) {
		rentVo.setCreatetime(new Date());
		rentVo.setRentflag(BUSConstast.RENT_FLAG_FALSE);
		this.rentMapper.insertSelective(rentVo);
        Car car =new Car();
        car.setCarnumber(rentVo.getCarnumber());
        //设置已出租
        car.setIsrenting(SYSConstast.ISPARENT_TRUE);
        // 修改汽车
        carMapper.updateByPrimaryKeySelective(car);
	}
	@Override
	public void deleteRent(String rentid) {
		this.rentMapper.deleteByPrimaryKey(rentid);
	}

	@Override
	public Rent queryRentByRentId(String rentId) {
		Rent rent = this.rentMapper.selectByPrimaryKey(rentId);
		return rent;
	}

	@Override
	public List<BaseBean> queryRentTjfx(String year) {
		return this.rentMapper.queryRentTjfx(year);
	}
	//查公司月份业务员销售额
	@Override
	public Double[] queryYearSalMoney01(String year) {
		return this.rentMapper.queryYearSalMoney01(year);
	}

	@Override
	public void updateRent(RentVo rentVo) {
		this.rentMapper.updateByPrimaryKeySelective(rentVo);
	}

}
