<%@ page language="java" pageEncoding="UTF-8" %>
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
    <title>检查单管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css"
          href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript"
            src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript"
            src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${ctx }/resources/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript"
            src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 搜索表单开始 -->
<div class="easyui-panel" style="width:100%; text-align: center ; padding: 20px"
     data-options="title:'查询条件',iconCls:'icon-search'">
    <form action="" id="searchFrm" method="post">
        <table align="center" width="100%" cellspacing="5px">
            <tr>
                <td width="33%"><input class="easyui-textbox" name="checkid"
                                       data-options="label:'检查单号:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="rentid"
                                       data-options="label:'出租单号:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="checkdesc"
                                       data-options="label:'存在问题:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
            </tr>
            <tr>
                <td width="33%"><input class="easyui-datetimebox" name="startTime"
                                       data-options="label:'起租时间:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-datetimebox" name="endTime"
                                       data-options="label:'还车时间:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="problem"
                                       data-options="label:'问题描述:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
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
<div style="height: 10px;"></div>
<!-- 搜索表单结束-->
<!-- 检查单数据表格开始 -->
<table id="checkTable" style="width:100%;height:350px"></table>
<div id="toolbar">
    <a class="easyui-linkbutton"
        data-options="iconCls:'icon-edit',plain:true" id="updateCheck">修改检查单</a>
</div>
<!-- 用户数据表格结束 -->
<!-- 修改的弹出层开始 -->
<div id="dlg" class="easyui-dialog" style="width:600px;"
     data-options="title:'修改检查单',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
    <form action="" method="post" id="dataFrm">
        <div style="margin-bottom:20px;margin-top: 20px;">
            <input class="easyui-textbox" name="checkid" readonly
                   data-options="required:true,label:'检查单号:',labelPosition:'left',labelAlign:'right',prompt:'请输入车辆号牌'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="rentid" readonly
                   data-options="required:true,label:'出租单号:',labelPosition:'left',labelAlign:'right',prompt:'请输入车辆类型'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="checkdate" readonly
                   data-options="required:true,label:'检查日期:',labelPosition:'left',labelAlign:'right',prompt:'请输入车辆颜色'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="checkdesc"
                   data-options="required:true,label:'存在问题:',labelPosition:'left',labelAlign:'right',prompt:'请输入购买价格'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="problem"
                   data-options="required:true,label:'问题描述:',labelPosition:'left',labelAlign:'right',prompt:'请输入出租价格'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="paymoney"
                   data-options="required:true,label:'赔付金额:',labelPosition:'left',labelAlign:'right',prompt:'请输入出租押金'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="opername" readonly
                   data-options="required:true,label:'操作员:',labelPosition:'left',labelAlign:'right',prompt:'请输入出租描述'"
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
    $("#checkTable").datagrid({
        title: '检查单列表',
        iconCls: 'icon-save',
        singleSelect: true,
        url: '${ctx}/check/queryAllCheck.action',
        method: 'get',
        fitColumns: true,
        toolbar: '#toolbar',
        loadMsg: '数据正在努力加载中。。。',
        emptyMsg: '查无数据',
        pagination: true,
        rownumbers: true,
        columns: [[
            {field: 'checkid', width: 80, title: '检查单号', width: 100, align: 'center'},
            {field: 'checkdate', width: 100, title: '检查日期', align: 'center'},
            {field: 'checkdesc', width: 80, title: '存在问题', align: 'center'},
            {field: 'problem', width: 80, title: '问题描述', align: 'center'},
            {field: 'paymoney', width: 80, title: '赔付金额', align: 'center'},
            {field: 'rentid', width: 80, title: '出租单号', align: 'center'},
            {field: 'opername', width: 80, title: '操作员', align: 'center'},
        ]],
    });
    //模糊查询
    $("#doSearch").click(function () {
        //得到表单数据
        var params = $("#searchFrm").serialize();
        $("#checkTable").datagrid({
            url: '${ctx}/check/queryAllCheck.action?' + params
        });
    });
    //修改检查单
    $("#updateCheck").click(function () {
        //选中一行
        var row = $("#checkTable").datagrid("getSelected");
        if(row){
            $("#dlg").dialog("open").dialog("setTitle","修改检查单");
            //装载数据
            $("#dataFrm").form("load",row);
        }else{
            $.messager.show({
                title:'提示',
                msg:'请选中一行',
            });
        };
    });
//保存
    $("#doSubmit").click(function () {
        //打开进度条
        $.messager.progress();
        $('#dataFrm').form('submit', {
            url: "${ctx}/check/updateCheck.action",
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
                var data = eval('('+obj+')');  //把json的 字符串转在js的对象
              if(data.code==200){
                  //保存成功 ,刷新页面
                  $("#checkTable").datagrid("reload");
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
</script>
</html>