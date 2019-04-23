<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>工作台</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="${ctx }/resources/easyui/themes/metro/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/resources/css/wu.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/resources/css/icon.css" />
<script type="text/javascript"
	src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>

	<!-- 搜索表单开始 -->
	<div class="easyui-panel" style="width:'100%';"
		data-options="title:'查询条件',iconCls:'icon-search'">
		<form action="" id="searchFrm" method="post">
			<table align="center" width="100%" cellspacing="5px">
				<tr>
					<td width="33%"><input class="easyui-textbox" name="identity"
						data-options="label:'身份证号:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%"><input class="easyui-textbox" name="custname"
						data-options="label:'客户姓名:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%"><input class="easyui-textbox" name="address"
						data-options="label:'客户地址:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
				</tr>
				<tr>
					<td width="33%"><input class="easyui-textbox" name="phone"
						data-options="label:'客户电话:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%"><input class="easyui-textbox" name="career"
						data-options="label:'客户职位:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%">
						<div style="margin-bottom:20px">
							<label class="textbox-label" style="text-align: right;">性别:</label>
							<input class="easyui-radiobutton"
								data-options="labelAlign:'right',labelWidth:50" name="sex"
								value="1" label="男">
							<div style="display: inline-block;width: 30px"></div>
							<input class="easyui-radiobutton"
								data-options="labelAlign:'right',labelWidth:50" name="sex"
								value="0" label="女">
						</div>

					</td>
				</tr>
				<tr>
					<td align="center" colspan="11"><a class="easyui-linkbutton"
						data-options="iconCls:'icon-save'" id="doSearch">查询</a> <a
						class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
						onclick="javascript:$('#searchFrm').form('reset');">重置</a></td>
				</tr>
			</table>
		</form>

	</div>
	<!-- 搜索表单结束-->
	<div style="height: 2px"></div>
	<!-- 用户数据表格开始 -->
	<table id="customerTable" style="width:'100%';height:350px"></table>
	<div id="toolbar">
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" id="addCustomer">添加客户</a> <a
			class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true" id="updateCustomer">修改客户</a>
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true" id="deleteCustomer">删除客户</a>
		<a class="easyui-linkbutton"
		   data-options="iconCls:'icon-remove',plain:true" id="exportCustomer">导出客户</a>
	</div>
	<!-- 用户数据表格结束 -->

	<!-- 添加  修改的弹出层开始 -->
	<div id="dlg" class="easyui-dialog" style="width:600px;height: 400px"
		data-options="title:'添加用户',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
		<form action="" method="get" id="dataFrm">
			<div style="margin-bottom:20px;margin-top: 20px;">
				<input class="easyui-textbox" name="identity" id="identity"
					data-options="required:true,label:'身份证号:',labelPosition:'left',labelAlign:'right',prompt:'请输入身份证号'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="custname"
					data-options="required:true,label:'客户姓名:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户姓名'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="address"
					data-options="required:true,label:'客户地址:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户地址'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="phone"
					data-options="required:true,label:'客户电话:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户电话'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="career"
					data-options="required:true,label:'客户职位:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户职位'"
					style="width:95%;">
			</div>
			
			<div style="margin-bottom:20px">
				<label class="textbox-label" style="text-align: right;">性别:</label>
				<input class="easyui-radiobutton"
					data-options="labelAlign:'right',labelWidth:50" name="sex"
					value="1" label="男" checked="checked">
				<div style="display: inline-block;width: 30px"></div>
				<input class="easyui-radiobutton"
					data-options="labelAlign:'right',labelWidth:50" name="sex"
					value="0" label="女">
			</div>
		</form>
	</div>

	<div id="dlg-buttons" style="text-align:center;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-save'"
			id="doSubmit">保存</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'"
			onclick="javascript:$('#dlg').dialog('close');">取消</a>
	</div>
	<!-- 添加  修改的弹出层结束 -->
