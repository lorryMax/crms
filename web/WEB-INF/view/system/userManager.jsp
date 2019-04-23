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
    <title>用户管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${ctx }/resources/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
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
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.excheck.min.js"></script>
</head>

<body>
<!-- 搜索表单开始 -->
<div class="easyui-panel" style="width:100%;"
     data-options="title:'查询条件',iconCls:'icon-search'">
    <form action="" id="searchFrm" method="post">
        <table align="center" width="100%" cellspacing="5px">
            <tr>
                <td width="33%"><input class="easyui-textbox" name="identity"
                                       data-options="label:'身份证号:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="loginname"
                                       data-options="label:'登陆名称:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="realname"
                                       data-options="label:'真实姓名:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
            </tr>
            <tr>
                <td width="33%"><input class="easyui-textbox" name="address"
                                       data-options="label:'用户地址:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="phone"
                                       data-options="label:'用户电话:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="position"
                                       data-options="label:'用户职位:',labelPosition:'left',labelAlign:'right'"
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
<!-- 搜索表单结束-->
<div style="height: 2px"></div>
<!-- 用户数据表格开始 -->
<table id="userTable" style="width:100%;height:350px"></table>
<div id="toolbar">
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true" id="addUser">添加用户</a> <a
        class="easyui-linkbutton"
        data-options="iconCls:'icon-edit',plain:true" id="updateUser">修改用户</a>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true" id="deleteUser">删除用户</a>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true" id="resetPwd">重置密码</a>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true" id="selectUserRole">分配角色</a>
</div>
<!-- 用户数据表格结束 -->
<!-- 添加  修改的弹出层开始 -->
<div id="dlg" class="easyui-dialog" style="width:600px; position: relative"
     data-options="title:'添加用户',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
    <form action="" method="post" id="dataFrm">
        <div style="margin-bottom:20px;margin-top: 20px;">
            <input type="hidden" id="userid" name="userid">
            <input class="easyui-textbox" name="realname" id="realname"
                   data-options="required:true,label:'用户姓名:',labelPosition:'left',labelAlign:'right',prompt:'请输入用户姓名'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="loginname"
                   data-options="required:true,label:'登陆名称:',labelPosition:'left',labelAlign:'right',prompt:'请输入登陆名称'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="identity" id="identity"
                   data-options="required:true,label:'身份证号:',labelPosition:'left',labelAlign:'right',prompt:'请输入用户身份证号'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="address"
                   data-options="required:true,label:'用户地址:',labelPosition:'left',labelAlign:'right',prompt:'请输入用户地址'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="phone"
                   data-options="required:true,label:'用户电话:',labelPosition:'left',labelAlign:'right',prompt:'请输入用户电话'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="position"
                   data-options="required:true,label:'用户职位:',labelPosition:'left',labelAlign:'right',prompt:'请输入用户职位'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <label class="textbox-label"
                   style="text-align: right;">用户性别:</label> <input
                class="easyui-radiobutton"
                data-options="labelAlign:'right',labelWidth:50" name="sex"
                value="1" label="男">
            <div style="display: inline-block;width: 30px"></div>
            <input
                    class="easyui-radiobutton"
                    data-options="labelAlign:'right',labelWidth:50" name="sex"
                    value="0" label="女">
        </div>
        <div style="margin-bottom:20px">
            <label class="textbox-label"
                   style="text-align: right;">是否可用:</label> <input
                class="easyui-radiobutton"
                data-options="labelAlign:'right',labelWidth:50" name="available"
                value="1" label="可用">
            <div style="display: inline-block;width: 30px"></div>
            <input
                    class="easyui-radiobutton"
                    data-options="labelAlign:'right',labelWidth:50" name="available"
                    value="0" label="不可以">
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
<!---分配用户弹出层开始---->
<div id="user_dlg" class="easyui-dialog" style="width:400px;height: 600px"
     data-options="title:'添加角色',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#user_dlg_buttons'
		">
    <form action="" method="post" id="roleDataFrm">
       <table id="roleTable"  border="0"></table>
    </form>
