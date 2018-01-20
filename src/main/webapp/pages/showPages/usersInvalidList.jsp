<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/16
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <style type="text/css">
        td{
            text-align: center;
        }
    </style>
</head>
<body>
    <table border="1" width="900">
        <tr>
            <td>编号</td>
            <td>用户名</td>
            <td>销户前类型</td>
            <td>目前状态</td>
            <td>员工姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>电话</td>
            <td>地址</td>
            <td>入职时间</td>
        </tr>
        <s:if test="#request.usersList == null || #request.usersList.size == 0">
            <td colspan="10" style="color: red">暂无任何数据</td>
        </s:if>
        <s:else>
            <s:iterator value="#request.usersList" var="u" status="ids">
                <tr>
                    <td>${ids.count}</td>
                    <td>${u.uname}</td>
                    <td>
                            ${u.utype==1?"超级管理员":""}
                            ${u.utype==2?"管理员":""}
                            ${u.utype==3?"普通员工":""}
                    </td>
                    <td>${u.ustatus==0?"销户":"正常"}</td>
                    <td>${u.ename}</td>
                    <td>${u.usex==1?"男":"女"}</td>
                    <td>${u.uage}</td>
                    <td>${u.utel}</td>
                    <td>${u.uaddress}</td>
                    <td>${u.uintime.toString().substring(0,10)}</td>
                </tr>
            </s:iterator>
        </s:else>
    </table>
</body>
</html>
