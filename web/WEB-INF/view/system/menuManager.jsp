<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
    <title>菜单管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${ctx }/resources/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.core.js"></script>
</head>

<body class="easyui-layout">
<!--菜单管理开始-->
<!--菜单左侧json树开始  -->
<div class="easyui-panel" data-options="region:'west',title:'菜单树',iconCls:'icon-',width:'15%'">
    <!--生成左侧菜单树-->
    <div class="ztree" id="menuTree"></div>
</div>
<!--菜单左侧json树结束  -->
<!-- 右侧菜单列表开始--->
<div class="easyui-panel" data-options="region:'center',title:'菜单列表',iconCls:'icon-save',width:'85%',height:'100%'">
    <!-- 菜单数据表格开始 -->
    <table id="menuTable" style="width:100%;height:100%"></table>
    <div id="toolbar">
        <a class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="addMenu">添加菜单</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="updateMenu">修改菜单</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="deleteMenu">删除菜单</a>
    </div>
    <!-- 菜单数据表格结束-->
</div>
<!-- 右侧菜单列表结束--->
<!--菜单管理结束-->
<!--添加，修改弹出层开始-->
<div id="dlg" class="easyui-dialog" style="width:600px" data-options="title:'添加菜单',iconCls:'icon-add',
    closed:true, modal: true,collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'">
    <form action="" method="get" id="dataFrm">
        <div style="margin-bottom: 10px;margin-top: 20px">
            <input type="hidden" name="id">
            <input class="easyui-combotree" id="pid" name="pid" data-options="required:true,label:'父级菜单:',labelPosition:'left'
,labelAlign:'right',prompt:'请选择父级菜单'" style="width: 95%">
        </div>
        <div style="margin-bottom: 10px">
            <input type="hidden" name="id">
            <input class="easyui-textbox" name="name" data-options="required:true,label:'菜单名称:',labelPosition:'left'
,labelAlign:'right',prompt:'请输入菜单名称'" style="width: 95%">
        </div>
        <div style="margin-bottom: 10px">
            <input type="hidden" name="id">
            <input class="easyui-textbox" name="href" data-options="required:true,label:'菜单地址:',labelPosition:'left'
,labelAlign:'right',prompt:'请输入菜单地址'" style="width: 95%">
        </div>
        <div style="margin-bottom: 10px">
            <input type="hidden" name="id">
            <input class="easyui-textbox" name="icon" data-options="required:true,label:'菜单图标:',labelPosition:'left'
,labelAlign:'right',prompt:'请输入菜单图标'" style="width: 95%">
        </div>
        <div style="margin-bottom: 10px">
            <input type="hidden" name="id">
            <input class="easyui-textbox" name="tabicon" data-options="required:true,label:'TAB图标:',labelPosition:'left'
,labelAlign:'right',prompt:'请输入TAB图标'" style="width: 95%">
        </div>
        <div style="margin-bottom: 10px">
            <input type="hidden" name="id">
            <input class="easyui-textbox" name="target" data-options="required:true,label:'target:',labelPosition:'left'
,labelAlign:'right',prompt:'请输入target'" style="width: 95%">
        </div>
        <div style="margin-bottom:10px">
            <label class="textbox-label" style="text-align: right;">是否展开:</label>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50" name="open" value="1"
                   label="展开">
            <div style="display: inline-block;width: 30px"></div>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50" name="open" value="0"
                   label="不展开" checked="checked">
        </div>
        <div style="margin-bottom:10px">
            <label class="textbox-label" style="text-align: right;">是否父节点:</label>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50" name="parent" value="1"
                   label="是">
            <div style="display: inline-block;width: 30px"></div>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50" name="parent" value="0"
                   label="否" checked="checked">
        </div>
        <div style="margin-bottom:10px">
            <label class="textbox-label" style="text-align: right;">是否可用:</label>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50" name="available" value="1"
                   label="是" checked="checked">
            <div style="display: inline-block;width: 30px"></div>
            <input class="easyui-radiobutton" data-options="labelAlign:'right',labelWidth:50" name="available" value="0"
                   label="否">
        </div>
    </form>
</div>
<div id="dlg-buttons" style="text-align:center;">
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="doSubmit">保存</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
       onclick="javascript:$('#dlg').dialog('close');">取消</a>
