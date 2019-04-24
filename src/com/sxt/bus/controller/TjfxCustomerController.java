package com.sxt.bus.controller;

import com.sxt.bus.domain.BaseBean;
import com.sxt.bus.domain.ColumnBean;
import com.sxt.bus.service.CustomerService;
import com.sxt.bus.service.RentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("tjfx")
public class TjfxCustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private RentService rentService;

    /**
     * 跳到统计分析页面
     *
     * @return
     */
    @RequestMapping("toTjCustomerArea")
    public String toTjCustomerArea() {
        return "tjfx/tjfxCustomer";
    }

    /**
     * 查询所有客户
     *
     * @return
     */
    @RequestMapping("loadCustomerAreaJson")
    @ResponseBody
    public List<BaseBean> loadCustomerAreaJson() {
        return this.customerService.queryAllTjfxCustomer();
    }

    /**
     * 跳到业务员年度销售额分析页面
     *
     * @return
     */
    @RequestMapping("toTjOpernameSalMoneyYear")
    public String toTjOpernameSalMoneyYear() {
        return "tjfx/opernameSalMoneyYear";
    }

    /**
     * 查询业务员年度额的销售数量
     * 柱子图
     */
    @RequestMapping("loadRentAreaJson")
    @ResponseBody
    public ColumnBean loadRentAreaJson(String year) {

        ColumnBean columnBean = new ColumnBean();

        List<BaseBean> baseBeans = this.rentService.queryRentTjfx(year);

        for (BaseBean baseBean : baseBeans) {
            columnBean.getNames().add(baseBean.getName());
            columnBean.getValues().add(baseBean.getValue());
        }
        return columnBean;
    }

    /**
     * 跳到公司年度月份销售分析页面
     *
     * @return
     */
    @RequestMapping("toTjYearMonthLine")
    public String toTjYearMonthLine() {
        return "tjfx/tjYearMonthLine";
    }

    /**
     * 公司年度月份销售曲线图
     * 柱子图
     */
    @RequestMapping("queryYearSalMoney")
    @ResponseBody
    public Double[] queryYearSalMoney(String year) {
        Double[] dbs = this.rentService.queryYearSalMoney01(year);
        for (int i = 0; i < dbs.length; i++) {
            if (null == dbs[i]) {
                dbs[i] = 0.0;
            }
        }
        return dbs;
    }
}