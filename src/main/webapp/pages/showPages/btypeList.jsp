<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/18
  Time: 9:31
  To change this template use File | Settings | File Templates.
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

    <style type="text/css">
        td{
            text-align: center;
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
    <s:if test="#parameters.msg[0]==1">
        <script type="text/javascript">
            $(function () {
                jSuccess("删除成功！",{
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
            jError("删除失败！",{
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
            jError("请将本类型书籍全部删除，再删除本书籍类型",{
                TimeShown : 4000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==2">
        <script type="text/javascript">
            $(function () {
                jSuccess("修改书籍类型成功！",{
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
            jError("修改书籍类型失败！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
        <s:if test="#parameters.btno[0]!=0">
            <%--下面这段代码用于获取btno，即书籍类型的id--%>
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
                    var btno=$.getUrlParam('btno');
                    setTimeout(function() {
                        location.href="${pageContext.request.contextPath}/btypeAction_toUpdateBtype?btype.btno="+btno;
                    }, 2200);
                })
            </script>
            <%--End--%>
        </s:if>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==-21">
        <script type="text/javascript">
            jError("该书籍类型已存在！请重新修改！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
        <s:if test="#parameters.btno[0]!=0">
            <%--下面这段代码用于获取btno，即书籍类型的id--%>
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
                    var btno=$.getUrlParam('btno');
                    setTimeout(function() {
                        location.href="${pageContext.request.contextPath}/btypeAction_toUpdateBtype?btype.btno="+btno;
                    }, 2200);
                })
            </script>
            <%--End--%>
        </s:if>
    </s:elseif>

    <s:elseif test="#parameters.msg[0]==-22">
        <script type="text/javascript">
            jError("书籍类型不能为空！请重新修改！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
        <s:if test="#parameters.btno[0]!=0">
            <%--下面这段代码用于获取btno，即书籍类型的id--%>
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
                    var btno=$.getUrlParam('btno');
                    setTimeout(function() {
                        location.href="${pageContext.request.contextPath}/btypeAction_toUpdateBtype?btype.btno="+btno;
                    }, 2200);
                })
            </script>
            <%--End--%>
        </s:if>
    </s:elseif>

    <h2>书籍类型列表</h2>
    <table border="1" style="min-width: 300px">
        <tr>
            <td>编号</td>
            <td>书籍类型</td>
            <td>该类型书籍数量</td>
            <td>管理</td>
        </tr>
        <s:iterator value="#request.btypeList" var="bt" status="ids">
            <tr>
                <td>${ids.count}</td>
                <td>${bt[1]}</td>
                <td>${bt[2]}</td>
                <td>
                    <input type="hidden" value="${bt[0]}"/>
                    <a href="btypeAction_toUpdateBtype?btype.btno=${bt[0]}">修改</a>&nbsp;|&nbsp;
                    <a href="javascript:;" onclick="deleteBtype(this)">删除</a>
                </td>
            </tr>
        </s:iterator>
    </table>
</body>
<script type="text/javascript">
    function deleteBtype(ob) {
        var $val=$(ob).parent().find("input");
        var theValue= $($val.get(0)).val();
        var $text=$(ob).parent().parent().find("td");
        var theText=$($text.get(1)).text();
        if (confirm(theText+'将会被删除')){
            location.href="btypeAction_deleteBtype?btype.btno="+theValue;
            return true;
        }else {
            return false;
        }
    }
</script>
</html>
