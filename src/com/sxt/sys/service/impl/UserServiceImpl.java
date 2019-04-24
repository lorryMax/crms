package com.sxt.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.domain.User;
import com.sxt.sys.mapper.UserMapper;
import com.sxt.sys.service.UserService;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.utils.MD5Utils;
import com.sxt.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(UserVo userVo) {
		//加密密码
		userVo.setPwd(MD5Utils.md5Password(userVo.getPwd()));
		return userMapper.login(userVo);
	}
	@Override
	public void updatePwd(UserVo userVo) {
		//把新密码进行MD5
		String password = MD5Utils.md5Password(userVo.getPass());
		//修改
		userVo.setPwd(password);
		this.userMapper.updateByPrimaryKeySelective(userVo);
	}

	@Override
	public User queryPwdByUserId(UserVo userVo) {
		return this.userMapper.selectByPrimaryKey(userVo.getUserid());
	}

	@Override
	public DataGridView queryAllUser(UserVo userVo) {
		//分页
		Page<Object> page = PageHelper.startPage(userVo.getPage(), userVo.getRows());
		//查询数据
		List<User> rows = this.userMapper.queryAllUser(userVo);
		return new DataGridView(page.getTotal(), rows);
	}

	@Override
	public void addUser(UserVo userVo) {
		//设置默认MD5密码
		userVo.setPwd(MD5Utils.md5Password(SYSConstast.USER_RESET_PWD));
		this.userMapper.insertSelective(userVo);
	}

	@Override
	public void deleteUser(Integer userid) {
			//删除用户sys_users表中的用户
			this.userMapper.deleteByPrimaryKey(userid);
			//删除Sys_role_user表中和userid有关的数据
			this.userMapper.deleteRoleUserByUid(userid);

	}

	@Override
	public void updateUser(UserVo userVo) {
		this.userMapper.updateByPrimaryKeySelective(userVo);
	}

	/**
	 * 重置密码
	 * @param userid
	 */
	@Override
	public void resetUserByUserId(Integer userid) {
		User user =new User();
		user.setUserid(userid);
		user.setPwd(MD5Utils.md5Password(SYSConstast.USER_RESET_PWD));
		this.userMapper.updateByPrimaryKeySelective(user);
	}

}
