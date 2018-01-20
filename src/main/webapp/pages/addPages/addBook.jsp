<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/18
  Time: 7:38
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

    <style type="text/css">
        .text{
            color: #1c94c4;
        }
    </style>

</head>
<body>
    <s:if test="#parameters.msg[0]==1">
        <script type="text/javascript">
            $(function () {
                jSuccess("添加成功！",{
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
            jError("添加失败！",{
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
            jError("添加失败！该书籍编号已存在！",{
                TimeShown : 2000,      // 显示时间：毫秒
                ShowTimeEffect : 100,  // 显示到页面上所需时间：毫秒
                HideTimeEffect : 100,  // 从页面上消失所需时间：毫秒
                HorizontalPosition : "center",
                VerticalPosition : "top",
            });
        </script>
    </s:elseif>

    <h2>添加书籍</h2>
    <s:form method="POST" action="bookAction_addBook">
        书籍名字：<s:textfield name="book.bname"/><span class="text" id="span_bname">&nbsp;&nbsp;请输入正确的书籍名字</span><br/>
        书籍编码：<s:textfield name="book.bno"/><span class="text" id="span_bno">&nbsp;&nbsp;请输入正确的书籍编码</span><br/>
        出租价格：<s:textfield name="book.bprice"/><span class="text" id="span_bprice">&nbsp;&nbsp;请输入正确的出租价格</span><br/>
        出售价格：<s:textfield name="book.price"/><span class="text" id="span_price">&nbsp;&nbsp;请输入正确的出售价格</span><br/>
        入库时间：<s:textfield name="book.bindate"/><span class="text" id="span_bindate">&nbsp;&nbsp;格式为yyyy-mm-dd</span><br/>
        <div style="height: 10px"></div>
        <select name="book.btype.btno">
            <option value="">请选择书籍类型</option>
        </select><span class="text" id="span_btype">&nbsp;&nbsp;请选择书籍类型</span>
        <div style="height: 10px"></div>
        <s:submit value="添加书籍" onclick="check()"/>
    </s:form>
    <input type="reset" onclick="reset()"/>
</body>
<script type="text/javascript">
    $(function () {
        $("select[name='book.btype.btno'] option:not(:first)").remove();
        $.post("bookAction_findBtypeList","",function (data) {
            $.each(data.btypeList,function (i,v) {
                var option="<option value='"+v.btno+"'>"+v.btname+"</option>";
                $("select:eq(0)").append(option);
            });
        },"json");
    });

    function check() {
        var bno=$("input[name='book.bno']").val();
        var bname=$("input[name='book.bname']").val();
        var bprice=$("input[name='book.bprice']").val();
        var price=$("input[name='book.price']").val();
        var bindate=$("input[name='book.bindate']").val();
        var select=$("select[name='book.btype.btno']").find("option:selected").val();
        var reg= /^[0-9]+(.[0-9]{2})?$/;
        var regdata= /^\d{4}-\d{1,2}-\d{1,2}$/;

        if (bno==null||bno==""){
            $("#span_bno").html("<span style='color: red;'>&nbsp;&nbsp;请输入正确的书籍编码</span>");
            event.preventDefault();
        }

        if (bname==null||bname==""){
            $("#span_bname").html("<span style='color: red;'>&nbsp;&nbsp;请输入正确的书籍名字</span>");
            event.preventDefault();
        }

        if (!reg.test(bprice)||bprice==0){
            $("#span_bprice").html("<span style='color: red;'>&nbsp;&nbsp;请输入正确的出租价格</span>");
            event.preventDefault();
        }

        if (!reg.test(price)||price==0){
            $("#span_price").html("<span style='color: red;'>&nbsp;&nbsp;请输入正确的出售价格</span>");
            event.preventDefault();
        }

        if (!regdata.test(bindate)){
            $("#span_bindate").html("<span style='color: red;'>&nbsp;&nbsp;格式为yyyy-mm-dd</span>");
            event.preventDefault();
        }

        if (select==null||select==""){
            $("#span_btype").html("<span style='color: red;'>&nbsp;&nbsp;请选择书籍类型</span>");
            event.preventDefault();
        }
    }

    function reset() {
            $("#span_bno").html("<span style='color: #1c94c4;'>&nbsp;&nbsp;请输入正确的书籍编码</span>");

            $("#span_bname").html("<span style='color: #1c94c4;'>&nbsp;&nbsp;请输入正确的书籍名字</span>");

            $("#span_bprice").html("<span style='color: #1c94c4;'>&nbsp;&nbsp;请输入正确的出租价格</span>");

            $("#span_price").html("<span style='color: #1c94c4;'>&nbsp;&nbsp;请输入正确的出售价格</span>");

            $("#span_bindate").html("<span style='color: #1c94c4;'>&nbsp;&nbsp;格式为yyyy-mm-dd</span>");

            $("#span_btype").html("<span style='color: #1c94c4;'>&nbsp;&nbsp;请选择书籍类型</span>");
    }
</script>
</html>
