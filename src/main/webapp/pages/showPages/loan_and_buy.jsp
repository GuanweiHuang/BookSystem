<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/18
  Time: 8:21
  To change this template use File | Settings | File Templates.
  查状态为正常的书籍（即可出租或出售的书籍）
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

<s:if test="#parameters.msg[0]==2">
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
<s:elseif test="#parameters.msg[0]==-2">
    <script type="text/javascript">
        jError("修改失败！",{
            TimeShown : 2000,      // 显示时间：毫秒
            ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
            HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
            HorizontalPosition : "center",
            VerticalPosition : "top",
        });
    </script>
</s:elseif>
<s:elseif test="#parameters.msg[0]==1">
    <script type="text/javascript">
        $(function () {
            jSuccess("出租成功！",{
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
<s:elseif test="#parameters.msg[0]==-1">
    <script type="text/javascript">
        jError("出租失败！",{
            TimeShown : 2000,      // 显示时间：毫秒
            ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
            HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
            HorizontalPosition : "center",
            VerticalPosition : "top",
        });
    </script>
</s:elseif>

<s:form method="POST" action="bookAction_findBookByNoStatus1">
    请输入书籍编号或书籍名称：<s:textfield name="book.bno"/>
    <s:submit value="查询"/>
</s:form>

<table border="1" style="min-width: 600px;">
    <tr>
        <td><a href="javascript:selectAll()">全选/反选</a></td>
        <td>编号</td>
        <td>书籍编码</td>
        <td>书名</td>
        <td>出租价格</td>
        <td>出售价格</td>
        <td>书籍类型</td>
        <td>书籍状态</td>
        <td>入库时间</td>
        <td>管理</td>
    </tr>
    <s:if test="#request.bookList == null || #request.bookList.size == 0">
        <td colspan="10" style="color: red">暂无任何数据</td>
    </s:if>
    <s:iterator value="#request.bookList" var="b" status="ids">
        <tr>
            <td><input type="checkbox" name="id" value="${b.bid}"></td>
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
            <td>
                <input type="hidden" value="${b.bid}"/>
                <a href="javascript:;" onclick="loadBook(this)">出租</a>&nbsp;|&nbsp;
                <a href="javascript:;" onclick="buyBook(this)">出售</a>
            </td>
        </tr>
    </s:iterator>
</table>
<a href="javascript:loadAllBook()">出租所选书籍</a>
<a href="javascript:buyAllBook()">出售所选书籍</a>
</body>
<script type="text/javascript">

    function selectAll(){
        if ($(":checkbox:checked").length>0){
            $(":checkbox").prop("checked",false);
        }else {
            $(":checkbox").prop("checked",true);
        }
    }

    function loadAllBook(){
        var ids=$(":checkbox:checked");
        if (ids.length==0){
            alert("请选择要出租的书籍");
        }else {
            var param = $(":checkbox").serialize();
            if(confirm('你确定要出租这些书籍吗？')){
                location.href='${pageContext.request.contextPath}/bookAction_loadAllBook?'+param;
                return true;
            }else {
                return false;
            }
        }
    }

    function loadBook(ob) {
        var $val=$(ob).parent().find("input");
        var theValue= $($val.get(0)).val();
        var $text=$(ob).parent().parent().find("td");
        var theText=$($text.get(3)).text();
        if (confirm(theText+'将会被出租')){
            location.href="${pageContext.request.contextPath}/bookAction_loadBook?book.bid="+theValue;
            return true;
        }
    }

    function buyAllBook(){
        var ids=$(":checkbox:checked");
        if (ids.length==0){
            alert("请选择要出售的书籍");
        }else {
            var param = $(":checkbox").serialize();
            if(confirm('你确定要出售这些书籍吗？')){
                location.href='${pageContext.request.contextPath}/bookAction_buyAllBook?'+param;
                return true;
            }else {
                return false;
            }
        }
    }

    function buyBook(ob) {
        var $val=$(ob).parent().find("input");
        var theValue= $($val.get(0)).val();
        var $text=$(ob).parent().parent().find("td");
        var theText=$($text.get(3)).text();
        if (confirm(theText+'将会出售')){
            location.href="${pageContext.request.contextPath}/bookAction_buyBook?book.bid="+theValue;
            return true;
        }
    }
</script>
</html>