</div>
<!-- 添加  修改的弹出层结束 -->
</body>
<script>
    function zTreeOnClick(event, treeId, treeNode) {
        $("#menuTable").datagrid({
            url: "${ctx}/menu/loadAllMenu.action?id=" + treeNode.id
        });
    }
    //声明树的设置
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: zTreeOnClick
        }
    };
    //加载菜单表格数据
    $(document).ready(function () {
        initMenuTree();
        initMenuData();
    });
    function initMenuTree() {
        $.get("${ctx}/menu/loadMenuTreeLeftJson.action", function (zNodes) {
            $.fn.zTree.init($("#menuTree"), setting, zNodes);
        });
    }

    function initMenuData() {
        //加载表格数据
        $("#menuTable").datagrid({
            //title:'菜单列表',
            //iconCls:'icon-save',
            singleSelect: true,
            border: false,
            url: '${ctx}/menu/loadAllMenu.action',
            method: 'POST',
            //fitColumns:true,
            toolbar: '#toolbar',
            loadMsg: '数据正在努力加载中。。。',
            emptyMsg: '查无数据',
            pagination: true,
            rownumbers: true,
            columns: [[
                {field: 'id', width: 80, title: '菜单编号', align: 'center'},
                {field: 'pid', width: 100, title: '父级菜单编号', align: 'center'},
                {field: 'name', width: 120, title: '菜单名称', align: 'center'},
                {field: 'href', width: 180, title: '菜单地址', align: 'center'},
                {
                    field: 'open', width: 80, align: 'center', title: '是否展开', formatter: function (value, row, index) {
                        return value == 1 ? "<font color=blue>展开</font>" : "<font color=red>不展开</font>";
                    }
                },
                {
                    field: 'parent',
                    width: 100,
                    align: 'center',
                    title: '是否父节点',
                    formatter: function (value, row, index) {
                        return value == 1 ? "<font color=blue>是</font>" : "<font color=red>否</font>";
                    }
                },
                {
                    field: 'icon', width: 150, align: 'center', title: '菜单图标', formatter: function (value, row, index) {
                        return "<img src=" + value + " />" + value;
                    }
                },
                {field: 'tabicon', width: 100, title: 'TAB图标', align: 'center'},
                {field: 'target', width: 80, title: 'TARGET', align: 'center'}
            ]]
        });
    }

    //模糊查询
    $("#doSearch").click(function () {
        //得到表单数据
        var params = $("#searchFrm").serialize();
        $("#menuTable").datagrid({
            url: '${ctx}/menu/loadAllMenu.action?' + params
        });
    });

    //初始化弹出层的父级菜单下拉树
    function initComboTree() {
        $("#pid").combotree({
            url: '${ctx}/menu/loadMenuManagerComboTree.action'
        });
    }

    var url;
    //添加菜单
    $("#addMenu").click(function () {
        //打开弹出层
        $("#dlg").dialog("open").dialog("setTitle", "添加菜单");
        //清空添加弹出层数据
        $("#dataFrm").form("clear");
        //选中默认是否展开，是否父节点，是否可以
        $("#dataFrm").form("load", {open: 0, parent: 0, available: 1});
        //请求地址
        url="${ctx}/menu/addMenu.action";
        //初始化父级下拉菜单
        initComboTree();
    });
    //打开修改
    $("#updateMenu").click(function () {
        //选中一行
        var row = $("#menuTable").datagrid("getSelected");
        if(row){
            //打开弹出层
            $("#dlg").dialog("open").dialog("setTitle", "修改菜单");
            //初始化菜单下拉
            initComboTree();
            //弹出层数据加载
            $("#dataFrm").form("load",row);
            url="${ctx}/menu/updateMenu.action";
        }else{
            $.messager.show({
                title:'提示',
                msg:'请选中一行'
            });
        }
    });
    //保存
    $("#doSubmit").click(function () {
        //显示进度条
        $.messager.progress();
        $("#dataFrm").form("submit",{
            url:url,
            method:'post',
            onSubmit:function() {
                var isValid = $(this).form('validate');//触发验证
                if(!isValid){
                    $.messager.progress('close');	// 验证失败后关闭进度条
                }
                return isValid;	// 返回验证状态
            },
            success:function(obj){//提交成功之后的回调方法
                $.messager.progress('close');	//关闭进度条
                //{"code":200,"msg":"添加成功"}
                var data=eval("("+obj+")");
                if(data.code==200){
                    $("#menuTable").datagrid("reload");
                    initMenuTree();//刷新左边的树
                } $.messager.show({
                    title:'提示',
                    msg:data.msg
                });
                //关闭弹出层
                $("#dlg").dialog("close");
            }
        });
    });
    //删除
    $("#deleteMenu").click(function () {
        //获取pid
        var row = $("#menuTable").datagrid("getSelected");
        if(row){
            //判断是否有子节点
            $.post("${ctx}/menu/checkMenuHasChildren.action",{id:row.id},function (obj) {
                if(obj.code==200){
                    $.messager.show({
                        title:'提示',
                        msg:"当前选中菜单有子节点，请先删除子节点"
                    });
                }else{
                    $.messager.confirm("提示","你确定要删除["+row.name+"]这条菜单吗？",function (r) {
                       if(r){
                           //确认要删除
                           $.post("${ctx}/menu/deleteMenu.action",{id:row.id},function (obj) {
                               if(obj.code==200){
                                   //删除成功，刷新表格
                                   $("#menuTable").datagrid("reload");
                                   //加载刷新左侧菜单条
                                   initMenuTree();
                               }
                               $.messager.show({
                                   title:'提示',
                                   msg:obj.msg
                               });

                           })
                       }
                    });
                }
            });









        }else{
            $.messager.show({
                title:'提示',
                msg:'请选中一行'
            });
        };
    });

</script>
</html>