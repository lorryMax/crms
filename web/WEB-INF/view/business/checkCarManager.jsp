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
<!-- 搜索表单开始 -->
<div class="easyui-panel" style="width:100%; text-align: center ; padding: 20px"
     data-options="title:'查询条件',iconCls:'icon-search'">
    <form action="" method="post">
        <input id="search_rentid" class="easyui-searchbox" data-options="prompt:'请输入出租单号',searcher:doSearch"
               style="width: 60%"
        >
    </form>
</div>
<div style="height: 10px;"></div>
<!-- 搜索表单结束-->
<!--隐藏检查单， 客户信息表，出租单信息，汽车单信息 -->
<div id="content">
    <!--- 生成检查单开始-->
    <div class="easyui-panel" style="width:100%;"
         data-options="title:'生成检查单',iconCls:'icon-search'">
        <form action="" id="checkFrm" method="post">
            <table align="center" width="100%" cellspacing="5px">
                <tr>
                    <td width="33%"><input class="easyui-textbox" name="checkid" readonly
                                           data-options="label:'检查单号:',labelPosition:'left',labelAlign:'right'"
                                           style="width:95%;"></td>
                    <td width="33%"><input class="easyui-datetimebox" name="checkdate"  readonly
                                           data-options="label:'检查时间:',labelPosition:'left',labelAlign:'right'"
                                           style="width:95%;"></td>
                </tr>
                <tr>
                    <td width="33%"><input class="easyui-textbox" name="rentid"  readonly
                                           data-options="label:'出租单号:',labelPosition:'left',labelAlign:'right'"
                                           style="width:95%;"></td>
                    <td width="33%"><input class="easyui-textbox" name="opername"  readonly
                                           data-options="label:'操作员:',labelPosition:'left',labelAlign:'right'"
                                           style="width:95%;"></td>
                </tr>
                <tr>
                    <td width="33%"><input class="easyui-textbox" name="chekdesc"
                                           data-options="label:'存在问题:',required:true,prompt:'请输入存在问题',labelPosition:'left',labelAlign:'right'"
                                           style="width:95%;"></td>
                    <td width="33%"><input class="easyui-numberbox" name="paymoney"
                                           data-options="label:'赔付金额:',required:true,prompt:'请输入赔付金额',labelPosition:'left',labelAlign:'right'"
                                           style="width:95%;"></td>
                </tr>
                <tr>
                    <td width="33%" colspan="2"><input class="easyui-textbox" name="chekdesc"
                                           data-options="label:'问题描述:',required:true,prompt:'请输入问题描述',labelPosition:'left',labelAlign:'right', multiline:true"
                                           style="width:95%; height: 60px"  ></td>
                </tr>
                <tr>
                    <td align="center" colspan="11">
                        <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="doSubmit">保存</a></td>
                </tr>
            </table>
        </form>
    </div>

<!--- 生成检查单结束-->
<!-- 客户，汽车，出租信息开始-->
<div class="easyui-layout" style="width: 100%;height: 300px">
    <div class="easyui-panel" style="padding: 20px" data-options="region:'west',iconCls:'icon-tip',title:'车辆信息',width:'33%'">
        <div id="car_carnumber" style="margin-bottom: 10px">车辆号牌:</div>
        <div id="car_cartype" style="margin-bottom: 10px">车辆类型:</div>
        <div id="car_color" style="margin-bottom: 10px">车辆颜色:</div>
        <div id="car_price" style="margin-bottom: 10px">购买价格:</div>
        <div id="car_rentprice" style="margin-bottom: 10px">出租价格:</div>
        <div id="car_deposit" style="margin-bottom: 10px">出租押金:</div>
        <div id="car_description" style="margin-bottom: 10px">车辆描述:</div>
        <div id="car_img" style="margin-bottom: 10px">车辆图片:</div>
    </div>
    <div class="easyui-panel"  style="padding: 20px" data-options="region:'center',iconCls:'icon-tip',title:'出租单信息',width:'33%'">
        <div id="rent_rentid" style="margin-bottom: 10px">出租单号:</div>
        <div id="rent_price" style="margin-bottom: 10px">出租价格:</div>
        <div id="rent_begindate" style="margin-bottom: 10px">起租时间:</div>
        <div id="rent_returndate" style="margin-bottom: 10px">还车时间:</div>
        <div id="rent_opername" style="margin-bottom: 10px">操作员:</div>
        <div id="rent_createtime" style="margin-bottom: 10px">创建时间:</div>
    </div>
    <div class="easyui-panel"  style="padding: 20px" data-options="region:'east',iconCls:'icon-tip',title:'客户信息',width:'33%'">
        <div id="customer_identity" style="margin-bottom: 10px">身份证号:</div>
        <div id="customer_custname" style="margin-bottom: 10px">客户姓名:</div>
        <div id="customer_sex" style="margin-bottom: 10px">客户性别:</div>
        <div id="customer_address" style="margin-bottom: 10px">客户地址:</div>
        <div id="customer_phone" style="margin-bottom: 10px">客户电话:</div>
        <div id="customer_career" style="margin-bottom: 10px">客户职位:</div>
    </div>

