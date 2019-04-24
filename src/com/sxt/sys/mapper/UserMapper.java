package com.sxt.sys.mapper;

import com.sxt.sys.domain.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    //用户登陆
    User login(User user);
    //查询全部
    List<User> queryAllUser(User user);

    //删除Sys_role_user表中和userid有关的数据
    void deleteRoleUserByUid(Integer userid);
}