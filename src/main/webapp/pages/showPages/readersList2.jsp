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
                    location.href="${pageContext.request.contextPath}/readerAction_toUpdateReader2?readers.rno="+rno;
                }, 2200);
            })
        </script>
        <%--End--%>
    </s:if>
</s:elseif>

    查询：<s:textfield name="readers.rname"/>
    <input type="button" value="确定" onclick="vagueList()"/>(无法查询日期)
    <br/><br/>
    查询：<s:textfield name="rname"/>
    <input type="button" value="确定" onclick="vagueDateList()"/>(不能查询中文)

    <h2>读者信息列表</h2>
    <table border="1" id="tab" style="min-width: 600px">
        <tr>
            <td>编号</td>
            <td>读者姓名</td>
            <td>读者身份证号码</td>
            <td>读者电话</td>
            <td>录入时间</td>
            <td>读者操作</td>
            <td>备注</td>
            <td>管理</td>
        </tr>
    </table>
</body>
<script type="text/javascript">
    window.onload=loadData;
    function loadData() {
        $("#tab tr:not(:first)").remove();
        $.get("readerAction_findReadersList2","",function (data) {
            $.each(data.readersList,function (i,v) {
                var tr="<tr>";
                    tr+="<td>"+(i+1)+"</td>";
                    tr+="<td>"+v.rname+"</td>";
                    tr+="<td>"+v.idcard+"</td>";
                    tr+="<td>"+v.rtel+"</td>";
                    tr+="<td>"+v.rdotime.toString().substring(0,10)+"</td>";
                    tr+="<td>"+v.rbehavior+"</td>";
                    tr+="<td style='max-width: 260px;'>"+v.remarks+"</td>";
                    tr+="<td>" +
                        "<a href='${pageContext.request.contextPath}/readerAction_toUpdateReader2?readers.rno="+v.rno+"'>修改</a>" +
                        "</td>";
                    tr+="</tr>";
                $("#tab").append(tr);
            });
        },"json");
    }

    function vagueList() {
        $.ajax({
            url: "readerAction_findReaderVague2",
            data: "readers.rname="+$("input[name='readers.rname']").val(),
            type: "POST",
            dataType:"JSON",
            success:function (data) {
                $("table:first tr:not(:first)").remove();
                $.each(data, function (i,v) {
                    for(var i = 0; i < v.length; i++){
                        var tr="<tr>";
                            tr+="<td>"+(i+1)+"</td>";
                            tr+="<td>"+v[i].rname+"</td>";
                            tr+="<td>"+v[i].idcard+"</td>";
                            tr+="<td>"+v[i].rtel+"</td>";
                            tr+="<td>"+v[i].rdotime.toString().substring(0,10)+"</td>";
                            tr+="<td>"+v[i].rbehavior+"</td>";
                            tr+="<td style='max-width: 260px;'>"+v[i].remarks+"</td>";
                            tr+="<td>" +
                                "<a href='${pageContext.request.contextPath}/readerAction_toUpdateReader2?readers.rno="+v[i].rno+"'>修改</a>" +
                                "</td>";
                            tr+="</tr>";
                        $("table:first").append(tr);
                    }
                });
            }
        });
    }
    
    function vagueDateList() {
        $.ajax({
            url: "readerAction_findReaderVagueDate2",
            data: "readers.rname="+$("input[name='rname']").val(),
            type: "POST",
            dataType:"JSON",
            success:function (data) {
                $("table:first tr:not(:first)").remove();
                $.each(data, function (i,v) {
                    for(var i = 0; i < v.length; i++){
                        var tr="<tr>";
                        tr+="<td>"+(i+1)+"</td>";
                        tr+="<td>"+v[i].rname+"</td>";
                        tr+="<td>"+v[i].idcard+"</td>";
                        tr+="<td>"+v[i].rtel+"</td>";
                        tr+="<td>"+v[i].rdotime.toString().substring(0,10)+"</td>";
                        tr+="<td>"+v[i].rbehavior+"</td>";
                        tr+="<td style='max-width: 260px;'>"+v[i].remarks+"</td>";
                        tr+="<td>" +
                            "<a href='${pageContext.request.contextPath}/readerAction_toUpdateReader2?readers.rno="+v[i].rno+"'>修改</a>" +
                            "</td>";
                        tr+="</tr>";
                        $("table:first").append(tr);
                    }
                });
            }
        });

        var theValue = $("input[name='rname']").val();
        var reg = /^[A-Za-z0-9\-]+/;
        if (theValue.length>0){
            if (!reg.test(theValue)){
                alert("不能输入中文和中文的标点符号！");
                event.preventDefault();
            }
        }
    }
</script>
</html>
