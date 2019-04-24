package com.sxt.sys.utils;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class TreeNode {
	
	private Integer id;
	@JsonProperty("pId")
	private Integer pid;
	private String name;
	private String icon;
	private String tabIcon;
	private Boolean isParent;
	private Boolean open;
	private String href;
	//分配菜单选中check属性
	private Boolean check;
	//构造标准的json树
	private String text;
	private List<TreeNode> children =new ArrayList<>();

	/**
	 * 角色分配菜单json树
	 */
	public TreeNode(Integer id, Integer pid, String name, String icon, Boolean isParent, Boolean open, Boolean check) {
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.icon = icon;
		this.isParent = isParent;
		this.open = open;
		this.check = check;
	}

	/**
	 * easyui的树对象
	 * @param id
	 * @param pid
	 * @param text
	 */
	public TreeNode(Integer id, Integer pid, String text) {
		this.id = id;
		this.pid = pid;
		this.text = text;
	}

	public Boolean getParent() {
		return isParent;
	}

	public void setParent(Boolean parent) {
		isParent = parent;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}

	public TreeNode() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 主页导航菜单构造方法
	 */
	public TreeNode(Integer id, Integer pid, String name, String icon,
			String tabIcon, Boolean isParent, Boolean open, String href) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.icon = icon;
		this.tabIcon = tabIcon;
		this.isParent = isParent;
		this.open = open;
		this.href = href;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getTabIcon() {
		return tabIcon;
	}
	public void setTabIcon(String tabIcon) {
		this.tabIcon = tabIcon;
	}
	public Boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	public Boolean getOpen() {
		return open;
	}
	public void setOpen(Boolean open) {
		this.open = open;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	
	

}
