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

<title>出租单管理</title>

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
<body>
	<!-- 搜索表单开始 -->
	<div class="easyui-panel" style="width:100%;"
		data-options="title:'查询条件',iconCls:'icon-search'">
		<form action="" id="searchFrm" method="post">
			<table align="center" width="100%" cellspacing="5px">
				<tr>
					<td width="33%"><input class="easyui-textbox" name="rentid"
						data-options="label:'出租单号:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%"><input class="easyui-textbox" name="carnumber"
						data-options="label:'车辆号牌:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%"><input class="easyui-textbox" name="identity"
						data-options="label:'身份证号:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
				</tr>
				<tr>
					<td width="33%"><input class="easyui-datetimebox" name="startTime"
						data-options="label:'起租时间:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%"><input class="easyui-datetimebox" name="endTime"
						data-options="label:'还车时间:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;"></td>
					<td width="33%">
						<div style="margin-bottom:20px">
							<label class="textbox-label" style="text-align: right;">出租状态:</label>
							<input class="easyui-radiobutton"
								data-options="labelAlign:'right',labelWidth:50" name="rentflag"
								value="1" label="已归还">
							<div style="display: inline-block;width: 30px"></div>
							<input class="easyui-radiobutton"
								data-options="labelAlign:'right',labelWidth:50" name="rentflag"
								value="0" label="未归还">
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
	<table id="rentTable" style="width:100%;height:350px"></table>
	<div id="toolbar">
		 <a class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true" id="updateRent">修改出租单</a>
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true" id="deleteRent">删除出租单</a>
	</div>
	<!-- 用户数据表格结束 -->
	<!-- 添加  修改的弹出层开始 -->
	<div id="dlg" class="easyui-dialog" style="width:600px;height: 400px"
		data-options="title:'添加用户',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
		<form action="" method="get" id="dataFrm">
			<div style="margin-bottom:20px;margin-top: 20px;">
				<input class="easyui-textbox" name="rentid" id="rentid"
					data-options="required:true,label:'出租单号:',labelPosition:'left',labelAlign:'right',prompt:'请输入身份证号'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="identity" id="identity"
					data-options="required:true,label:'身份证号:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户姓名'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="carnumber" id="carnumber"
					data-options="required:true,label:'出租车牌:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户地址'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="price"
					data-options="required:true,label:'出租价格:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户电话'"
					style="width:95%;">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-datetimebox" name="begindate"
					data-options="required:true,label:'起租时间:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户职位'"
					style="width:95%;">
			</div>
            <div style="margin-bottom:20px">
                <input class="easyui-datetimebox" name="returndate"
                       data-options="required:true,label:'还车时间:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户职位'"
                       style="width:95%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="opername" id="opername"
                       data-options="required:true,label:'操作员:',labelPosition:'left',labelAlign:'right',prompt:'请输入客户职位'"
                       style="width:95%;">
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
 $("#rentTable").datagrid({
	 title:'出租单列表',
	 iconCls:'icon-save',
	 singleSelect:true,
	 url:'${ctx}/rent/queryAllRent.action',
	 method:'get',
	 fitColumns:true,
	 toolbar:'#toolbar',
	 loadMsg:'数据正在努力加载中。。。',
	 emptyMsg:'查无数据',
	 pagination:true,
	 rownumbers:true,
	 columns:[[
	           {field:'rentid',width:80,title:'出租单号',width:100,align:'center'},
	           {field:'identity',width:100,title:'身份证号',align:'center'},
	           {field:'carnumber',width:80,title:'车辆号牌',align:'center'},
	           {field:'price',width:80,title:'出租价格',align:'center'},
	           {field:'begindate',width:80,title:'起租时间',align:'center'},
	           {field:'returndate',width:80,title:'还车时间',align:'center'},
	           {field:'rentflag',width:60,align:'center',title:'出租单状态',formatter:function(value,row,index){
	        	   return value==1?"<font color='red'>已归还</font>":'未归还';
	           }},
				 {field:'opername',width:80,title:'操作员',align:'center'},
	  ]]
 });
 //模糊查询
 $("#doSearch").click(function(){
	//得到表单数据
	var params=$("#searchFrm").serialize();
	$("#rentTable").datagrid({
		url:'${ctx}/rent/queryAllRent.action?'+params
	});
 });
 //打开修改页面
 $("#updateRent").click(function(){
	var row=$("#rentTable").datagrid("getSelected");
	if(row){
		$("#dlg").dialog("open").dialog("setTitle","修改出租单");
		//装载数据
		$("#dataFrm").form("load",row);
		//让身份证号不能编辑
		$("#rentid").textbox({readonly:true});
		$("#identity").textbox({readonly:true});
		$("#carnumber").textbox({readonly:true});
		$("#opername").textbox({readonly:true});
        url="${ctx}/rent/updateRent.action";
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
			     		   $("#rentTable").datagrid("reload");
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
 
 $("#deleteRent").click(function(){
		var row=$("#rentTable").datagrid("getSelected");
		if(row){
			 $.messager.confirm('提示','你确定要删除['+row.rentid+']这条出租单吗?',function(r){
				    if (r){
				       	$.post("${ctx}/rent/deleteRent.action",{rentid:row.rentid},function(obj){
				       		if(obj.code==200){
				       		 //刷新表格
						        $("#rentTable").datagrid("reload");
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
 </script>
</html>