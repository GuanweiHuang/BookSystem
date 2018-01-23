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

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>


    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/iconfont/style.css" type="text/css" rel="stylesheet">

    <style>
        body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
        .wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
        .main_content{background:url(images/main_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
        .form-group{position:relative;}
        .login_btn{display:block; background:#3872f6; color:#fff; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
        .login_input{width:100%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
        .icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#3872f6;}
        .font16{font-size:16px;}
        .mg-t20{margin-top:20px;}
        @media (min-width:200px){.pd-xs-20{padding:20px;}}
        @media (min-width:768px){.pd-sm-50{padding:50px;}}
        #grad {
            background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
            background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
        }
    </style>
</head>
<body style="background:url(images/bg.jpg) no-repeat;">

<div class="container wrap1" style="height:450px;">
    <h2 class="mg-b20 text-center">图书管理系统登录页面</h2>
    <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
        <p class="text-center font16">用户登录</p>
        <center>
            <div style="color: #ff411c;border: 0px solid white;width: 180px; height: 30px;">
                <span id="actionerror"><s:actionerror/></span>
            </div>
        </center>
        <s:form id="Login" name="Login" method="post" action="userAction_doLogin">
            <div class="form-group mg-t20">
                <i class="icon-user icon_font"></i>
                <s:textfield name="user.uname" id="Email1" class="login_input" placeholder="请输入用户名" />
            </div>
            <div class="form-group mg-t20">
                <i class="icon-lock icon_font"></i>
                <s:password name="user.upwd" id="Password1" class="login_input" placeholder="请输入密码" />
            </div>
            <div class="checkbox mg-b25" style="height: 10px;">
            </div>
            <s:submit value="登录" class="login_btn"/>
        </s:form>
    </div><!--row end-->
</div><!--container end-->

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



//    jQuery(document).ready(function ($) {
//        if (window.history && window.history.pushState) {
//            $(window).on('popstate', function () {
//                window.history.forward(1);
//            });
//        }
//    });

    $(function () {
        setTimeout(function() {
            $("#actionerror").hide();
        }, 5000);
    });

    $(":input[type='submit']").click(function () {
        var uname = $(":input[name='user.uname']").val();
        var upwd = $(":input[name='user.upwd']").val();
        if (uname==null||uname==""||upwd==null||upwd==""){
            alert("用户名和密码不能为空！");
            event.preventDefault();
        }
    });
</script>
</html>
