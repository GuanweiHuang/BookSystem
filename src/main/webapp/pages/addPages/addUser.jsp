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
            color: red;
            padding-left: 5px;
        }

        .content span input{
            width: 260px;
        }
    </style>
</head>
<body>
    <h2>添加新用户</h2>
    <%--<s:if test="#session.addUsers!=null">--%>
        <%--<s:if test="#session.addUsers.uno==0">--%>
            <%--<p class="result" style="color:red">添加用户失败!</p>--%>
        <%--</s:if>--%>
        <%--<s:else>--%>
            <%--&lt;%&ndash;<script type="text/javascript">&ndash;%&gt;--%>
                <%--&lt;%&ndash;alert("添加用户成功!");&ndash;%&gt;--%>
            <%--&lt;%&ndash;</script>&ndash;%&gt;--%>
            <%--<p class="result" style="color:green">添加用户成功!--%>
                <%--<br/>--%>
                <%--用户名:${addUsers.uname },密码:${addUsers.upwd.toString().substring(0,1) }***--%>
            <%--</p>--%>
        <%--</s:else>--%>
    <%--</s:if>--%>

    <s:if test="#parameters.msg[0]==1">
        <%--<p style="color: green">添加用户成功！</p>--%>
        <script type="text/javascript">
            $(function () {
                jSuccess("添加用户成功！",{
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
        <%--<p style="color: red">添加用户失败！</p>--%>
        <script type="text/javascript">
            jError("添加用户失败！",{
                TimeShown : 1000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>

    <%--<s:form method="post" action="userAction_addUserTwo" onsubmit="return check();">--%>
    <s:form method="post" action="userAction_addUser">

        <table border="0" width="auto" height="auto">
            <tr>
                <td class="title">用户名</td>
                <td class="content">：<span><s:textfield name="user.uname"/></span></td>
                <td class="tip" id="tip_user"></td>
            </tr>
            <tr>
                <td class="title">密码</td>
                <td class="content">：<span><s:password name="user.upwd"/></span></td>
                <td class="tip" id="tip_pwd"></td>
            </tr>
            <tr>
                <td class="title">确认密码</td>
                <td class="content">：<span><s:password name="repwd"/></span></td>
                <td class="tip" id="tip_repwd"></td>
            </tr>
            <tr>
                <td class="title">用户类型</td>
                <td class="content">：<s:radio list="#{3:'普通员工',2:'管理员',1:'超级管理员'}" name="user.utype" value="%{3}"/></td>
                <td class="tip" id="tip_type"></td>
            </tr>
            <tr>
                <td class="title">员工姓名</td>
                <td class="content">：<span><s:textfield name="user.ename"/></span></td>
                <td class="tip" id="tip_ename"></td>
            </tr>
            <tr>
                <td class="title">员工性别</td>
                <td class="content">：<s:radio list="#{1:'男',0:'女'}" name="user.usex" value="%{1}"/></td>
                <td class="tip" id="tip_sex"></td>
            </tr>
            <tr>
                <td class="title">员工年龄</td>
                <td class="content">：<span><s:textfield name="user.uage"/></span></td>
                <td class="tip" id="tip_age"></td>
            </tr>
            <tr>
                <td class="title">员工电话</td>
                <td class="content">：<span><s:textfield name="user.utel"/></span></td>
                <td class="tip" id="tip_tel"></td>
            </tr>
            <tr>
                <td class="title">员工地址</td>
                <td class="content">：<span><s:textfield name="user.uaddress"/></span></td>
                <td class="tip" id="tip_address"></td>
            </tr>
            <tr>
                <td class="title">入职时间</td>
                <td class="content">：<span><s:textfield name="user.uintime"/></span></td>
                <td class="tip" id="tip_time"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <s:submit value="添加新用户" onclick="check()"/>
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

        setTimeout(function() {
            $(".result").empty();
        }, 3000);

        $("#reset").click(function () {
            $("#tip_user").empty();
            $("#tip_pwd").empty();
            $("#tip_repwd").empty();
            $("#tip_ename").empty();
            $("#tip_age").empty();
            $("#tip_tel").empty();
            $("#tip_address").empty();
            $("#tip_time").empty();
        });

        $("input[name='user.uname']").click(function () {
            setTimeout(function() {
                $("#tip_user").empty();
            }, 3000);
        });

        $("input[name='user.upwd']").click(function () {
            var user=$("input[name='user.uname']").val();
            if (user.length<6||user.length>15){
                $("#tip_user").html("用户名为6到15位");
                event.preventDefault();
            }else {
                $("#tip_user").html("<span style='color: #00ee00'>通过</span>");
            }
            setTimeout(function() {
                $("#tip_pwd").empty();
            }, 3000);
        });

        $("input[name='repwd']").click(function () {
            var pwd=$("input[name='user.upwd']").val();
            if (pwd.length<6||pwd.length>10){
                $("#tip_pwd").html("密码为6到10位");
                event.preventDefault();
            }else {
                $("#tip_pwd").html("<span style='color: #00ee00'>通过</span>");
            }

            setTimeout(function() {
                $("#tip_repwd").empty();
            }, 3000);
        });

        $("input[name='user.ename']").click(function () {
            var pwd=$("input[name='user.upwd']").val();
            var repwd=$("input[name='repwd']").val();
            if (pwd!=repwd){
                $("#tip_repwd").html("密码不一致");
                event.preventDefault();
            }else if((pwd.length<6||pwd.length>10)&&pwd==repwd){
                $("#tip_pwd").html("密码为6到10位");
                $("#tip_repwd").html("密码为6到10位");
                event.preventDefault();
            }else {
                $("#tip_repwd").html("<span style='color: #00ee00'>通过</span>");
            }

            setTimeout(function() {
                $("#tip_ename").empty();
            }, 3000);
            //alert("ename");
        });

        $("input[name='user.uage']").click(function () {
            var ename=$("input[name='user.ename']").val();
            if (ename==null||ename==""){
                $("#tip_ename").html("员工姓名不能为空");
                event.preventDefault();
            }else {
                $("#tip_ename").html("<span style='color: #00ee00'>通过</span>");
            }

            setTimeout(function() {
                $("#tip_age").empty();
            }, 3000);
            //alert("uage");
        });

        $("input[name='user.utel']").click(function () {
            var age=$("input[name='user.uage']").val();
            if(age>17){
                $("#tip_age").html("<span style='color: #00ee00'>通过</span>");
            }else {
                $("#tip_age").html("年龄必须大于17岁");
                event.preventDefault();
            }

            setTimeout(function() {
                $("#tip_tel").empty();
            }, 3000);
            //alert("utel");
        });

        $("input[name='user.uaddress']").click(function () {
            var tel=$("input[name='user.utel']").val();
            if(tel.length==11){
                $("#tip_tel").html("<span style='color: #00ee00'>通过</span>");
            }else {
                $("#tip_tel").html("电话号码为11位");
                event.preventDefault();
            }

            setTimeout(function() {
                $("#tip_address").empty();
            }, 3000);
           // alert("uaddress");
        });

        $("input[name='user.uintime']").click(function () {
            var address=$("input[name='user.uaddress']").val();
            if (address==null||address==""){
                $("#tip_address").html("地址不能为空");
                event.preventDefault();
            }else {
                $("#tip_address").html("<span style='color: #00ee00'>通过</span>");
            }

            setTimeout(function() {
                $("#tip_time").empty();
            }, 3000);
            //alert("uintime");
        });
    });

    function check(){
        var user=$("input[name='user.uname']").val(); //获取用户名的值
        var pwd=$("input[name='user.upwd']").val(); //获取密码的值
        var repwd=$("input[name='repwd']").val(); //获取确认密码的值
        var ename=$("input[name='user.ename']").val();  //获取员工姓名的值
        var age=$("input[name='user.uage']").val();  //获取员工年龄
        var tel=$("input[name='user.utel']").val();  //获取员工电话
        var address=$("input[name='user.uaddress']").val();  //获取员工地址
        var time=$("input[name='user.uintime']").val();  //获取入职时间


        if(time!=null||time!=""){
            $("#tip_time").html("<span style='color: #00ee00'>通过</span>");
        }else{
            $("#tip_time").html("不通过");
            event.preventDefault();
        }

        if(user.length>5&&user.length<16&&pwd.length>5&&pwd.length<11&&pwd==repwd&&ename.length>0&&age.length>0&&tel.length>0&&address.length>0&&time.length>0){
            return true;
        }else{
            event.preventDefault();
        }

    }

    //    function test() {
    //        var pwd=$("input[name='user.upwd']").val();
    //        if (pwd!="111"){
    //            $("#tip_pwd").html("输入6-10个字母或数字或下划线");
    //        }else {
    //            alert(pwd);
    //        }
    //    }
</script>
</html>
