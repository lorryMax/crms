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
    <title>汽车出租</title>
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
<div class="easyui-panel" style="width:100%; text-align: center ; padding: 20px"
     data-options="title:'查询条件',iconCls:'icon-search'">
    <form action="" id="searchFrm" method="post">
        <input id="search_identity" class="easyui-searchbox" data-options="prompt:'请输入客户身份证号',searcher:doSearch"
               style="width: 60%"
        >
    </form>

</div>
<!-- 搜索表单结束-->
<div style="height: 2px"></div>
<!-- 车辆数据表格开始 -->
<div id="disTable" style="display: none" >
<table id="rentTable" style="width:100%;height:350px ;"></table>
<div id="toolbar">
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true" id="addRent">车辆出租</a>
</div>
</div>
<!-- 用户数据表格结束 -->
<!-- 添加  的弹出层开始 -->
<div id="dlg" class="easyui-dialog" style="width:600px;"
     data-options="title:'添加出租单',iconCls:'icon-add',closed:true, modal: true,
		collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#dlg-buttons'
		">
    <form action="" method="post" id="dataFrm">
        <div style="margin-bottom:20px;margin-top: 20px;">
            <input class="easyui-textbox" name="rentid" id="rentid"
                   data-options="required:true,label:'出租单号:',labelPosition:'left',labelAlign:'right'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="carnumber" id="carnumber"
                   data-options="required:true,label:'车辆牌号:',labelPosition:'left',labelAlign:'right'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="identity" id="identity"
                   data-options="required:true,label:'租车用户:',labelPosition:'left',labelAlign:'right'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="price"
                   data-options="required:true,label:'购买价格:',labelPosition:'left',labelAlign:'right',prompt:'请输入购买价格'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-datetimebox" name="begindate"
                   data-options="required:true,label:'起租时间:',labelPosition:'left',labelAlign:'right'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-datetimebox" name="returndate"
                   data-options="required:true,label:'归还时间:',labelPosition:'left',labelAlign:'right',prompt:'请选择归还时间'"
                   style="width:60%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="opername" id="opername"
                   data-options="required:true,label:'操作员:',labelPosition:'left',labelAlign:'right'"
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
    //验证身份证
    function doSearch(value) {
        $.post("${ctx}/rent/checkAllCarByIdentity.action", {identity: value}, function (data) {
            if (data.code == 200) {
                //查询成功 ，表格显示
                $("#disTable").show();
                //加载表格数据
                initTableData();
            } else {
                //查询失败提示没有此人
                $.messager.show({
                    title: '提示',
                    msg: '没有此身份证号'
                });
            }
            ;
        });
    };

    //加载表格数据
    function initTableData() {
        $("#rentTable").datagrid({
            title: '车辆列表',
            iconCls: 'icon-save',
            singleSelect: true,
            url: '${ctx}/car/queryAllCar.action?isrenting=0',
            method: 'post',
            fitColumns: true,
            toolbar: '#toolbar',
            loadMsg: '数据正在努力加载中。。。',
            emptyMsg: '查无数据',
            pagination: true,
            rownumbers: true,
            columns: [[{field: 'carnumber', width: 80, title: '车辆号牌', width: 100, align: 'center'},
                {field: 'cartype', width: 100, title: '车辆类型', align: 'center'},
                {field: 'color', width: 80, title: '车辆颜色', align: 'center'},
                {field: 'price', width: 80, title: '购买价格', align: 'center'},
                {field: 'rentprice', width: 80, title: '出租价格', align: 'center'},
                {field: 'deposit', width: 80, title: '出租押金', align: 'center'},
                {field: 'description', width: 80, title: '车辆描述', align: 'center'},
                {
                    field: 'isrenting',
                    width: 60,
                    align: 'center',
                    title: '出租状态',
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
    };
    //车辆出租
    $("#addRent").click(function () {
        //选中车辆
        var row = $("#rentTable").datagrid("getSelected");
        if (row) {
            //打开弹出成，添加出租单
            $("#dlg").dialog("open").dialog('setTitle', "添加出租单");
            //装载数据
            var search_identity = $("#search_identity").val();
           // console.log(search_identity)
            //发送请求获取出租单号
            var url = "${ctx}/rent/initCarFormData.action?identity=" + search_identity +
                "&carnumber=" + row.carnumber + "&price=" + row.rentprice;
            $("#dataFrm").form("load",url);
            $("#carnumber").textbox({readonly:true});
            $("#identity").textbox({readonly:true});
            $("#rentid").textbox({readonly:true});
            $("#opername").textbox({readonly:true});
        } else{
        $.messager.show({
            title: '提示',
            msg: '请选中一行',
        });
    };
    });
    //保存
    $("#doSubmit").click(function(){
        $.messager.progress();	// 显示进度条
        $('#dataFrm').form('submit', {
            url: "${ctx}/rent/addRent.action",
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
                $("#disTable").hide();
                $.messager.show({
                    title:'提示',
                    msg:data.msg
                });
                //关ss闭弹出层
                $("#dlg").dialog("close");
            }
        });
    });
</script>
</html>