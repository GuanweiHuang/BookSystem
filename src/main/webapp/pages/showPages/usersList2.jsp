<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/10
  Time: 20:19
  To change this template use File | Settings | File Templates.

  超级管理员的查询用户页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jNotify.jquery.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jNotify.jquery.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

    <style type="text/css">
        .table{
            border: 0px solid #000;
            width: 850px;
            text-align: center;
        }

        .table_title{
            border: 1px solid #000;
            min-width: 100px;
            height: auto;
            text-align: center;
            float: left;
        }

        .table_body{
            border: 1px solid #000;
            width: 100px;
            height: auto;
            text-align: center;
            float: left;
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
    <h2>用户信息列表</h2>

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
        <s:if test="#parameters.bid[0]!=0">
            <%--下面这段代码用于获取bid，即书籍类型的id--%>
            <script type="text/javascript">
                (function($){
                    $.getUrlParam = function(name)
                    {
                        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                        var r = window.location.search.substr(1).match(reg);
                        if (r!=null) return unescape(r[2]); return null;
                    }
                })(jQuery);
                $(function(){
                    //alert(window.location.href);
                    //alert($.getUrlParam('btno'));
                    var uno=$.getUrlParam('uno');
                    setTimeout(function() {
                        location.href="${pageContext.request.contextPath}/userAction_toUpdateUser2?user.uno="+uno;
                    }, 2200);
                })
            </script>
            <%--End--%>
        </s:if>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==0">
        <script type="text/javascript">
            jError("修改失败！该用户名已存在！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
        <%--下面这段代码用于获取bid，即书籍类型的id--%>
        <script type="text/javascript">
            (function($){
                $.getUrlParam = function(name)
                {
                    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r!=null) return unescape(r[2]); return null;
                }
            })(jQuery);
            $(function(){
                //alert(window.location.href);
                //alert($.getUrlParam('btno'));
                var uno=$.getUrlParam('uno');
                setTimeout(function() {
                    location.href="${pageContext.request.contextPath}/userAction_toUpdateUser2?user.uno="+uno;
                }, 2200);
            })
        </script>
        <%--End--%>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==2">
        <script type="text/javascript">
            $(function () {
                jSuccess("重置密码成功！",{
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
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==-2">
        <script type="text/javascript">
            jError("重置密码失败！",{
                TimeShown : 1000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==3">
        <script type="text/javascript">
            $(function () {
                jSuccess("销户成功！",{
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
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==-3">
        <script type="text/javascript">
            jError("销户失败！",{
                TimeShown : 1000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>

    <div class="table">
        <div>
            <div class="table_title">编号</div>
            <div class="table_title" style="border-left: 0px;">账号</div>
            <div class="table_title" style="border-left: 0px;">密码</div>
            <div class="table_title" style="border-left: 0px;">状态</div>
            <div class="table_title" style="border-left: 0px;">类型</div>
            <div class="table_title" style="border-left: 0px; width: 330px;">管理</div>
        </div>

        <div>
        <s:iterator value="#request.usersList" var="u" status="ids">
            <div class="table_body" style="border-top: 0px">${ids.count}</div>
            <div class="table_body" style="border-top: 0px; border-left: 0px;">${u.uname}</div>
            <div class="table_body" style="border-top: 0px; border-left: 0px;">${u.upwd.toString().substring(0,1)}***</div>
            <div class="table_body" style="border-top: 0px; border-left: 0px;">${u.ustatus==1?"正常":"销户"}</div>
            <div class="table_body" style="border-top: 0px; border-left: 0px;">
                    ${u.utype==1?"超级管理员":""}
                    ${u.utype==2?"管理员":""}
                    ${u.utype==3?"普通员工":""}
            </div>
            <div class="table_body" style="border-top: 0px; border-left: 0px; width: 330px">
                <input type="hidden" value="${u.uno}"/>
                <s:if test="%{#request.u.utype==2}">
                    <a href="${pageContext.request.contextPath}/userAction_toUserPage2?user.uno=${u.uno}">详情</a>
                </s:if>
                <s:elseif test="%{#request.u.utype==3}">
                    <a href="${pageContext.request.contextPath}/userAction_toUserPage2?user.uno=${u.uno}">详情</a>
                    &nbsp;|&nbsp;
                    <a href="${pageContext.request.contextPath}/userAction_toUpdateUser2?user.uno=${u.uno}">修改用户信息</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:;" onclick="resetPwd(this)">重置密码</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:;" onclick="deleteUser(this)">注销</a>
                </s:elseif>
            </div>
        </s:iterator>
        </div>
    </div>
    <%--<table border="1" width="600">--%>
        <%--<tr>--%>
            <%--<td>编号</td>--%>
            <%--<td>账号</td>--%>
            <%--<td>密码</td>--%>
            <%--<td>状态</td>--%>
            <%--<td>类型</td>--%>
            <%--<td>管理</td>--%>
        <%--</tr>--%>
        <%--<s:iterator value="#request.usersList" var="u" status="ids">--%>
            <%--<tr>--%>
                <%--<td>${ids.count}</td>--%>
                <%--<td>${u.uname}</td>--%>
                <%--<td>${u.upwd.toString().substring(0,1)}***</td>--%>
                <%--<td>${u.ustatus==1?"正常":"销户"}</td>--%>
                <%--<td>--%>
                        <%--${u.utype==1?"超级管理员":""}--%>
                        <%--${u.utype==2?"管理员":""}--%>
                        <%--${u.utype==3?"普通员工":""}--%>
                <%--</td>--%>
                <%--<td>--%>
                        <%--<input type="hidden" value="${u.uno}"/>--%>
                        <%--<s:if test="%{#request.u.utype==1}">--%>
                            <%--<a href="#">详情</a>--%>
                        <%--</s:if>--%>
                        <%--<s:elseif test="%{#request.u.utype!=1}">--%>
                            <%--<a href="#">详情</a>--%>
                            <%--&nbsp;|&nbsp;--%>
                            <%--<a href="${pageContext.request.contextPath}/userAction_toUpdateUser?user.uno=${u.uno}">修改用户信息</a>--%>
                            <%--&nbsp;|&nbsp;--%>
                            <%--<a href="javascript:;" onclick="resetPwd(this)">重置密码</a>--%>
                            <%--&nbsp;|&nbsp;--%>
                            <%--<a href="#">注销</a>--%>
                        <%--</s:elseif>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</s:iterator>--%>
    <%--</table>--%>
</body>
<script type="text/javascript">
    function resetPwd(ob) {
        var $val = $(ob).parent().find("input");
        var theValue=$($val.get(0)).val();
        var theValue = $($val.get(0)).val();
        //alert(theValue);

        /*
        var $name=$(ob).parent().parent().find("td");
        var theUserName=$($name.get(1)).text();
        alert(theUserName);
        */

        if (confirm('该用户的密码将会被重置为123456')){
            location.href="${pageContext.request.contextPath}/userAction_updatePwd2?user.uno="+theValue;
            return true;
        }else {
            return false;
        }
    }

    function deleteUser(ob) {
        var $val = $(ob).parent().find("input");
        var theValue=$($val.get(0)).val();
        var theValue = $($val.get(0)).val();
//        alert(theValue);

        if (confirm('该用户将会被注销')){
            location.href="${pageContext.request.contextPath}/userAction_deleteUser2?user.uno="+theValue;
            return true;
        }else {
            return false;
        }
    }
</script>
</html>
