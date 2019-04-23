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

    <title>修改密码</title>

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
            src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>

<body>
<div class="easyui-panel" style="width:100% ;height:400px; text-align: center">
    <form action="" method="post" id="updatePwdFrm">
        <div style="margin-bottom:80px;"></div>
        <div style="margin-bottom:20px">
            <!--隐藏当前用户的id-->
            <input type="hidden" id="userid" value="${user.userid}" name="userid">
            <input class="easyui-passwordbox" id="pwd" name="pwd"
                   data-options="required:true,label:'原始密码:',labelPosition:'left',labelAlign:'right',prompt:'请输入原始密码'"
                   style="width:40%;">
        </div>
        <div style="margin-bottom:20px">
            <input id="pass" class="easyui-passwordbox" name="pass"
                   data-options="required:true,label:'新密码:',labelPosition:'left',labelAlign:'right',prompt:'请输入新密码'"
                   style="width:40%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-passwordbox"
                   data-options="required:true,label:'确认新密码:',labelPosition:'left',labelAlign:'right',prompt:'请在再次输入新密码'"
                   validType="confirmPass['#pass']" style="width:40%;">
        </div>
    </form>
    <div id="dlg-buttons" style="text-align:center;">
        <a class="easyui-linkbutton" data-options="iconCls:'icon-save'"
           id="doUpdatePwd">确认修改</a> <a class="easyui-linkbutton"
                                        data-options="iconCls:'icon-cancel'"
                                        onclick="javascript:$('#updatePwdFrm').form('reset');">重置</a>
    </div>
</div>
</body>
<script type="text/javascript">
    $.extend($.fn.validatebox.defaults.rules, {
        confirmPass: {
            validator: function (value, param) {
                var pass = $(param[0]).passwordbox('getValue');
                return value == pass;
            },
            message: '两次密码输入不一致'
        }
    });
    //点击提交
    $("#doUpdatePwd").click(function () {
        $.messager.confirm("提示", "确认要修改密码吗？", function (r) {
            if (r){
                $.messager.progress();	// 显示进度条
                $('#updatePwdFrm').form('submit', {
                    url: "${ctx}/user/updatePwd.action",
                    method: 'post',
                    onSubmit: function () {
                        var isValid = $(this).form('validate');//触发验证
                        if (!isValid) {
                            $.messager.progress('close');	// 验证失败后关闭进度条
                        }
                        return isValid;	// 返回验证状态
                    },
                    success: function (obj) {//提交成功之后的回调方法
                        $.messager.progress('close');	//关闭进度条
                        var data = eval('(' + obj + ')');  //把json的 字符串转在js的对象
                        $.messager.show({
                            title: '提示',
                            msg: data.msg
                        });
                    }
                });
            }
        });

    });
</script>
</html>
