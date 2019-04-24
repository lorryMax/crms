package com.sxt.bus.controller;

import com.sxt.bus.constast.BUSConstast;
import com.sxt.bus.domain.Check;
import com.sxt.bus.domain.Rent;
import com.sxt.bus.service.CheckService;
import com.sxt.bus.service.RentService;
import com.sxt.bus.vo.CheckVo;
import com.sxt.bus.vo.CustomerVo;
import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.domain.User;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.utils.RandomUtils;
import com.sxt.sys.utils.ResultObj;
import com.sxt.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("check")
public class CheckController {

    @Autowired
    private RentService rentService;

    @Autowired
    private CheckService checkService;

    /**
     * 跳转到汽车入库页面
     */
    @RequestMapping("toCheckCarManager")
    public  String toCheckCarManager(){
        return  "business/checkCarManager";
    }
    /**
     *
     */
    @RequestMapping("checkRentByRentId")
    @ResponseBody
    public Map<String, Object> checkRentByRentId(String rentid){
        Map<String, Object> map =new HashMap<>();
       Integer code =BUSConstast.RENT_ZERO;//默认为不存在
       Rent rent= rentService.queryRentByRentId(rentid);
        if(null!=rent){
            if(rent.getRentflag()==BUSConstast.RENT_FLAG_TRUE){
                code =BUSConstast.RENT_ONE;
            }else {
                code =BUSConstast.RENT_TWO;
            }
        }
        map.put("code",code);
        System.out.println(code);
       return map;
    }
    /**
     * 初始化
     * 查询客户信息，车辆信息， 检查单信息，出租单信息
     *
     */
    @RequestMapping("initCheckFormData")
    @ResponseBody
    public Map<String, Object> initCheckFormData(String rentid){

        Map<String, Object> map = this.checkService.queryCustomerAndRentAndCarByRentId(rentid);

        Check check =new Check();
        //设置检查单时间
        check.setCheckdate(new Date());
        //设置检查单号
        check.setCheckid(RandomUtils.createRentID(BUSConstast.PREFIX_JC));
        //设置操作员
        User user =(User) WebUtils.getCurrentSession().getAttribute("user");
        check.setOpername(user.getRealname());
        //设置出租单号
        check.setRentid(rentid);
        map.put("check",check);
        return map;
    }
    /**
     * 添加检查单
     */
    @RequestMapping("addCheck")
    @ResponseBody
    public ResultObj addCheck(CheckVo checkVo){
        try {
           this.checkService.addCheck(checkVo);
           return  ResultObj.addOk();
        } catch (Exception e) {
            e.printStackTrace();
            return  ResultObj.addError();
        }
    }

    /*************检查单开始*************/
    /**
     * 跳转到检查单管理页面
     */
    @RequestMapping("toCheckManager")
    public  String toCheckManager(){
        return  "business/checkManager";
    }
    /**
     * 查询所有检查单
     */
    @RequestMapping("queryAllCheck")
    @ResponseBody
    public  DataGridView queryAllCheck(CheckVo checkVo){
        return this.checkService.queryAllCheck(checkVo);
    }
    /**
     * 修改检查单
     *
     */
    @RequestMapping("updateCheck")
    @ResponseBody
    public ResultObj updateCheck(CheckVo checkVo){

        try {
            this.checkService.updateCheck(checkVo);
            //修改成功
            return ResultObj.updateOk();

        } catch (Exception e) {
            e.printStackTrace();
            //修改失败
            return ResultObj.updateError();
        }
    }

    /*************检查单结束*************/


}