</div>
<!-- 客户，汽车，出租信息结束-->
</div>
</body>
<script type="text/javascript">
    //初始隐藏content
    $(function () {
        $("#content").hide();
    })
    //验证出租单号
    function doSearch(value) {
        $.post("${ctx}/check/checkRentByRentId.action", {rentid: value}, function (data) {
            //0不存在 ,  1存在已归还  , 2存在未归还
            if (data.code == 0) {
                $.messager.show({
                    title: '提示',
                    msg: '该出租单不存在'
                });
            } else if (data.code == 1) {
                $.messager.show({
                    title: '提示',
                    msg: '该出租单出租车已入库',
                });
            } else {
                //显示content
                $("#content").show();
                $.post("${ctx}/check/initCheckFormData.action", {rentid: value}, function (obj) {
                    //获取检查单信息
                    var check = obj.check;
                    $("#checkFrm").form("load",check);
                    //获取车辆单信息
                    var car = obj.car;
                    $("#car_carnumber").html("车辆号牌: "+car.carnumber);
                    $("#car_cartype").html("车辆类型: "+car.cartype);
                    $("#car_color").html("车辆颜色: "+car.color);
                    $("#car_price").html("购买价格: "+car.price);
                    $("#car_rentprice").html("出租价格: "+car.rentprice);
                    $("#car_deposit").html("出租押金: "+car.deposit);
                    $("#car_description").html("车辆描述: "+car.description);
                    $("#car_img").html("车辆图片: "+"<img width=200 height=150 src='"+car.carimg+"' />");
                    //获取出租单信息
                    var rent = obj.rent;
                    $("#rent_rentid").html("出租单号: "+rent.rentid);
                    $("#rent_price").html("出租价格: "+rent.price);
                    $("#rent_begindate").html("起租时间: "+rent.begindate);
                    $("#rent_returndate").html("还车时间: "+rent.returndate);
                    $("#rent_opername").html("操作员: "+rent.opername);
                    $("#rent_createtime").html("创建时间: "+rent.createtime);
                    //获取客户信息
                    var customer = obj.customer;
                    $("#customer_identity").html("身份证号: "+customer.identity);
                    $("#customer_custname").html("客户姓名: "+customer.custname);
                    $("#customer_sex").html("客户性别: "+(customer.sex==1?'男':'女'));
                    $("#customer_address").html("客户地址: "+customer.address);
                    $("#customer_phone").html("客户电话: "+customer.phone);
                    $("#customer_career").html("客户职位: "+customer.career);
                });
            };
        });
    };
    //保存
    $("#doSubmit").click(function(){
        $.messager.progress();	// 显示进度条
        $('#checkFrm').form('submit', {
            url: "${ctx}/check/addCheck.action",
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
                $("#content").hide();
                $.messager.show({
                    title:'提示',
                    msg:data.msg
                });
            }
        });
    });
</script>
</html>