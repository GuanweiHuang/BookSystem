<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/18
  Time: 8:21
  To change this template use File | Settings | File Templates.
  查询出状态为已出售的书籍
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">

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

<s:form method="POST" action="bookAction_findBookByNoStatus3">
    请输入书籍编号或书籍名称：<s:textfield name="book.bno"/>
    <s:submit value="查询"/>
</s:form>

<table border="1" style="min-width: 600px;">
    <tr>
        <td>编号</td>
        <td>书籍编码</td>
        <td>书名</td>
        <td>出租价格</td>
        <td>出售价格</td>
        <td>书籍类型</td>
        <td>书籍状态</td>
        <td>入库时间</td>
    </tr>
    <s:if test="#request.bookList == null || #request.bookList.size == 0">
        <td colspan="10" style="color: red">暂无任何数据</td>
    </s:if>
    <s:iterator value="#request.bookList" var="b" status="ids">
        <tr>
            <td>${ids.count}</td>
            <td>${b.bno}</td>
            <td>${b.bname}</td>
            <td>${b.bprice}元/月</td>
            <td>${b.price}元/本</td>
            <td>${b.btype.btname}</td>
            <td>
                    ${b.bstatus==1?"正常":""}
                    ${b.bstatus==2?"已出租":""}
                    ${b.bstatus==3?"已出售":""}
            </td>
            <td>${b.bindate.toString().substring(0,10)}</td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
