<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/18
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jNotify.jquery.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jNotify.jquery.js"></script>
</head>
<body>
    <h2>添加书籍类型</h2>
    <s:if test="#parameters.msg[0]==1">
        <%--<p style="color: green">添加用户成功！</p>--%>
        <script type="text/javascript">
            $(function () {
                jSuccess("添加书籍类型成功！",{
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
            jError("添加书籍类型失败！",{
                TimeShown : 1000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==0">
        <%--<p style="color: red">添加用户失败！</p>--%>
        <script type="text/javascript">
            jError("添加书籍类型失败！改书籍类型已存在！",{
                TimeShown : 1000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>
    <s:form method="POST" action="btypeAction_addBtype">
        <table border="0" style="min-width: 200px">
            <tr>
                <td>
                    请输入新的书籍类型：<s:textfield name="btype.btname"/>
                </td>
            </tr>
            <tr><td style="height: 10px"></td></tr>
            <tr>
                <td style="text-align: center;">
                    <s:submit value="添加书籍类型" />
                </td>
            </tr>
        </table>
    </s:form>
</body>
</html>
