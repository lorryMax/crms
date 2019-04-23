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
    <title>汽车管理</title>
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
<body>
<!-- 搜索表单开始 -->
<div class="easyui-panel" style="width:100%;"
     data-options="title:'查询条件',iconCls:'icon-search'">
    <form action="" id="searchFrm" method="post">
        <table align="center" width="100%" cellspacing="5px">
            <tr>
                <td width="33%"><input class="easyui-textbox" name="carnumber"
                                       data-options="label:'车辆号牌:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="cartype"
                                       data-options="label:'车辆类型:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><input class="easyui-textbox" name="color"
                                       data-options="label:'车辆颜色:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
            </tr>
            <tr>
                <td width="33%"><input class="easyui-textbox"
                                       name="description"
                                       data-options="label:'车辆描述:',labelPosition:'left',labelAlign:'right'"
                                       style="width:95%;"></td>
                <td width="33%"><label class="textbox-label"
                                       style="text-align: right;">是否出租:</label> <input
                        class="easyui-radiobutton"
                        data-options="labelAlign:'right',labelWidth:50" name="isrenting"
                        value="1" label="已出租">
                    <div style="display: inline-block;width: 30px"></div>
                    <input
                            class="easyui-radiobutton"
                            data-options="labelAlign:'right',labelWidth:50" name="isrenting"
                            value="0" label="未出租"></td>
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
<table id="carTable" style="width:100%;height:350px"></table>
<div id="toolbar">
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true" id="addCar">添加车辆</a> <a
        class="easyui-linkbutton"
        data-options="iconCls:'icon-edit',plain:true" id="updateCar">修改车辆</a>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true" id="deleteCar">删除车辆</a>
