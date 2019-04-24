package com.sxt.sys.service;

import java.util.List;

import com.sxt.sys.domain.Menu;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.vo.MenuVo;

public interface MenuService {

	//查询所有菜单数
	List<Menu> queryAllMenus(MenuVo menuVo);
	
	//根据用户id查询菜单
	List<Menu> queryAllMenusByUserId(Integer id);

	//查询所有菜单分页
	DataGridView queryAllMenu(MenuVo menuVo);

    void addMenu(MenuVo menuVo);

	void updateMenu(MenuVo menuVo);

	void deleteMenu(Integer id);

	Integer queryAllCountByPid(Integer id);


	//2,根据角色ID查询当前角色拥有的菜单
	List<Menu> queryAllMenuByRoleId(Integer roleid);
}
