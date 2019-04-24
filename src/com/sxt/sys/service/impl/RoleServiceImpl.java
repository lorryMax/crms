package com.sxt.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.sys.domain.Role;
import com.sxt.sys.mapper.RoleMapper;
import com.sxt.sys.service.RoleService;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {


	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public DataGridView queryAllRole(RoleVo roleVo) {
		//分页
		Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getRows());
		//查询数据
		List<Role> rows = this.roleMapper.queryAllRole(roleVo);
		return new DataGridView(page.getTotal(), rows);
	}

	@Override
	public void addRole(RoleVo roleVo) {
		
		this.roleMapper.insertSelective(roleVo);
	}

	@Override
	public void deleteRole(Integer roleid) {
		//删除sys_roels的数据
		this.roleMapper.deleteByPrimaryKey(roleid);
		//删除sys_roels_menus的数据
		this.roleMapper.deleteRoleMenuByRid(roleid);
	}

	@Override
	public void updateRole(RoleVo roleVo) {
		
		this.roleMapper.updateByPrimaryKeySelective(roleVo);
	}

	//保存分配
	@Override
	public void saveRoleMenus(RoleVo roleVo) {
	Integer roleid =roleVo.getRoleid();
	Integer[] mids=roleVo.getIds();
	//根据roleid把sys_role_menu里的数据删除
		this.roleMapper.deleteRoleMenuByRid(roleid);
		//重新添加
		if(null!=mids&&mids.length>0){
			for (Integer mid : mids) {
				this.roleMapper.saveRoleMenus(roleid,mid);
			}
		}


	}

}
