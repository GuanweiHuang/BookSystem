<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/11
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jNotify.jquery.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jNotify.jquery.js"></script>

    <style type="text/css">
        .title{
            text-align:center;
            text-align:justify;
            text-justify:distribute-all-lines;
            text-align-last:justify
        }
        .tip{
            text-align: left;
            color: #1c94c4;
            padding-left: 5px;
        }

        .content span input{
            width: 260px;
        }
    </style>
</head>
<body>

    <s:if test="#parameters.msg[0]==1">
        <script type="text/javascript">
            $(function () {
                jSuccess("修改成功！",{
                    //autoHide : true,       // 是否自动隐藏提示条
                    clickOverlay : false,  // 是否单击遮罩层才关闭提示条
                    MinWidth : 200,        // 最小宽度
                    TimeShown : 1000,      // 显示时间：毫秒
                    ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                    HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                    LongTrip : 15,         // 当提示条显示和隐藏时的位移
                    HorizontalPosition : "center",// 水平位置:left, center, right
                    VerticalPosition : "top",// 垂直位置：top, center, bottom
                    // ShowOverlay : false,     // 是否显示遮罩层
                    ColorOverlay : "#000",  // 设置遮罩层的颜色
                    OpacityOverlay : 0.3,   // 设置遮罩层的透明度
                });
            });
        </script>
    </s:if>
    <s:elseif test="#parameters.msg[0]==-1">
        <script type="text/javascript">
            jError("修改失败！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==0">
        <script type="text/javascript">
            jError("原密码错误！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>

    <h2>修改密码</h2>

    <s:form method="post" action="userAction_doUpdateUserPwd">
        <s:hidden name="user.uno"/><s:hidden name="user.utype"/><s:hidden name="user.ename"/>
        <s:hidden name="user.usex"/><s:hidden name="user.uage"/><s:hidden name="user.utel"/>
        <s:hidden name="user.uaddress"/><s:hidden name="user.uintime"/>
        <table border="0" width="auto" height="auto">
            <tr>
                <td class="title">用户名</td>
                <td class="content">：<span><s:textfield name="user.uname"/></span></td>
                <td class="tip" id="tip_user"></td>
            </tr>
            <tr>
                <td class="title">原密码</td>
                <td class="content">：<span><s:password name="user.upwd"/></span></td>
                <td class="tip" id="tip_pwd">请输入原密码</td>
            </tr>
            <tr>
                <td class="title">新密码</td>
                <td class="content">：<span><s:password name="newPwd"/></span></td>
                <td class="tip" id="tip_newPwd">请输入6-10位新密码</td>
            </tr>
            <tr>
                <td class="title">确认密码</td>
                <td class="content">：<span><s:password name="repwd"/></span></td>
                <td class="tip" id="tip_rePwd">必须和新密码一致</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <s:submit value="修改密码" onclick="checkPwd()"/>
                    <input type="reset" value="重置" id="reset"/>
                </td>
                <td></td>
            </tr>
        </table>
    </s:form>
    <%--<input type="button" value="测试" onclick="test()"/>--%>

</body>
<script type="text/javascript">
    $(function () {
        $(":input[name='user.uname']").prop("readonly",true);

        $("#reset").click(function () {
            $("#tip_pwd").html("<span style='color: #1c94c4;'>请输入原密码</span>");
            $("#tip_newPwd").html("<span style='color: #1c94c4;'>请输入6-10位新密码</span>");
            $("#tip_rePwd").html("<span style='color: #1c94c4;'>必须和新密码一致</span>");
        });

    });

    function checkPwd() {
        var newPwd=$(":input[name='newPwd']").val();
        var rePwd=$(":input[name='repwd']").val();

        if (rePwd!=newPwd){
            alert("确认密码和新密码不一样！");
            event.preventDefault();
        }else if(newPwd.length<6||newPwd.length>10) {
            alert("密码长度为6-10位");
            event.preventDefault();
        }
    }


//        function test() {
//            var pwd=$("input[name='user.upwd']").val();
//            if (pwd!="111"){
//                $("#tip_pwd").html("输入6-10个字母或数字或下划线");
//            }else {
//                alert(pwd);
//            }
//            var pwd = $(":input[name='user.upwd']").val();
//            alert(pwd);
//        }
</script>
</html>
