package com.sxt.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sxt.sys.domain.Menu;
import com.sxt.sys.mapper.MenuMapper;
import com.sxt.sys.service.MenuService;
import com.sxt.sys.utils.DataGridView;
import com.sxt.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenus(MenuVo menuVo) {
        return this.menuMapper.queryAllMenus(menuVo);
    }

    @Override
    public List<Menu> queryAllMenusByUserId(Integer id) {
        Menu menuVo = new Menu();
        return this.menuMapper.queryAllMenus(menuVo);
    }

    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page<Object> page = PageHelper.startPage(menuVo.getPage(), menuVo.getRows());
        List<Menu> rows = this.menuMapper.queryAllMenus(menuVo);
        return new DataGridView(page.getTotal(),rows);

    }

    @Override
    public void addMenu(MenuVo menuVo) {
        this.menuMapper.insertSelective(menuVo);
    }

    @Override
    public void updateMenu(MenuVo menuVo) {
        this.menuMapper.updateByPrimaryKeySelective(menuVo);
    }

    @Override
    public void deleteMenu(Integer id) {
        //删出sys_role_menu里面mid=id的数据
        this.menuMapper.deleteRoleMenuByMid(id);
        //删除sys_menus里面的mid=id的数据
        this.menuMapper.deleteByPrimaryKey(id);
    }
    @Override
    public Integer queryAllCountByPid(Integer id) {
        return this.menuMapper.queryAllCountByPid(id);
    }

    @Override
    public List<Menu> queryAllMenuByRoleId(Integer roleid) {
        return this.menuMapper.queryAllMenuByRoleId(roleid);
    }

}
