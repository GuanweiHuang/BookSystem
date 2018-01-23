<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/19
  Time: 17:43
  To change this template use File | Settings | File Templates.
  读者列表
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
    <s:if test="#parameters.rno[0]!=0">
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
                var rno=$.getUrlParam('rno');
                setTimeout(function() {
                    location.href="${pageContext.request.contextPath}/readerAction_toUpdateReader?readers.rno="+rno;
                }, 2200);
            })
        </script>
        <%--End--%>
    </s:if>
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

    <s:form action="readerAction_findReaderDoVague" method="POST">
        查询：<s:textfield name="readers.rname"/>
        <s:submit value="确定"/>(无法查询日期)
    </s:form>

    <s:form action="readerAction_findReaderDoVagueDate" method="POST">
        查询：<s:textfield name="readers.rname" id="VagueDate"/>
        <s:submit value="确定" onclick="sVagueDate()"/>(不能查询中文)
    </s:form>

    <h2>读者信息列表</h2>
    <table border="1" style="min-width: 600px">
        <tr>
            <td><a href="javascript:selectAll()">全选/反选</a></td>
            <td>编号</td>
            <td>读者姓名</td>
            <td>读者身份证号码</td>
            <td>读者电话</td>
            <td>录入时间</td>
            <td>读者操作</td>
            <td>备注</td>
            <td>管理</td>
        </tr>
        <s:iterator value="#request.readersList" var="r" status="ids">
            <s:if test="#request.readersList == null || #request.readersList == ''">
                <tr><td colspan="6" style="color: red">没有任何数据</td></tr>
            </s:if>
            <tr>
                <td><input type="checkbox" name="id" value="${r.rno}"></td>
                <td>${ids.count}</td>
                <td>${r.rname}</td>
                <td>${r.idcard}</td>
                <td>${r.rtel}</td>
                <td>${r.rdotime.toString().substring(0,10)}</td>
                <td>${r.rbehavior}</td>
                <td style="max-width: 260px;">${r.remarks}</td>
                <td>
                    <input type="hidden" value="${rno}"/>
                    <a href="${pageContext.request.contextPath}/readerAction_toUpdateReader?readers.rno=${r.rno}">修改</a>&nbsp;|&nbsp;
                    <a href="javascript:;" onclick="deleteReader(this)">删除</a>
                </td>
            </tr>
        </s:iterator>
    </table>
<a href="javascript:deleteAllReaders()">删除所选读者信息</a>
</body>
<script type="text/javascript">

    function selectAll(){
        if ($(":checkbox:checked").length>0){
            $(":checkbox").prop("checked",false);
        }else {
            $(":checkbox").prop("checked",true);
        }
    }

    function deleteAllReaders(){
        var ids=$(":checkbox:checked");
        if (ids.length==0){
            alert("请选择要删除的读者信息");
        }else {
            var param = $(":checkbox").serialize();
            if(confirm('你确定要删除这些读者信息吗？')){
                location.href='readerAction_deleteAllReader?'+param;
                return true;
            }else {
                return false;
            }
        }
    }

    function deleteReader(ob) {
        var $val=$(ob).parent().find("input");
        var theValue= $($val.get(0)).val();
        var $text=$(ob).parent().parent().find("td");
        var theText=$($text.get(1)).text();
        if (confirm(theText+'的信息将会被删除！')){
            location.href="readerAction_deleteReader?readers.rno="+theValue;
            return true;
        }
    }

    function sVagueDate() {
        var theValue = $("#VagueDate").val();
        var reg = /^[A-Za-z0-9\-]+/;
        if (theValue.length>0){
            if (!reg.test(theValue)){
                alert("不能输入中文和中文的标点符号！");
                event.preventDefault();
            }
        }
//        alert(theValue);
    }
</script>
</html>
