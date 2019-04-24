package com.sxt.sys.controller;


import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.domain.Menu;
import com.sxt.sys.service.MenuService;
import com.sxt.sys.service.RoleService;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.utils.ResultObj;
import com.sxt.sys.utils.TreeNode;
import com.sxt.sys.vo.MenuVo;
import com.sxt.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    /**
     * 跳到角色页面
     *
     * @return
     */
    @RequestMapping("toRoleManager")
    public String toRoleManager() {
        return "system/roleManager";
    }

    /**
     * 查询所有角色
     *
     * @return
     */
    @RequestMapping("queryAllRole")
    @ResponseBody
    public DataGridView queryAllRole(RoleVo roleVo) {
        return this.roleService.queryAllRole(roleVo);
    }

    /**
     * 添加角色
     *
     * @return
     */
    @RequestMapping("addRole")
    @ResponseBody
    public ResultObj addRole(RoleVo roleVo) {
        try {
            this.roleService.addRole(roleVo);
            //成功
            return ResultObj.addOk();
        } catch (Exception e) {
            e.printStackTrace();
            //添加失败
            return ResultObj.addError();
        }
    }

    /**
     * 修改角色
     *
     * @return
     */
    @RequestMapping("updateRole")
    @ResponseBody
    public ResultObj updateRole(RoleVo roleVo) {
        try {
            this.roleService.updateRole(roleVo);
            //修改成功
            return ResultObj.updateOk();
        } catch (Exception e) {
            e.printStackTrace();
            //修改失败
            return ResultObj.updateError();
        }
    }

    /**
     * 删除角色
     *
     * @return
     */
    @RequestMapping("deleteRole")
    @ResponseBody
    public ResultObj deleteRole(Integer roleid) {
        try {
            this.roleService.deleteRole(roleid);
            //删除成功
            return ResultObj.deleteOk();
        } catch (Exception e) {
            e.printStackTrace();
            //删除失败
            return ResultObj.deleteError();
        }
    }

    /**
     * 分配角色菜单的json树
     */
    @RequestMapping("loadAllMenuTressJson")
    @ResponseBody
    public List<TreeNode> loadAllMenuTressJson(Integer roleid) {
        //查询所有可用的菜单
        MenuVo menuVo = new MenuVo();
        //设置可用属性
        menuVo.setAvailable(SYSConstast.AVAILABLE_TRUE);
        List<Menu> allMenu = this.menuService.queryAllMenus(menuVo);
        //2,根据角色ID查询当前角色拥有的菜单
        List<Menu> list = this.menuService.queryAllMenuByRoleId(roleid);
        List<TreeNode> treeNodes = new ArrayList<>();
        for (Menu menu : allMenu) {
            boolean checked = false;
            for (Menu menu1 : list) {
                if (menu.getId() == menu1.getId()) {
                    checked = true;
                    break;
                }
            }
            Integer id = menu.getId();
            Integer pid = menu.getPid();
            String name = menu.getName();
            String icon = menu.getIcon();
            Boolean isParent = menu.getParent() == SYSConstast.ISPARENT_TRUE ? true : false;
            Boolean open = menu.getOpen() == SYSConstast.OPEN_TRUE ? true : false;
            treeNodes.add(new TreeNode(id, pid, name, icon, isParent, open, checked));
        }
        return treeNodes;
    }

    /**
     * 保存角色和菜单之间的关系
     */
    @RequestMapping("saveRoleMenus")
    @ResponseBody
    public ResultObj saveRoleMenus(RoleVo roleVo) {
        try {
            this.roleService.saveRoleMenus(roleVo);
            return ResultObj.dispatchOk();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.dispatchError();
        }
    }
}
