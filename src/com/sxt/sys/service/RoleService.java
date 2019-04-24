package com.sxt.sys.service;

import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.vo.RoleVo;

public interface RoleService {
	//查询全部
	DataGridView queryAllRole(RoleVo roleVo);
	
	//添加
	void addRole(RoleVo roleVo);
	//删除
	void deleteRole(Integer roleid);
	//修改
	void updateRole(RoleVo roleVo);

    void saveRoleMenus(RoleVo roleVo);
}
