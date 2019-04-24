package com.sxt.bus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxt.bus.service.CarService;
import com.sxt.bus.vo.CarVo;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.utils.ResultObj;


@Controller
@RequestMapping("car")
public class CarController {

    @Autowired
    private CarService carService;

    /**
     * 跳到汽车页面
     *
     * @return
     */
    @RequestMapping("toCarManager")
    public String toCarManager() {
        return "business/carManager";
    }

    /**
     * 查询所有客户
     *
     * @return
     */
    @RequestMapping("queryAllCar")
    @ResponseBody
    public DataGridView queryAllCar(CarVo carVo) {
        return this.carService.queryAllCar(carVo);
    }

    /**
     * 添加汽车
     *
     * @return
     */
    @RequestMapping("addCar")
    @ResponseBody
    public ResultObj addCar(CarVo carVo) {
        try {
            this.carService.addCar(carVo);
            //成功
            return ResultObj.addOk();
        } catch (Exception e) {
            e.printStackTrace();
            //添加失败
            return ResultObj.addError();
        }
    }
    /**
     * 修改汽车
     *
     * @return
     */
    @RequestMapping("updateCar")
    @ResponseBody
    public ResultObj updateCar(CarVo carVo) {

        try {
            this.carService.updateCar(carVo);
            //修改成功
            return ResultObj.updateOk();

        } catch (Exception e) {
            e.printStackTrace();
            //修改失败
            return ResultObj.updateError();
        }
    }
    /**
     * 删除汽车
     *
     * @return
     */
    @RequestMapping("deleteCar")
    @ResponseBody
    public ResultObj deleteCar(String carnumber) {
        try {
            this.carService.deleteCar(carnumber);
            //删除成功
            return ResultObj.deleteOk();
        } catch (Exception e) {
            e.printStackTrace();
            //删除失败
            return ResultObj.deleteError();
        }
    }
}
