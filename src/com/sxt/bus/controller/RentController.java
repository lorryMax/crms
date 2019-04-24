package com.sxt.bus.controller;

import com.sxt.bus.constast.BUSConstast;
import com.sxt.bus.domain.Customer;
import com.sxt.bus.service.CustomerService;
import com.sxt.bus.service.RentService;
import com.sxt.bus.vo.RentVo;
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
@RequestMapping("rent")
public class RentController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private RentService rentService;

    /**
     * 跳到汽车出租页面
     *
     * @return
     */
    @RequestMapping("toRentCarManager")
    public String toRentCarManager() {
        return "business/rentCarManager";
    }

    /**
     * 1)根据客户身份证查询所有未出租的车辆信息
     *
     * @return
     */
    @RequestMapping("checkAllCarByIdentity")
    @ResponseBody
    public Map<String, Object> checkAllCarByIdentity(String identity) {
        Map<String, Object> map = new HashMap<>();
        //假设身份证号不存在
        map.put("code", SYSConstast.CODE_ERROR);
        //查询身份证
        Customer customer = this.customerService.queryCustomerByIdentity(identity);
        if (null != customer) {
            //存在此身份证号
            map.put("code", SYSConstast.CODE_OK);
        }
        return map;
    }

    /**
     * 初始化汽车表单数据
     */
    @RequestMapping("initCarFormData")
    @ResponseBody
    public RentVo initCarFormData(RentVo rentVo) {
        //获取出租单号
        String rentID = RandomUtils.createRentID(BUSConstast.PREFIX_CZ);
        //获取当前操作员
        User user = (User) WebUtils.getCurrentSession().getAttribute("user");
        //设置操作员姓名
        rentVo.setOpername(user.getRealname());
        //设置起租时间
        rentVo.setBegindate(new Date());
        //设置单号
        rentVo.setRentid(rentID);
        return rentVo;
    }

    /**
     * 跳转到出租单管理界面
     */
    @RequestMapping("toRentManager")
    public String toRentManager() {
        return "business/rentManager";
    }

    /**
     * 查询所有出租单
     */
    @RequestMapping("queryAllRent")
    @ResponseBody
    public DataGridView queryAllRent(RentVo rentVo) {
        DataGridView dataGridView = this.rentService.queryAllRent(rentVo);
        return dataGridView;
    }

    /**
     * 添加出租单
     */
    @RequestMapping("addRent")
    @ResponseBody
    public ResultObj addRent(RentVo rentVo) {
        try {
            this.rentService.addRent(rentVo);
            return ResultObj.addOk();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.addError();
        }
    }

    /**
     * 修改表单
     *
     */
    @RequestMapping("updateRent")
    @ResponseBody
    public ResultObj updateRent(RentVo rentVo) {
        try {
            this.rentService.updateRent(rentVo);
            return ResultObj.updateOk();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.updateError();
        }
    }
    /**
     * 删除表单
     *
     */
    @RequestMapping("deleteRent")
    @ResponseBody
    public ResultObj deleteRent(RentVo rentVo) {
        try {
            this.rentService.deleteRent(rentVo.getRentid());
            return ResultObj.deleteOk();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.deleteError();
        }
    }
}