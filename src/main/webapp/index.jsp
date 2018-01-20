<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/8
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">登&nbsp;&nbsp;陆</div>
        <div style="color: red">
            <center><div style="border:1px solid white;height: 10px; "></div></center>
            <center><span id="actionerror"><s:actionerror/></span></center>
            <%--<center><input id="theTextOne" type="text" value='<s:actionerror/>'/></center>--%>
        </div>
        <div class="login_form">
            <s:form id="Login" name="Login" method="post" action="userAction_doLogin">
                <li class="login-item">
                    <span>用户名：</span>
                        <%--<input type="text" id="username" name="UserName" class="login_input" >--%>
                    <s:textfield name="user.uname" id="username" class="login_input"/>
                    <span id="count-msg" class="error"></span>
                </li>
                <li class="login-item">
                    <span>密　码：</span>
                        <%--<input type="password" id="password" name="password" class="login_input" >--%>
                    <s:password name="user.upwd" id="password" class="login_input"/>
                    <span id="password-msg" class="error"></span>
                </li>
                <li class="login-sub">
                    <input type="submit" name="Submit" value="登录" />
                    <input type="reset" name="Reset" value="重置" id="reset" />
                </li>
            </s:form>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload = function() {
        var config = {
            vx : 4,
            vy : 4,
            height : 2,
            width : 2,
            count : 100,
            //color : "121, 162, 185",
            color : "255, 255, 255",
            stroke : "100, 200, 180",
            //stroke : "255, 255, 255",
            dist : 6000,
            e_dist : 20000,
            max_conn : 10
        }
        CanvasParticle(config);
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/canvas-particle.js"></script>
</body>
<script type="text/javascript">
    $("input[type='submit']").click(function () {
        var user = $("#username").val();
        var pwd = $("#password").val();
        if (user == null || user == "" && pwd != null && pwd != "" ){
            $('#count-msg').html("用户名不能为空");
            event.preventDefault();
        }else if (pwd == null || pwd == "" && user != null && user != "" ){
            $('#password-msg').html("密码不能为空");
            event.preventDefault();
        }else if (user == null || user == "" || pwd == null || pwd == ""){
            $('#count-msg').html("用户名不能为空");
            $('#password-msg').html("密码不能为空");
            event.preventDefault();
        }
    });
</script>
</html>
