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

    <style type="text/css">
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
    <h2>修改书籍类型</h2>
    <s:form method="POST" action="btypeAction_doUpdateBtype">
        <s:hidden name="btype.btno"/>
        <table border="0" style="min-width: 200px">
            <tr>
                <td>
                    请输入新的书籍类型：<s:textfield name="btype.btname"/>
                </td>
            </tr>
            <tr><td style="height: 10px"></td></tr>
            <tr>
                <td style="text-align: center;">
                    <s:submit value="修改书籍类型" />
                </td>
            </tr>
        </table>
    </s:form>
    <a href="${pageContext.request.contextPath}/btypeAction_findBtypeList">返回</a>
</body>
</html>