</div>
<div id="user_dlg_buttons" style="text-align:center;">
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save'"
       id="doSaveUserRole">确认分配</a> <a class="easyui-linkbutton"
                               data-options="iconCls:'icon-cancel'"
                               onclick="javascript:$('#user_dlg').dialog('close');">取消分配</a>
</div>
<!---分配用户弹出层结束---->
</body>
<script type="text/javascript">
    //加载表格数据
    $("#userTable").datagrid({
        title: '客户列表',
        iconCls: 'icon-save',
        singleSelect: true,
        url: '${ctx}/user/queryAllUser.action',
        method: 'get',
        fitColumns: true,
        toolbar: '#toolbar',
        loadMsg: '数据正在努力加载中。。。',
        emptyMsg: '查无数据',
        pagination: true,
        rownumbers: true,
        columns: [[
            {field: 'userid', width: 80, title: '编号', width: 100, align: 'center'},
            {field: 'identity', width: 100, title: '身份证号', align: 'center'},
            {field: 'loginname', width: 80, title: '登陆名', align: 'center'},
            {field: 'realname', width: 80, title: '真实名称', align: 'center'},
            {field: 'address', width: 80, title: '用户地址', align: 'center'},
            {field: 'phone', width: 80, title: '用户电话', align: 'center'},
            {field: 'pwd', width: 80, title: '用户密码', align: 'center'},
            {field: 'position', width: 80, title: '用户职位', align: 'center'},
            {
                field: 'sex', width: 60, align: 'center', title: '用户性别',
                formatter: function (value, row, index) {
                    return value == 1 ? "<font color='blue'>男</font>" : "<font color='red'>女</font>";
                }
            },
            {
                field: 'available', width: 60, align: 'center', title: '是否可以',
                formatter: function (value, row, index) {
                    return value == 1 ? "<font color='blue'>可用</font>" : "<font color='red'>不可用</font>";
                }
            }
        ]],
    });
    //模糊查询
    $("#doSearch").click(function () {
        //得到表单数据
        var params = $("#searchFrm").serialize();
        $("#userTable").datagrid({
            url: '${ctx}/user/queryAllUser.action?' + params
        });
    });
    var url;
    //点击添加
    $("#addUser").click(function () {
        //打开弹出层
        $("#dlg").dialog("open").dialog("setTitle", "添加用户");
        //清空form表单数据
        $("#dataFrm").form("clear");
        //让身份证不能编辑
        $("#identity").textbox({readonly: false});
        //让姓名不能改
        $("#realname").textbox({readonly: false});
        //默认选中可用，女的用户
        $("#dataFrm").form("load", {available: 1, sex: 0});
        url = '${ctx}/user/addUser.action';
    });
    //点击修改
    $("#updateUser").click(function () {
        //获取数据
        var row = $("#userTable").datagrid("getSelected");
        if (row) {
            //打开弹出层
            $("#dlg").dialog("open").dialog("setTitle", "修改用户");
            //装载数据
            $("#dataFrm").form("load", row);
            //让身份证不能编辑
            $("#identity").textbox({readonly: true});
            //让姓名不能改
            $("#realname").textbox({readonly: true});
            //请求路径
            url = '${ctx}/user/updateUser.action';
        } else {
            //提示选中一行
            $.messager.show({
                title: '提示',
                msg: "请选中一行"
            });
        }
    });
    //点击保存
    $("#doSubmit").click(function () {
        //显示进度条
        $.messager.progress();
        //提交数据
        $("#dataFrm").form("submit", {
            //请求路径
            url: url,
            method: 'post',
            onSubmit: function () {
                //触发表单的验证
                var isValidate = $(this).form("validate");
                if (!isValidate) {
                    //验证失败,关闭进度条
                    $.messager.progress("close");
                }
                //成功
                return isValidate;
            },
            success: function (obj) {
                $.messager.progress("close");
                var data = eval('(' + obj + ')');  //把json的 字符串转在js的对象
                if (data.code == 200) {
                    //保存成功 ,刷新页面
                    $("#userTable").datagrid("reload");
                }
                //保存失败, 提示
                $.messager.show({
                    title: '提示',
                    msg: data.msg,
                });
                //关闭弹出层
                $("#dlg").dialog("close");
            },
        });
    });
    //删除
    $("#deleteUser").click(function () {
        //获取选中行
        var row = $("#userTable").datagrid("getSelected");
        if (row) {
            //提示是否确认要删除
            $.messager.confirm("提示", '确认要删除[' + row.realname + ']这条用户信息吗？', function (r) {
                if (r) {//确认要删除
                    $.post("${ctx}/user/deleteUser.action", {userid: row.userid}, function (data) {
                        if (data.code == 200) {
                            //删除成功
                            //刷新表格
                            $("#userTable").datagrid("reload");
                        }//删除失败
                        $.messager.show({
                            title: '提示',
                            msg: data.msg,
                        });
                    });
                }
            });
        } else {
            //没有选中，提示
            $.messager.show({
                title: '提示',
                msg: '请选中一行'
            });
        }
    });
    //重值密码
    $("#resetPwd").click(function () {
        //获取选中行
        var row = $("#userTable").datagrid("getSelected");
        if (row) {
            //提示是否确认要重置密码
            $.messager.confirm("提示", '确认要重置[' + row.realname + ']这条用户的密码吗？', function (r) {
                if (r) {//确认要重置
                    $.post("${ctx}/user/resetUserPwd.action", {userid: row.userid}, function (data) {
                        if (data.code == 200) {
                            //重值成功
                            //刷新表格
                            $("#userTable").datagrid("reload");
                        }//重值失败
                        $.messager.show({
                            title: '提示',
                            msg: data.msg,
                        });
                    });
                }
            });
        } else {
            //没有选中，提示
            $.messager.show({
                title: '提示',
                msg: '请选中一行'
            });
        }
    });

    //初始化角色表格数据
    function initRoleDataTree(userid){
        //加载表格数据
        $("#roleTable").datagrid({
            singleSelect:false,
            url:'${ctx}/user/loadUserManagerSelectRole.action?userid='+userid,
            method:'get',
            border:false,
            fitColumns:true,
            loadMsg:'数据正在努力加载中。。。',
            emptyMsg:'查无数据',
            columns: [[
                {field: 'ck', width: 80, checkbox:true, width: 100, align: 'center'},
                {field: 'roleid', width: 80, title: '角色编号', width: 100, align: 'center'},
                {field: 'rolename', width: 100, title: '角色名称', align: 'center'},
                {field: 'roledesc', width: 80, title: '角色备注', align: 'center'},
            ]],
            onLoadSuccess:function(data){
                var rows=data.rows;
                for (var i = 0; i < rows.length; i++) {
                    if(rows[i].ck){
                        $("#roleTable").datagrid("selectRow",i);
                    }
                }
            }
        });
    }
    //分配角色
    $("#selectUserRole").click(function () {
        //获取选中行
        var row = $("#userTable").datagrid("getSelected");
        if(row){
            //打开弹出层
            $("#user_dlg").dialog("open").dialog("setTitle", "给["+row.realname+"]分配角色");
            //装载角色树
            initRoleDataTree(row.userid);
        }else{
            //没有选中，提示
            $.messager.show({
                title: '提示',
                msg: '请选中一行'
            });
        }
    });
    //保存用户和角色之间的关系
    $("#doSaveUserRole").click(function(){
        var row=$("#userTable").datagrid("getSelected");
        var userid=row.userid;
        //得到roleTable的选中行
        var ckRows=$("#roleTable").datagrid("getSelections");
        var params="userid="+userid;
        for (var i = 0; i < ckRows.length; i++) {
            params+="&ids="+ckRows[i].roleid;
        }
        //alert(params);
        $.post("${ctx}/user/saveUserRoles.action",params,function(obj){
            $.messager.show({
                title:"提示",
                msg:obj.msg
            });
        });

    });

</script>
</html>