package com.sxt.bus.service;

import com.sxt.bus.vo.CarVo;
import com.sxt.sys.utils.DataGridView;

public interface CarService {
	//查询全部
	DataGridView queryAllCar(CarVo carVo);
	
	//添加
	void addCar(CarVo carVo);
	//删除
	void deleteCar(String carnumber);
	//修改
	void updateCar(CarVo carVo);
	
}
