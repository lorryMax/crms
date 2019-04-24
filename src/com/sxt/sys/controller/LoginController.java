package com.sxt.sys.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.domain.User;
import com.sxt.sys.service.LogInfoService;
import com.sxt.sys.service.UserService;
import com.sxt.sys.utils.WebUtils;
import com.sxt.sys.vo.LogInfoVo;
import com.sxt.sys.vo.UserVo;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private LogInfoService logInfoService;

    /**
     * 用户登陆跳转
     */
    @RequestMapping("toLogin")
    public String toLogin() {
        return "system/login";
    }

    /**
     * 登陆
     *
     * @return
     */
    @RequestMapping("login")
    public String login(UserVo userVo, Model model) {
        User user = this.userService.login(userVo);
        if (null != user) {
            // 登陆成功
            WebUtils.getCurrentSession().setAttribute("user", user);
            //记录日志
            LogInfoVo logInfoVo = new LogInfoVo();
            logInfoVo.setLoginname((user.getLoginname() + "-" + user.getRealname()));
            logInfoVo.setLogintime(new Date());
            logInfoVo.setLoginip(WebUtils.getCurrentRequest().getRemoteAddr());
            logInfoService.addLogInfo(logInfoVo);
            return "system/index";
        } else {
            // 失败
            model.addAttribute("error", SYSConstast.USER_LOGIN_ERROR);
            return "system/login";
        }
    }

}
