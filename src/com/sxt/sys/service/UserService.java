package com.sxt.sys.service;

import com.sxt.sys.domain.User;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.vo.UserVo;

public interface UserService {
	/**
	 * 用户登陆
	 */
	User login(UserVo userVo);
	//修改密码
	void updatePwd(UserVo userVo);
	//根据id查找密码
    User queryPwdByUserId(UserVo userVo);

	//查询全部
	DataGridView queryAllUser(UserVo userVo);

	//添加
	void addUser(UserVo userVo);
	//删除
	void deleteUser(Integer id);
	//修改 ,重置密码
	void updateUser(UserVo userVo);
	//重置
	void resetUserByUserId(Integer userid);
}