</div>
<!-- 用户数据表格结束 -->
<!-- 添加  修改的弹出层开始 -->
<div id="dlg" class="easyui-dialog" style="width:600px; position: relative"
     data-options="title:'添加用户',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
    <form action="" method="post" id="dataFrm">
        <div style="margin-bottom:20px;margin-top: 20px;">
            <input class="easyui-textbox" name="carnumber" id="carnumber"
                   data-options="required:true,label:'车辆号牌:',labelPosition:'left',labelAlign:'right',prompt:'请输入车辆号牌'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="cartype"
                   data-options="required:true,label:'车辆类型:',labelPosition:'left',labelAlign:'right',prompt:'请输入车辆类型'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="color"
                   data-options="required:true,label:'车辆颜色:',labelPosition:'left',labelAlign:'right',prompt:'请输入车辆颜色'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="price"
                   data-options="required:true,label:'购买价格:',labelPosition:'left',labelAlign:'right',prompt:'请输入购买价格'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="rentprice"
                   data-options="required:true,label:'出租价格:',labelPosition:'left',labelAlign:'right',prompt:'请输入出租价格'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="deposit"
                   data-options="required:true,label:'出租押金:',labelPosition:'left',labelAlign:'right',prompt:'请输入出租押金'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="description"
                   data-options="required:true,label:'出租描述:',labelPosition:'left',labelAlign:'right',prompt:'请输入出租描述'"
                   style="width:95%;">
        </div>
        <div style="position: absolute;top: 20px;left: 62%">
            <!--隐藏图片 方便提交后台保存在数据中-->
            <input type="hidden" name="carimg" id="carimg">
            <img id="img_carimg" alt="暂无车辆图片" height="280px"
                 width="220px" border="1px">
        </div>
        <div style="margin-bottom:20px">
            <label class="textbox-label"
                   style="text-align: right;">是否出租:</label> <input
                class="easyui-radiobutton"
                data-options="labelAlign:'right',labelWidth:50" name="isrenting"
                value="1" label="已出租">
            <div style="display: inline-block;width: 30px"></div>
            <input
                    class="easyui-radiobutton"
                    data-options="labelAlign:'right',labelWidth:50" name="isrenting"
                    value="0" label="未出租">
        </div>
    </form>
    <form method="post" id="uploadFrm" enctype="multipart/form-data">
        <div style="margin-bottom:20px">
            <input class="easyui-filebox" name="mf"
                   data-options="required:true,label:'上传车辆照片:',labelPosition:'left',labelAlign:'right',prompt:'请选择上传照片'"
                   style="width:70%;">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="uploadCarImg">上传</a>
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
    $("#carTable").datagrid({
        title: '客户列表',
        iconCls: 'icon-save',
        singleSelect: true,
        url: '${ctx}/car/queryAllCar.action',
        method: 'get',
        fitColumns: true,
        toolbar: '#toolbar',
        loadMsg: '数据正在努力加载中。。。',
        emptyMsg: '查无数据',
        pagination: true,
        rownumbers: true,
        columns: [[
            {field: 'carnumber', width: 80, title: '车辆号牌', width: 100, align: 'center'},
            {field: 'cartype', width: 100, title: '车辆类型', align: 'center'},
            {field: 'color', width: 80, title: '车辆颜色', align: 'center'},
            {field: 'price', width: 80, title: '购买价格', align: 'center'},
            {field: 'rentprice', width: 80, title: '出租价格', align: 'center'},
            {field: 'deposit', width: 80, title: '出租押金', align: 'center'},
            {field: 'description', width: 80, title: '车辆描述', align: 'center'},
            {
                field: 'isrenting', width: 60, align: 'center', title: '出租状态',
                formatter: function (value, row, index) {
                    return value == 1 ? "<font color='blue'>已出租</font>" : "<font color='red'>未出租</font>";
                }
            }
        ]],
        //可展开的效果
        view: detailview,
        detailFormatter: function (index, row) {
            return "<img witdh=200 height=150 src='" + row.carimg + "' />";
        }
    });
    //模糊查询
    $("#doSearch").click(function () {
        //得到表单数据
        var params = $("#searchFrm").serialize();
        $("#carTable").datagrid({
            url: '${ctx}/car/queryAllCar.action?' + params
        });
    });
    //上传图片
    $("#uploadCarImg").click(function () {
        var formData = new FormData($("#uploadFrm")[0]);
        $.ajax({
            url: '${ctx }/upload/uploadFile.action',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (obj) {
                if (obj.code == 200) {
                    $("#img_carimg").attr({src: obj.path});
                    //给表单设置值 ，目地是当提交表单时把这个图片地址传到后台
                    $("#carimg").val(obj.path);
                }
            },
            error: function (rv) {
                alert(rv);
            }
        });
    });
    var url;
    //点击添加
    $("#addCar").click(function () {
        //打开弹出层
        $("#dlg").dialog("open").dialog("setTitle", "添加车辆");
        //让车牌号可以编辑
        $("#carnumber").textbox({readonly: false});
        //设置车辆图片
        $("#carimg").val("../resources/images/defaultcarimg.jpg");
        //设置默认图片显示
        $("#img_carimg").attr({src:'${ctx}/resources/images/defaultcarimg.jpg'});
        //清空form表单数据
        $("#dataFrm").form("clear");
        //默认选中未出租的车辆
        $("#dataFrm").form("load", {isrenting: 0});
        url='${ctx}/car/addCar.action';
    });

    //点击修改
    $("#updateCar").click(function () {
        //获取数据
        var row = $("#carTable").datagrid("getSelected");
        if (row) {
            //打开弹出层
            $("#dlg").dialog("open").dialog("setTitle", "修改车辆");
            //装载数据
            $("#dataFrm").form("load", row);
            //让车牌号不能编辑
            $("#carnumber").textbox({readonly: true});
            //设置图片显示
            $("#img_carimg").attr({src: row.carimg});
            //请求路径
            url='${ctx}/car/updateCar.action';
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
        $("#dataFrm").form("submit",{
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
                    $("#carTable").datagrid("reload");
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
    $("#deleteCar").click(function () {
        //获取选中行
       var row= $("#carTable").datagrid("getSelected");
       if(row){
            //提示是否确认要删除
           $.messager.confirm("提示",'确认要删除['+row.carnumber+']这条车辆信息吗？',function(r){
                if(r){//确认要删除
                    $.post("${ctx}/car/deleteCar.action",{carnumber:row.carnumber} ,function (data) {
                        if(data.code==200){
                            //删除成功
                            //刷新表格
                            $("#carTable").datagrid("reload");
                        }//删除失败
                        $.messager.show({
                            title:'提示',
                            msg:data.msg,
                        });
                    });
                }
           });
       }else{
           //没有选中，提示
           $.messager.show({
               title:'提示',
               msg:'请选中一行'
           });

       }



    });

</script>
</html>