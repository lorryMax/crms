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
<title>日志管理</title>
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
  <div class="easyui-panel" style="width:'100%';" data-options="title:'查询条件',iconCls:'icon-search'">
  	<form action="" id="searchFrm" method="post">
  		<table align="center" width="100%" cellspacing="5px">
  			<tr>
  				<td width="33%">
            		<input class="easyui-textbox" name="loginname"  data-options="label:'登陆用户:',labelPosition:'left',labelAlign:'right'" style="width:95%;">
  				</td>
  				<td width="33%">
  				    <input class="easyui-textbox" name="loginip"  data-options="label:'登陆地址:',labelPosition:'left',labelAlign:'right'" style="width:95%;">
  				</td>
  				
  			</tr>
  			<tr>
  				<td width="33%">
            		<input class="easyui-datetimebox" name="startTime"  data-options="label:'开始时间:',labelPosition:'left',labelAlign:'right'" style="width:95%;">
  				</td>
  				<td width="33%">
  				    <input class="easyui-datetimebox" name="endTime"
						data-options="label:'结束时间:',labelPosition:'left',labelAlign:'right'"
						style="width:95%;">
					</td>
  				
  			</tr>	
  			<tr>
  				<td align="center" colspan="11">
  					<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="doSearch">查询</a>
	    			<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="javascript:$('#searchFrm').form('reset');">重置</a>
  				</td>
  			</tr>
  		</table>
  	</form>
  
  </div>
  
  <!-- 搜索表单结束-->
  <div style="height: 2px"></div>
  <!-- 用户数据表格开始 -->
	<table id="logInfoTable" style="width:'100%';height:350px" ></table>
	<div id="toolbar">
		<a  class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="deleteLogInfo">删除日志</a>
	</div>
  <!-- 用户数据表格结束 -->
  
  </body>
 <script type="text/javascript">
 
 //加载表格数据
 $("#logInfoTable").datagrid({
	 title:'用户列表',
	 iconCls:'icon-save',
	 singleSelect:true,
	 collapsible:true,
	 url:'${ctx}/logInfo/logInfo.action',
	 method:'get',
	 fitColumns:true,
	 toolbar:'#toolbar',
	 loadMsg:'数据正在努力加载中。。。',
	 emptyMsg:'查无数据',
	 pagination:true,
	 rownumbers:true,
	 pagePosition:'bottom',
	 pageNumber:1,
	 pageSize:10,
	 pageList:[5,10,15,20,25],
	 columns:[[
	           {field:'id',width:80,title:'日志编号',width:100,align:'center',halign:'center'},
	           {field:'loginname',width:100,align:'center',hidden:false,title:'登陆用户'},
	           {field:'loginip',width:80,align:'center',sortable:true,title:'登陆地址'},
	           {field:'logintime',width:80,align:'center',title:'登陆时间'}
	          
	  ]],
 });
 //模糊查询
 $("#doSearch").click(function(){
	//得到表单数据
	var params=$("#searchFrm").serialize();
	$("#logInfoTable").datagrid({
		url:'${ctx}/logInfo/logInfo.action?'+params
	});
 });

 $("#deleteLogInfo").click(function(){
		var row=$("#logInfoTable").datagrid("getSelected");
		if(row){
			 $.messager.confirm('提示','你确定要删除['+row.loginname+']这条日志吗?',function(r){
				    if (r){
				    	$.post("${ctx}/logInfo/deleteLogInfo.action",{id:row.id},function(obj){
				    		if(obj.code==200){
				    			//删除成功
				    			 //刷新表格
				    			 $("#logInfoTable").datagrid("reload");
				    		}
				    		$.messager.show({
				    			title:'提示',
				    			msg:obj.msg
				    		})
				    		
				    		
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