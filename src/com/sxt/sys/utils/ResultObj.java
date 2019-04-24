package com.sxt.sys.utils;

import com.sxt.sys.constast.SYSConstast;

public class ResultObj {

	/**
	 * 响应到页面的json对象的构造类
	 */
	private Integer code;
	private String msg;

	private ResultObj(Integer code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}
	/**
	 * 检察原始密码不正确
	 *
	 * @return
	 */
	public static ResultObj checkPwd() {
		return new ResultObj(SYSConstast.CODE_ERROR,
				SYSConstast.USER_PWD_ERROR);
	}

	/**
	 * 删除成功
	 * 
	 * @return
	 */
	public static ResultObj deleteOk() {
		return new ResultObj(SYSConstast.CODE_OK,
				SYSConstast.OPERATE_DELETE_SUCCESS);
	}

	/**
	 * 删除失败
	 * 
	 * @return
	 */
	public static ResultObj deleteError() {
		return new ResultObj(SYSConstast.CODE_ERROR,
				SYSConstast.OPERATE_DELETE_ERROR);
	}

	/**
	 * 添加成功
	 * 
	 * @return
	 */
	public static ResultObj addOk() {
		return new ResultObj(SYSConstast.CODE_OK,
				SYSConstast.OPERATE_ADD_SUCCESS);
	}

	/**
	 * 添加失败
	 * 
	 * @return
	 */
	public static ResultObj addError() {
		return new ResultObj(SYSConstast.CODE_ERROR,
				SYSConstast.OPERATE_ADD_ERROR);
	}

	/**
	 * 修改成功
	 * 
	 * @return
	 */
	public static ResultObj updateOk() {
		return new ResultObj(SYSConstast.CODE_OK,
				SYSConstast.OPERATE_UPDATE_SUCCESS);
	}

	/**
	 * 修改失败
	 * 
	 * @return
	 */
	public static ResultObj updateError() {
		return new ResultObj(SYSConstast.CODE_ERROR,
				SYSConstast.OPERATE_UPDATE_ERROR);
	}

	/**
	 * 分配成功
	 * 
	 * @return
	 */
	public static ResultObj dispatchOk() {
		return new ResultObj(SYSConstast.CODE_OK,
				SYSConstast.OPERATE_DISPATCH_SUCCESS);
	}

	/**
	 * 分配失败
	 * 
	 * @return
	 */
	public static ResultObj dispatchError() {
		return new ResultObj(SYSConstast.CODE_ERROR,
				SYSConstast.OPERATE_DISPATCH_ERROR);
	}

	/**
	 * 重置成功
	 * 
	 * @return
	 */
	public static ResultObj resetOk() {
		return new ResultObj(SYSConstast.CODE_OK,
				SYSConstast.OPERATE_RESET_SUCCESS);
	}

	/**
	 * 重置失败
	 * 
	 * @return
	 */
	public static ResultObj resetError() {
		return new ResultObj(SYSConstast.CODE_ERROR,
				SYSConstast.OPERATE_RESET_ERROR);
	}

    public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
