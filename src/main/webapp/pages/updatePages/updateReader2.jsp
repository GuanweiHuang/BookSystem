<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2018/1/19
  Time: 16:44
  To change this template use File | Settings | File Templates.
  登记读者（顾客）
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jNotify.jquery.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jNotify.jquery.js"></script>


    <style type="text/css">
        .title{
            text-align:center;
            text-align:justify;
            text-justify:distribute-all-lines;
            text-align-last:justify
        }
        .tip{
            text-align: left;
            color: #1c94c4;
            padding-left: 5px;
        }

        textarea{
            width: 210px;
            height: 100px;
        }

        input[type='text']{
            width: 200px;
        }

        .other{
            height: 10px;
        }
    </style>
</head>
<body>

<h2>修改读者信息</h2>
<s:form action="readerAction_updateReader2" method="POST">
    <s:hidden name="readers.rno"/>
    <table border="0" width="500">
        <tr>
            <td class="title">读者姓名</td>
            <td class="text">:<s:textfield name="readers.rname"/></td>
            <td class="tip" id="tip_rname">姓名不能为空</td>
        </tr>
        <tr><td colspan="3" class="other"></td></tr>
        <tr>
            <td class="title">读者身份证</td>
            <td class="text">:<s:textfield name="readers.idcard"/></td>
            <td class="tip" id="tip_idcard">请输入正确的身份证号码</td>
        </tr>
        <tr><td colspan="3" class="other"></td></tr>
        <tr>
            <td class="title">读者电话</td>
            <td class="text">:<s:textfield name="readers.rtel"/></td>
            <td class="tip" id="tip_rtel">请输入正确的电话</td>
        </tr>
        <tr><td colspan="3" class="other"></td></tr>
        <tr>
            <td class="title">执行时间</td>
            <td class="text">:<s:textfield name="readers.rdotime"/></td>
            <td class="tip" id="tip_rdotime">格式为yyyy-mm-dd</td>
        </tr>
        <tr><td colspan="3" class="other"></td></tr>
        <tr>
            <td class="title">操作</td>
            <td class="text">:<s:checkboxlist name="readers.rbehavior" list="{'买书','租书'}"/></td>
            <td class="tip" id="tip_rbehavior">请选择读者的操作</td>
        </tr>
        <tr><td colspan="3" class="other"></td></tr>
        <tr>
            <td class="title">备注</td>
            <td class="text"><s:textarea name="readers.remarks"/></td>
            <td class="tip" id="tip_remarks">请输入读者的操作</td>
        </tr>
        <tr><td colspan="3" class="other"></td></tr>
        <tr>
            <td colspan="3" style="text-align: center;">
                <s:submit value="修改读者信息"/>&nbsp;&nbsp;
                <input type="reset" value="重置" id="reset"/>
                <input type="button" value="返回" onclick="ret()"/>
            </td>
        </tr>
    </table>
</s:form>
</body>
<script type="text/javascript">

    //    function test() {
    //
    //        var id_array=new Array();
    //        $('input[name="readers.rbehavior"]:checked').each(function(){
    //            id_array.push($(this).val());//向数组中添加元素
    //        });
    //        var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串
    //        alert(idstr);
    //
    //    }

    $(function () {
        $("input[type='submit']").click(function () {
            //获取读者姓名
            var rname = $("input[name='readers.rname']").val();
            //获取读者身份证
            var idcard = $("input[name='readers.idcard']").val();
            //获取读者电话
            var rtel = $("input[name='readers.rtel']").val();
            //获取添加信息时间
            var rdotime = $("input[name='readers.rdotime']").val();
            //获取备注
            var remarks = $("textarea[name='readers.remarks']").val();
            //获取操作
            var rbehavior = $("input[name='readers.rbehavior']").val();

            //验证身份证
            var reg_idcard = /^\d{15}|\d{18}|[0-9]{14,17}(x|X)?$/;
            //验证手机
            var reg_tel1 = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
            //验证国内电话
            var reg_tel2 = /^\d{3}-\d{8}|\d{4}-\d{7}$/;
            //验证日期
            var reg_time = /^\d{4}-\d{1,2}-\d{1,2}$/;

            /*获取复选框选中的值*/
            var id_array=new Array();
            $('input[name="readers.rbehavior"]:checked').each(function(){
                id_array.push($(this).val());//向数组中添加元素
            });
            var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串
            /* */

            if ($(":checkbox:checked").length==0){
                $("#tip_rbehavior").html("<span style='color: red;'>请选择读者的操作</span>");
                event.preventDefault();
            }else {
                if (rname==null||rname==""){
                    $("#tip_rname").html("<span style='color: red;'>姓名不能为空</span>");
                    event.preventDefault();
                }

                if (!reg_idcard.test(idcard)){
                    $("#tip_idcard").html("<span style='color:red;'>请输入正确的身份证号码</span>");
                    event.preventDefault();
                }

                if(!reg_tel1.test(rtel)&&!reg_tel2.test(rtel)){
                    $("#tip_rtel").html("<span style='color: red'>请输入正确的电话</span>");
                    event.preventDefault();
                }

                if (!reg_time.test(rdotime)){
                    $("#tip_rdotime").html("<span style='color: red'>格式为yyyy-mm-dd</span>");
                    event.preventDefault();
                }

                if (remarks==null||remarks==""){
                    $("#tip_remarks").html("<span style='color: red'>请输入读者的操作</span>");
                    event.preventDefault();
                }
            }
        });

        $("#reset").click(function () {
            $("#tip_rbehavior").html("<span style='color: #1c94c4;'>请选择读者的操作</span>");
            $("#tip_rname").html("<span style='color: #1c94c4;'>姓名不能为空</span>");
            $("#tip_idcard").html("<span style='color: #1c94c4;'>请输入正确的身份证号码</span>");
            $("#tip_rtel").html("<span style='color: #1c94c4'>请输入正确的电话</span>");
            $("#tip_rdotime").html("<span style='color: #1c94c4'>格式为yyyy-mm-dd</span>");
            $("#tip_remarks").html("<span style='color: #1c94c4'>请输入读者的操作</span>");
        });

        var behavior="${readers.rbehavior}";
        var chkbehaviors=document.getElementsByName("readers.rbehavior");
        for (var i= 0; i < chkbehaviors.length; i++) {
            if(behavior.indexOf(chkbehaviors[i].value)>=0){
                chkbehaviors[i].checked=true;
            }
        }
    });

    function ret() {
        location.href="${pageContext.request.contextPath}/pages/showPages/readersDo2.jsp";
    }
</script>
</html>
