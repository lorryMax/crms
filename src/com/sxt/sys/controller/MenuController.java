package com.sxt.sys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sxt.sys.domain.Menu;
import com.sxt.sys.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.domain.User;
import com.sxt.sys.service.MenuService;
import com.sxt.sys.vo.MenuVo;

@Controller
@RequestMapping("menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	/**
	 * 加载主页面的导航菜单树的json
	 * 
	 */
	@RequestMapping("loadIndexMenuTreeJson")
	@ResponseBody
	public List<TreeNode> loadIndexMenuTreeJson(MenuVo menuVo) {
		// 得到用户对象
		User user = (User) WebUtils.getCurrentSession().getAttribute("user");
		List<Menu> list = null;
		// 判断用户级别
		if (user.getType() == SYSConstast.USER_TYPE_SUPER) {
			list = this.menuService.queryAllMenus(menuVo);
		} else {
			// 是普通用户 ，用id查询菜单
			list = this.menuService.queryAllMenusByUserId(user.getUserid());
		}
		return getTreeNodes(list);
	}
	/**
	 * 查询json封装
	 * @param list
	 * @return
	 */
	private List<TreeNode> getTreeNodes(List<Menu> list) {
		List<TreeNode> nodes = new ArrayList<TreeNode>();
		for (Menu menu : list) {
			Integer id = menu.getId();
			Integer pid = menu.getPid();
			String name = menu.getName();
			String icon = menu.getIcon();
			String tabIcon = menu.getTabicon();
			Boolean isParent = menu.getParent() == SYSConstast.ISPARENT_TRUE ? true
					: false;
			Boolean open = menu.getOpen() == SYSConstast.OPEN_TRUE ? true
					: false;
			String href = menu.getHref();
			nodes.add(new TreeNode(id, pid, name, icon, tabIcon, isParent,
					open, href));
		}
		return nodes;
	}
	/***************菜单管理开始***************/
	/**
	 * 跳转到system/menuManager.jsp
	 */
	@RequestMapping("toMenuManager")
	public String toMenuManager(){
		return "system/menuManager";
	}
	/**
	 * 显示左侧菜单树
	 * 加载json树
	 */
	@RequestMapping("loadMenuTreeLeftJson")
	@ResponseBody
	public List<TreeNode> loadMenuTreeLeftJson(MenuVo menuVo) {
		//查询所有菜单
		List<Menu> menus = this.menuService.queryAllMenus(menuVo);
		return getTreeNodes(menus);
	}
	/**
	 * 查询所有菜单
	 *
	 */
	@RequestMapping("loadAllMenu")
	@ResponseBody
	public DataGridView loadAllMenu(MenuVo menuVo) {
		//查询所有菜单
		return this.menuService.queryAllMenu(menuVo);
	}
	/**
	 * 初始化添加菜单的父级下拉菜单
	 * loadMenuManagerComboTree
	 */
	@RequestMapping("loadMenuManagerComboTree")
	@ResponseBody
	public  List<TreeNode> loadMenuManagerComboTree(MenuVo menuVo){
		//查询所有菜单
		List<Menu> menus = this.menuService.queryAllMenus(menuVo);
		List<TreeNode> nodes =new ArrayList<>();
		for (Menu menu : menus) {
			Integer id=menu.getId();
			Integer pid=menu.getPid();
			String name =menu.getName();
			nodes.add(new TreeNode(id,pid,name));
		}
		//声明父级
		Integer topId=0;
		//创建生成标准json树
		List<TreeNode> treeNodes= TreeNodeBuilder.builder(nodes,topId);
		return treeNodes;
	}
	/**
	 * 添加菜单
	 */
	@RequestMapping("addMenu")
	@ResponseBody
	public ResultObj addMenu(MenuVo menuVo){
		//添加
		try {
			this.menuService.addMenu(menuVo);
			return ResultObj.addOk();
		}catch (Exception e){
			e.printStackTrace();
			return  ResultObj.addError();
		}
	}
	/**
	 *
	 *修改菜单
	 */
	@RequestMapping("updateMenu")
	@ResponseBody
	public ResultObj updateMenu(MenuVo menuVo) {
		//修改
		try {
			this.menuService.updateMenu(menuVo);
			return ResultObj.updateOk();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.updateError();
		}
	}
	/**
	 * 查找要删除的菜单pid是否有子节点
	 * 有 返回code==200
	 * 	没有  返回code=-1
	 */
	@RequestMapping("checkMenuHasChildren")
	@ResponseBody
	public Map<String ,Object> checkMenuHasChildren(Integer id) {
		Map<String ,Object> map =new HashMap<>();
		//假设没有子节点
		map.put("code",SYSConstast.CODE_ERROR);
	Integer count=this.menuService.queryAllCountByPid(id);
	if(count>0){
		//说明存在
		map.put("code",SYSConstast.CODE_OK);
	}
		return map;
	}
	/**
	 * 删除菜单
	 */
	@RequestMapping("deleteMenu")
	@ResponseBody
	public ResultObj deleteMenu(MenuVo menuVo) {
		//修改
		try {
			this.menuService.deleteMenu(menuVo.getId());
			return ResultObj.deleteOk();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.deleteError();
		}
	}
	/***************菜单管理结束***************/
}
