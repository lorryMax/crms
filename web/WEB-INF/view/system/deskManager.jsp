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
	<div class="easyui-layout" style="width:100% ;height:400px">

		<div class="easyui-panel"
			data-options="region:'center',title:'系统公告',iconCls:'icon-save'">
			系统公告</div>
		<div class="easyui-panel"
			data-options="region:'east', title:'日期显示',iconCls:'icon-save',width:'30%'">
			<div class="easyui-calendar"
				data-options="border:false,width:'100%',height:'100%'"></div>
		</div>
	</div>
	<div style="height: 2px"></div>
	<div class="easyui-panel"
		data-options="title:'待还车辆预警',iconCls:'icon-save',height: '300px'">
		待还车辆预警</div>
</body>
</html>
