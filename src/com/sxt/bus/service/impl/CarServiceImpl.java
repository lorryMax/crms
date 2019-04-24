package com.sxt.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.bus.domain.Car;
import com.sxt.bus.mapper.CarMapper;
import com.sxt.bus.service.CarService;
import com.sxt.bus.vo.CarVo;
import com.sxt.sys.utils.DataGridView;

@Service
public class CarServiceImpl  implements CarService {

	@Autowired
	private CarMapper carMapper;
	
	@Override
	public DataGridView queryAllCar(CarVo carVo) {
		//分页
		Page<Object> page = PageHelper.startPage(carVo.getPage(), carVo.getRows());
		//查询数据
		List<Car> rows = this.carMapper.queryAllCar(carVo);
			
		return new DataGridView(page.getTotal(), rows);
	}

	@Override
	public void addCar(CarVo carVo) {
		
		this.carMapper.insertSelective(carVo);
	}

	@Override
	public void deleteCar(String carnumber) {
		this.carMapper.deleteByPrimaryKey(carnumber);
		
	}

	@Override
	public void updateCar(CarVo carVo) {
		
		this.carMapper.updateByPrimaryKeySelective(carVo);
	}

}