</body>
 <script type="text/javascript">
 
 //加载表格数据
 $("#customerTable").datagrid({
	 title:'客户列表',
	 iconCls:'icon-save',
	 singleSelect:true,
	 url:'${ctx}/customer/loadAllCustomer.action',
	 method:'get',
	 fitColumns:true,
	 toolbar:'#toolbar',
	 loadMsg:'数据正在努力加载中。。。',
	 emptyMsg:'查无数据',
	 pagination:true,
	 rownumbers:true,
	 columns:[[
	           {field:'identity',width:80,title:'客户编号',width:100,align:'center'},
	           {field:'custname',width:100,title:'客户姓名',align:'center'},
	           {field:'address',width:80,title:'客户地址',align:'center'},
	           {field:'phone',width:80,title:'客户电话',align:'center'},
	           {field:'career',width:80,title:'客户职位',align:'center'},
	           {field:'sex',width:60,align:'center',title:'客户性别',formatter:function(value,row,index){
	        	   return value==1?'男':'女';
	           }}
	          
	  ]]
 });
 
 //模糊查询
 $("#doSearch").click(function(){
	//得到表单数据
	var params=$("#searchFrm").serialize();
	$("#customerTable").datagrid({
		url:'${ctx}/customer/loadAllCustomer.action?'+params
	});
 });
 var url;
 //打开添加页面
 $("#addCustomer").click(function(){
	 $("#dlg").dialog("open").dialog("setTitle","添加客户");
	//让身份证号能编辑
	 $("#identity").textbox({readonly:false});
	 //清空form里面的数据
	 $("#dataFrm").form("clear");
	 url="${ctx}/customer/addCustomer.action";
 });
 //打开修改页面
 $("#updateCustomer").click(function(){
	var row=$("#customerTable").datagrid("getSelected");
	if(row){
		$("#dlg").dialog("open").dialog("setTitle","修改客户");
		//装载数据
		$("#dataFrm").form("load",row);
		//让身份证号不能编辑
		$("#identity").textbox({readonly:true});
		 url="${ctx}/customer/updateCustomer.action";
	}else{
		$.messager.show({
			title:"提示",
			msg:'请选中操作行'
		});
	}
 });
 //保存
  $("#doSubmit").click(function(){
	  $.messager.progress();	// 显示进度条
		 $('#dataFrm').form('submit', {
				url: url,
				method:'post',
				onSubmit: function(){
					var isValid = $(this).form('validate');//触发验证
					if (!isValid){
						$.messager.progress('close');	// 验证失败后关闭进度条
					}
					return isValid;	// 返回验证状态
				},
				success: function(obj){//提交成功之后的回调方法
					$.messager.progress('close');	//关闭进度条
					 //刷新表格
					//{"code":200,"msg":"添加成功"}  
					 var data = eval('('+obj+')');  //把json的 字符串转在js的对象 
					 if(data.code==200){
			     		   $("#customerTable").datagrid("reload");
					 }
					 $.messager.show({
						 title:'提示',
						 msg:data.msg
					 });
					 //关闭弹出层
					 $("#dlg").dialog("close");
				}
			});
 });
 
 $("#deleteCustomer").click(function(){
		var row=$("#customerTable").datagrid("getSelected");
		if(row){
			 $.messager.confirm('提示','你确定要删除['+row.custname+']这个客户吗?',function(r){
				    if (r){
				       	$.post("${ctx}/customer/deleteCustomer.action",{identity:row.identity},function(obj){
				       		if(obj.code==200){
				       		 //刷新表格
						        $("#customerTable").datagrid("reload");
				       		}
					       	 $.messager.show({
								 title:'提示',
								 msg:obj.msg
							 });
				       	});
				       
				    }
				});
		}else{
			$.messager.show({
				title:"提示",
				msg:'请选中操作行'
			});
		}
	 });

 //导出客户
	 $("#exportCustomer").click(function () {
	 	//获取表单数据
		 var param=$("#customerTable").serialize();
		 window.location.href="${ctx}/customer/exportCustomer.action?"+param;
	 })

 </script>
</html>