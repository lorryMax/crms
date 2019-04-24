package com.sxt.sys.controller;

import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.domain.Role;
import com.sxt.sys.domain.User;
import com.sxt.sys.service.LogInfoService;
import com.sxt.sys.service.RoleService;
import com.sxt.sys.service.UserService;
import com.sxt.sys.utils.*;
import com.sxt.sys.vo.*;
import com.sxt.sys.vo.UserVo;
import com.sxt.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    /**
     * 跳转到修改密码管理页面
     */
    @RequestMapping("toUpdatePwd")
    public String toUpdatePwd() {
        return "system/updatePwdManager";
    }
    /**
     * 修改密码
     */
    @RequestMapping("updatePwd")
    @ResponseBody
    public  ResultObj updatePwd(UserVo userVo) {
        //根据id 查询用户原始密码
        User user = this.userService.queryPwdByUserId(userVo);
        //把输入的密码进行MD5
        String md5Password = MD5Utils.md5Password(userVo.getPwd());
        if (null != user) { //判断对象存在
            if (user.getPwd().equals(md5Password)) {
                //密码相等 ,按照id修改密码
                this.userService.updatePwd(userVo);
                return  ResultObj.updateOk();
            }else{
                return  ResultObj.checkPwd();
            }
        }else{
            return ResultObj.checkPwd();
        }
    }
    /**
     * 用户安全退出
     */
    @RequestMapping("exitUser")
    public  String exitUser(UserVo userVo){
        HttpSession session = WebUtils.getCurrentSession();
        session.invalidate();
        return "system/login";
    }

    /*********用户管理开始********/
    /**
     * 跳转到用户管理页面
     */
    @RequestMapping("toUserManager")
    public String toUserManager() {
        return "system/userManager";
    }
    /**
     * 查询所有用户
     */
    @RequestMapping("queryAllUser")
    @ResponseBody
    public DataGridView queryAllUser(UserVo userVo) {
        return this.userService.queryAllUser(userVo);
    }
    /**
     * 添加用户
     *
     * @return
     */
    @RequestMapping("addUser")
    @ResponseBody
    public ResultObj addUser(UserVo userVo) {
        try {
            this.userService.addUser(userVo);
            //成功
            return ResultObj.addOk();
        } catch (Exception e) {
            e.printStackTrace();
            //添加失败
            return ResultObj.addError();
        }
    }
    /**
     * 修改用户
     *
     * @return
     */
    @RequestMapping("updateUser")
    @ResponseBody
    public ResultObj updateUser(UserVo userVo) {
        try {
            this.userService.updateUser(userVo);
            //成功
            return ResultObj.updateOk();
        } catch (Exception e) {
            e.printStackTrace();
            //添加失败
            return ResultObj.updateError();
        }
    }
    /**
     * 删除用户
     *
     * @return
     */
    @RequestMapping("deleteUser")
    @ResponseBody
    public ResultObj deleteUser(Integer userid) {
        try {
            this.userService.deleteUser(userid);
            //成功
            return ResultObj.deleteOk();
        } catch (Exception e) {
            e.printStackTrace();
            //添加失败
            return ResultObj.deleteError();
        }
    }
    /**
     * 密码重置
     *
     * @return
     */
    @RequestMapping("resetUserPwd")
    @ResponseBody
    public ResultObj resetUserPwd(Integer userid) {
        try {
            this.userService.resetUserByUserId(userid);
            //成功
            return ResultObj.resetOk();
        } catch (Exception e) {
            e.printStackTrace();
            //添加失败
            return ResultObj.resetError();
        }
    }
    /**
     * 加载数据用户角色分配json
     */
   /* @RequestMapping("loadUserManagerSelectRole")
    @ResponseBody
    public DataGridView loadUserManagerSelectRole(Integer userid) {




    }*/
    /*********用户管理结束********/

}
