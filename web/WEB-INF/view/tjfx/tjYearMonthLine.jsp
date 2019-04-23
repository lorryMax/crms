<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html style="height: 100%">
<head>

    <meta charset="utf-8">
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
<body style="height: 100%; margin: 0">

<div class="easyui-panel" style="width:100%; text-align: center">
    <select class="easyui-combobox" id="year" name="year" label="选择年份:" labelPosition="left" style="width:60%;">
        <c:forEach var="sn" begin="2010" end="2025">
            <option value="${sn}">${sn}</option>
        </c:forEach>
    </select>
    <a class="easyui-linkbutton"
       data-options="iconCls:'icon-save'" onclick="doSearch()">查询</a>
</div>
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="${ctx }/resources/js/echart.min.js"></script>
<script type="text/javascript">

    //选择默认初始值年
    var date = new Date();
    var year = date.getFullYear();
    $("#year").val(year);

    //查询搜索
    function doSearch() {
        //获取年
        var year = $("#year").val();
        initRentData(year);
    }

    function initRentData(year) {
        $.post("${ctx}/tjfx/queryYearSalMoney.action", {year: year}, function (obj) {
            var dom = document.getElementById("container");
            var myChart = echarts.init(dom);
            var app = {};
            app.title = '公司年度月份销售额曲线图';
            option = null;
            option = {

                title: {
                    text: '公司年度月份销售额曲线图',
                    subtext: '汽车出租系统',
                    x: 'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{b}: {c} (RMB)"
                },
                xAxis: {
                    type: 'category',
                    data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: obj,
                    type: 'line'
                }]
            };
            myChart.setOption(option, true);
        })
    }

</script>
</body>
</html>