package com.sxt.sys.mapper;

import com.sxt.sys.domain.Role;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    //查询全部
    List<Role> queryAllRole(Role role);
    //删除sys_roels_menus的数据
    void deleteRoleMenuByRid(Integer roleid);

    //保存角色和菜单之间的关系
    void saveRoleMenus(Integer roleid, Integer mid);
}