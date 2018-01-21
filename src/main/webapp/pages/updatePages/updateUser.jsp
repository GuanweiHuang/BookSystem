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
    <h2>修改用户信息</h2>

    <s:form method="post" action="userAction_doUpdateUser">
        <s:hidden name="user.uno"/>
        <table border="0" width="auto" height="auto">
            <tr>
                <td class="title">用户名</td>
                <td class="content">：<span><s:textfield name="user.uname"/></span></td>
                <td class="tip" id="tip_user">用户名为6到15位</td>
            </tr>
            <tr>
                <td class="title">用户类型</td>
                <td class="content">：<s:radio list="#{3:'普通员工',2:'管理员',1:'超级管理员'}" name="user.utype"/></td>
                <td class="tip" id="tip_type"></td>
            </tr>
            <tr>
                <td class="title">员工姓名</td>
                <td class="content">：<span><s:textfield name="user.ename"/></span></td>
                <td class="tip" id="tip_ename">员工姓名不能为空</td>
            </tr>
            <tr>
                <td class="title">员工性别</td>
                <td class="content">：<s:radio list="#{1:'男',0:'女'}" name="user.usex"/></td>
                <td class="tip" id="tip_sex"></td>
            </tr>
            <tr>
                <td class="title">员工年龄</td>
                <td class="content">：<span><s:textfield name="user.uage"/></span></td>
                <td class="tip" id="tip_age">年龄必须大于17岁</td>
            </tr>
            <tr>
                <td class="title">员工电话</td>
                <td class="content">：<span><s:textfield name="user.utel"/></span></td>
                <td class="tip" id="tip_tel">电话号码为11位</td>
            </tr>
            <tr>
                <td class="title">员工地址</td>
                <td class="content">：<span><s:textfield name="user.uaddress"/></span></td>
                <td class="tip" id="tip_address">地址不能为空</td>
            </tr>
            <tr>
                <td class="title">入职时间</td>
                <td class="content">：<span><s:textfield name="user.uintime"/></span></td>
                <td class="tip" id="tip_time">入职时间不能为空</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <s:submit value="修改用户" onclick="check()"/>
                    <input type="reset" value="重置" id="reset"/>
                    <input type="button" value="返回主页" onclick="usersList()"/>
                </td>
                <td></td>
            </tr>
        </table>
        <s:hidden name="user.upwd"/>
    </s:form>
    <%--<input type="button" value="测试" onclick="test()"/>--%>

</body>
<script type="text/javascript">

    $(function () {

        $("#reset").click(function () {
            $("#tip_user").html("<span style='color: #1c94c4'>用户名为6到15位</span>");
            $("#tip_ename").html("<span style='color: #1c94c4'>员工姓名不能为空</span>");
            $("#tip_age").html("<span style='color: #1c94c4'>年龄必须大于17岁</span>");
            $("#tip_tel").html("<span style='color: #1c94c4'>电话号码为11位</span>");
            $("#tip_address").html("<span style='color: #1c94c4'>地址不能为空</span>");
            $("#tip_time").html("<span style='color: #1c94c4'>入职时间不能为空</span>");
        });
    });

    function check(){
        var user=$("input[name='user.uname']").val(); //获取用户名的值
//        var pwd=$("input[name='user.upwd']").val(); //获取密码的值
//        var repwd=$("input[name='repwd']").val(); //获取确认密码的值
        var ename=$("input[name='user.ename']").val();  //获取员工姓名的值
        var age=$("input[name='user.uage']").val();  //获取员工年龄
        var tel=$("input[name='user.utel']").val();  //获取员工电话
        var address=$("input[name='user.uaddress']").val();  //获取员工地址
        var time=$("input[name='user.uintime']").val();  //获取入职时间

        if (user.length<5||user.length>15){
            $("#tip_user").html("<span style='color: red;'> 不通过</span>");
            event.preventDefault();
        }

        if (ename.length>0) {
            $("#tip_ename").html("<span style='color: #00ee00;'>通过</span>");
        }


        if (age<18||age>65){
            $("#tip_age").html("<span style='color: red;'> 不通过</span>");
            event.preventDefault();
        }else {
            $("#tip_age").html("<span style='color: #00ee00;'>通过</span>");
        }

        if (tel.length!=11){
            $("#tip_tel").html("<span style='color: red;'> 不通过</span>");
            event.preventDefault();
        }else {
            $("#tip_tel").html("<span style='color: #00ee00;'>通过</span>");
        }

        if (address.length>0){
            $("#tip_address").html("<span style='color: #00ee00;'>通过</span>");
        }

        if(time!=null||time!=""){
            $("#tip_time").html("<span style='color: #00ee00;'>通过</span>");
        }else{
            $("#tip_time").html("<span style='color: red;'>不通过</span>");
            event.preventDefault();
        }

//        if(user.length>5&&user.length<16&&ename.length>0&&age.length>0&&tel.length!=11&&address.length>0&&time.length>0){
//            return true;
//        }else{
//            event.preventDefault();
//        }

    }

    function usersList() {
        //alert(123);
        location.href = '${pageContext.request.contextPath}/userAction_findUsersList';
    }

//        function test() {
//            var user=$("input[name='user.uname']").val();
//            if (user.length<6||user.length>16){
//                alert(123);
//            }else {
//                alert(321);
//            }
//        }
</script>
</html>
