package com.sxt.sys.mapper;

import com.sxt.sys.domain.Menu;
import com.sxt.sys.vo.MenuVo;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    //查询并分页
    List<Menu> queryAllMenus(Menu menu);

    Integer queryAllCountByPid(Integer id);

    void deleteRoleMenuByMid(Integer id);

    //2,根据角色ID查询当前角色拥有的菜单
    List<Menu> queryAllMenuByRoleId(Integer roleid);
}