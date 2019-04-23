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
        $.post("${ctx}/tjfx/loadRentAreaJson.action", {year: year}, function (obj) {
            var dom = document.getElementById("container");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;
            app.title = '业务员年度销售柱子图';

            option = {
                color: ['#3398DB'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        data: obj.names,
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '销售额',
                        type: 'bar',
                        barWidth: '60%',
                        data: obj.values,
                    }
                ]
            };
            myChart.setOption(option, true);

        })
    }

</script>
</body>
</html>