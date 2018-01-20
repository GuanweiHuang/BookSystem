<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/16
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

    <style type="text/css">
        .table{
            border: 0px solid #000;
            width: 410px;
            text-align: center;
        }

        .table_title{
            border: 1px solid #000;
            border-top: 0px;
            min-width: 100px;
            height: 40px;
            /*height: auto;*/
            text-align: center;
            line-height: 40px;
            float: left;
        }

        .table_body{
            border: 1px solid #000;
            border-top: 0px;
            border-left: 0px;
            width: 300px;
            height: 40px;
            /*height: auto;*/
            text-align: center;
            line-height: 40px;
            float: left;
        }

        #a{
            border: 0px solid #000;
            width: 400px;
            height: 400px;
            text-align: center;
            line-height: 50px;
        }

        a{
            color: blue;
            outline:none; /*去掉点击超链接以后出现的蓝色小框*/
            text-decoration: none; /*去掉超链接的下划线*/
        }
        a:hover{
            text-decoration: underline;
            color: red;
        }
    </style>
</head>
<body>
    <div class="table">

        <div class="table_title" style="border-top: 1px solid #000;">用&nbsp;户&nbsp;名</div>
        <div class="table_body" style="border-top: 1px solid #000;" id="body_uname">
            <s:hidden name="user.uname"/>
        </div>

        <div class="table_title">用户类型</div>
        <div class="table_body" id="body_utype">
            <s:hidden name="user.utype"/>
        </div>

        <div class="table_title">员工姓名</div>
        <div class="table_body" id="body_ename">
            <s:hidden name="user.ename"/>
        </div>

        <div class="table_title">员工性别</div>
        <div class="table_body" id="body_usex">
            <s:hidden name="user.usex"/>
        </div>

        <div class="table_title">员工年龄</div>
        <div class="table_body" id="body_uage">
            <s:hidden name="user.uage"/>
        </div>

        <div class="table_title">员工电话</div>
        <div class="table_body" id="body_utel">
            <s:hidden name="user.utel"/>
        </div>

        <div class="table_title">员工地址</div>
        <div class="table_body" id="body_uaddress">
            <s:hidden name="user.uaddress"/>
        </div>

        <div class="table_title">入职时间</div>
        <div class="table_body" id="body_uintime">
            <s:hidden name="user.uintime"/>
        </div>
    </div>

    <div id="a">
        <a href="${pageContext.request.contextPath}/userAction_findUsersList2">返回主页</a>
    </div>
</body>
<script type="text/javascript">
    $(function () {
        var uname=$("input[name='user.uname']").val();
        $("#body_uname").text(uname);

        var utype=$("input[name='user.utype']").val();
        if (utype==1){
            $("#body_utype").text("超级管理员");
        } else if (utype==2){
            $("#body_utype").text("管理员");
        } else if (utype==3){
            $("#body_utype").text("普通员工");
        }

        var ename=$("input[name='user.ename']").val();
        $("#body_ename").text(ename);

        var usex=$("input[name='user.usex']").val();
        if (usex==1){
            $("#body_usex").text("男");
        } else if (usex==0){
            $("#body_usex").text("女");
        }

        var uage=$("input[name='user.uage']").val();
        $("#body_uage").text(uage);

        var utel=$("input[name='user.utel']").val();
        $("#body_utel").text(utel);

        var uaddress=$("input[name='user.uaddress']").val();
        $("#body_uaddress").text(uaddress);

        var uintime=$("input[name='user.uintime']").val();
        var time=uintime.toString().substring(0,10);
        $("#body_uintime").text(time);
    });
</script>
</html>
