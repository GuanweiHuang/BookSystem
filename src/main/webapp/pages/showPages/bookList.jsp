<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/18
  Time: 8:21
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
                    var bid=$.getUrlParam('bid');
                    setTimeout(function() {
                        location.href="${pageContext.request.contextPath}/bookAction_toUpdateBook?book.bid="+bid;
                    }, 2200);
                })
            </script>
            <%--End--%>
        </s:if>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==-21">
        <script type="text/javascript">
            jError("修改失败！该书籍编号已存在！",{
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
                var bid=$.getUrlParam('bid');
                setTimeout(function() {
                    location.href="${pageContext.request.contextPath}/bookAction_toUpdateBook?book.bid="+bid;
                }, 2200);
            })
        </script>
        <%--End--%>
    </s:elseif>
    <s:elseif test="#parameters.msg[0]==1">
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
    </s:elseif>
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
            jError("请选择要删除的选项！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>

    <s:form method="POST" action="bookAction_findBookByNo">
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
                <td><input type="checkbox" name="id" value="${b[0].bid}"></td>
                <td>${ids.count}</td>
                <td>${b[0].bno}</td>
                <td>${b[0].bname}</td>
                <td>${b[0].bprice}元/月</td>
                <td>${b[0].price}元/本</td>
                <td>${b[1].btname}</td>
                <td>
                    ${b[0].bstatus==1?"正常":""}
                    ${b[0].bstatus==2?"已出租":""}
                    ${b[0].bstatus==3?"已出售":""}
                </td>
                <td>${b[0].bindate.toString().substring(0,10)}</td>
                <td>
                    <input type="hidden" value="${b[0].bid}"/>
                    <a href="${pageContext.request.contextPath}/bookAction_toUpdateBook?book.bid=${b[0].bid}">修改</a>&nbsp;|&nbsp;
                    <a href="javascript:;" onclick="deleteBook(this)">删除</a>
                </td>
            </tr>
        </s:iterator>
    </table>
    <a href="javascript:deleteAllBooks()">删除所选书籍</a>
</body>
<script type="text/javascript">

    function selectAll(){
        if ($(":checkbox:checked").length>0){
            $(":checkbox").prop("checked",false);
        }else {
            $(":checkbox").prop("checked",true);
        }
    }

    function deleteAllBooks(){
        var ids=$(":checkbox:checked");
        if (ids.length==0){
            alert("请选择要删除的书籍");
        }else {
            var param = $(":checkbox").serialize();
            if(confirm('你确定要删除这些书籍吗？')){
                location.href='bookAction_deleteAllBook?'+param;
                return true;
            }else {
                return false;
            }
        }
    }

    function deleteBook(ob) {
        var $val=$(ob).parent().find("input");
        var theValue= $($val.get(0)).val();
        var $text=$(ob).parent().parent().find("td");
        var theText=$($text.get(3)).text();
        if (confirm(theText+'将会被删除')){
            location.href="bookAction_deleteBook?book.bid="+theValue;
            return true;
        }
    }
</script>
</html>
