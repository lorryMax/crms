package com.sxt.sys.constast;

/**
 * 常量配置接口
 * 
 * @author LJH
 * 
 */
public interface SYSConstast {
	// 登陆提示
	String USER_LOGIN_ERROR = "用户名或密码不正确！";
	String USER_PWD_ERROR="原始密码不正确";
	// 超级管理员
	Integer USER_TYPE_SUPER = 1;
	// 是否展开
	Integer OPEN_TRUE = 1;
	Integer OPEN_FALSE = 0;
	// 是否父节点
	Integer ISPARENT_TRUE = 1;
	Integer ISPARENT_FALSE = 0;

	// 用户操作数据常量
	Integer CODE_OK = 200;
	Integer CODE_ERROR = -1;

	// 操作员操作
	String OPERATE_DELETE_SUCCESS = "删除成功";
	String OPERATE_DELETE_ERROR = "删除失败";

	String OPERATE_ADD_SUCCESS = "添加成功";
	String OPERATE_ADD_ERROR = "添加失败";

	String OPERATE_UPDATE_SUCCESS = "修改成功";
	String OPERATE_UPDATE_ERROR = "修改失败";

	String OPERATE_DISPATCH_SUCCESS = "分配成功";
	String OPERATE_DISPATCH_ERROR = "分配失败";
	String OPERATE_RESET_SUCCESS = "重置成功";
	String OPERATE_RESET_ERROR = "重重失败";

	//设置默认密码
    String USER_RESET_PWD = "123456";
    //设置菜单可用
    Integer AVAILABLE_TRUE =1 ;
}
