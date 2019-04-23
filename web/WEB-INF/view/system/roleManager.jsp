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
    <title>角色管理</title>
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
<body>
<!-- 搜索表单开始 -->
<div class="easyui-panel" style="width:100%;"
     data-options="title:'查询条件',iconCls:'icon-search'">
    <form action="" id="searchFrm" method="post">
        <table align="center" width="100%" cellspacing="5px">
            <tr>
                <td width="33%"><input class="easyui-textbox" name="rolename"
                                       data-options="label:'角色名称:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="roledesc"
                                       data-options="label:'角色备注:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%">
                    <div style="margin-bottom:10px">
                        <label class="textbox-label" style="text-align: right;">是否可用:</label>
                        <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50"
                               name="available" value="1"
                               label="是">
                        <div style="display: inline-block;width: 30px"></div>
                        <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50"
                               name="available" value="0"
                               label="否">
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
<table id="roleTable" style="width:100%;height:350px"></table>
<div id="toolbar">
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true" id="addRole">添加角色</a> <a
        class="easyui-linkbutton"
        data-options="iconCls:'icon-edit',plain:true" id="updateRole">修改角色</a>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true" id="deleteRole">删除角色</a>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true" id="selectRoleMenu">角色分配菜单</a>
</div>
<!-- 用户数据表格结束 -->
<!-- 添加  修改的弹出层开始 -->
<div id="dlg" class="easyui-dialog" style="width:600px;"
     data-options="title:'添加角色',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
    <form action="" method="post" id="dataFrm">
        <div style="margin-bottom:20px;margin-top: 20px;">
            <input type="hidden" id="roleid" name="roleid">
            <input class="easyui-textbox" name="rolename" id="rolename"
                   data-options="required:true,label:'角色名称:',labelPosition:'left',labelAlign:'right',prompt:'请输入角色名称'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="roledesc"
                   data-options="required:true,label:'角色备注:',labelPosition:'left',labelAlign:'right',prompt:'请输入角色备注'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:10px">
            <label class="textbox-label" style="text-align: right;">是否可用:</label>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50"
                   name="available" value="1"
                   label="是">
            <div style="display: inline-block;width: 30px"></div>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50"
                   name="available" value="0"
                   label="否">
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
<!-----角色分配菜单弹出层开始---->
<div id="role_dlg" class="easyui-dialog" style="width:400px;height: 600px"
     data-options="title:'添加角色',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#role_dlg_buttons'
		">
    <form action="" method="post" id="roleDataFrm">
        <!--分配菜单树-->
        <div class="ztree" id="menuTree"></div>
    </form>
</div>
<div id="role_dlg_buttons" style="text-align:center;">
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save'"
       id="doSelectMenu">确认分配</a> <a class="easyui-linkbutton"
                               data-options="iconCls:'icon-cancel'"
                               onclick="javascript:$('#role_dlg').dialog('close');">取消分配</a>
</div>
<!-----角色分配菜单弹出层结束---->
</body>
<script type="text/javascript">
    //加载表格数据
    $("#roleTable").datagrid({
        title: '角色列表',
        iconCls: 'icon-save',
        singleSelect: true,
        url: '${ctx}/role/queryAllRole.action',
        method: 'get',
        fitColumns: true,
        toolbar: '#toolbar',
        loadMsg: '数据正在努力加载中。。。',
        emptyMsg: '查无数据',
        pagination: true,
        rownumbers: true,
        columns: [[
            {field: 'roleid', width: 80, title: '角色编号', width: 100, align: 'center'},
            {field: 'rolename', width: 100, title: '角色名称', align: 'center'},
            {field: 'roledesc', width: 80, title: '角色备注', align: 'center'},
            {
                field: 'available', width: 60, align: 'center', title: '是否可用',
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
        $("#roleTable").datagrid({
            url: '${ctx}/role/queryAllRole.action?' + params
        });
    });
    var url;
    //点击添加
    $("#addRole").click(function () {
        //打开弹出层
        $("#dlg").dialog("open").dialog("setTitle", "添加角色");
        //清空form表单数据
        $("#dataFrm").form("clear");
        //默认选中可用的角色
        $("#dataFrm").form("load", {available: 1});
        url = '${ctx}/role/addRole.action';
    });
    //点击修改
    $("#updateRole").click(function () {
        //获取数据
        var row = $("#roleTable").datagrid("getSelected");
        if (row) {
            //打开弹出层
            $("#dlg").dialog("open").dialog("setTitle", "修改角色");
            //装载数据
            $("#dataFrm").form("load", row);
            //请求路径
            url = '${ctx}/role/updateRole.action';
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
                    $("#roleTable").datagrid("reload");
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
    $("#deleteRole").click(function () {
        //获取选中行
        var row = $("#roleTable").datagrid("getSelected");
        if (row) {
            //提示是否确认要删除
            $.messager.confirm("提示", '确认要删除[' + row.rolename + ']这条角色信息吗？', function (r) {
                if (r) {//确认要删除
                    $.post("${ctx}/role/deleteRole.action", {roleid: row.roleid}, function (data) {
                        if (data.code == 200) {
                            //删除成功
                            //刷新表格
                            $("#roleTable").datagrid("reload");
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

    //分配菜单
    $("#selectRoleMenu").click(function () {
        //获取选中行
        var row = $("#roleTable").datagrid("getSelected");
        if (row) {
            //打开弹出层
            $("#role_dlg").dialog("open").dialog("setTitle", "分配[" + row.rolename + "]角色");
            //装载菜单树数据
            initRoleDataTree(row.roleid);
        } else {
            //没有选中，提示
            $.messager.show({
                title: '提示',
                msg: '请选中一行'
            });
        }
    });
    //初始化菜单树数据
    function initRoleDataTree(roleid) {
        $.get("${ctx}/role/loadAllMenuTressJson.action", {roleid: roleid}, function (zNodes) {
            $.fn.zTree.init($("#menuTree"), setting, zNodes);
        });
    }
    //声明树的设置
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        check: {
            enable: true //启用复选框
        }
    };
    //确认分配
    $("#doSelectMenu").click(function () {
        //得到角色ID
        var row=$("#roleTable").datagrid("getSelected");
        var roleid=row.roleid;
        //得到zTree被选中的checkBOX
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        var nodes = treeObj.getCheckedNodes(true);
        var params="roleid="+roleid;
        for(var i=0;i<nodes.length;i++){
            params+="&ids="+nodes[i].id;
        }
        //alert(params);
        $.post("${ctx}/role/saveRoleMenus.action",params,function(obj){
            $.messager.show({
                title:"提示",
                msg:obj.msg
            });
        });
    });

</script>
</html>