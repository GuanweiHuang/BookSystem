<%--
  Created by IntelliJ IDEA.
  User: hgw
  Date: 2017/12/26
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head id="Head1">
    <title>图书管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="img/x-ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/default/easyui.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/outlook2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>

    <style type="text/css">
        a{
            color: blue;
            outline:none; /*去掉点击超链接以后出现的蓝色小框*/
            text-decoration: none; /*去掉超链接的下划线*/
        }
        a:hover{
            text-decoration: underline;
        }
    </style>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no" onload="startTime()">
    <%--<h4>当前登录用户:${LoginUser.uname}</h4>--%>


    <noscript>
        <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
            <img src="${pageContext.request.contextPath}/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>

    <div region="north" split="false" border="false" style="overflow: hidden; height: 30px;
        background: url(${pageContext.request.contextPath}/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 25px;color: #fff; font-family: Verdana, 微软雅黑,黑体">

        <%--<span style="padding-left: 10px; font-size: 16px; border: solid 1px red">--%>
        <span style="padding-left: 10px; font-size: 16px; border: solid 0px red">
            <img src="${pageContext.request.contextPath}/images/blocks.gif" width="20" height="20" align="absmiddle" />
            <%--<div style="border:4px solid red;"></div>--%>
                <%--<font style="font-size: 16px;border:1px solid red;">xxx图书</font>--%>
            xxx图书
        </span>

        <span style="float:right; padding-right:20px; font-size: 16px;" class="head">
            <a href="javascript:;" onclick="loginOut()">安全退出</a>
        </span>

    </div>

    <div region="south" split="false" style="height: 20px; background: #D2E0F2;">
    <%--split为false可以不能拖动--%>
    <%--<div region="south" split="true" style="height: 30px; background: green; ">--%>
        <div class="footer">图书管理系统</div>
    </div>

    <div region="west" split="true" title="功能列表" style="width:180px;" id="west">
        <div class="easyui-accordion" fit="true" border="false">
            <!--  导航内容 -->
            <!--功能列表内容-->
        </div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
            <div title="欢迎使用" style="padding:20px;overflow:hidden;background-image:url('${pageContext.request.contextPath}/images/main.png');background-size:100%;" id="home">

                <%--<c:forEach var="u" items="${userList }" varStatus="ids">--%>
                    <%--<span style="font-family:微软雅黑;font-size: 38px;color:White">${u.sauthor }</span><span style="font-family:微软雅黑;font-size: 38px;color:White">学员欢迎您的登录</span>--%>
                <%--</c:forEach>--%>
                <span style="font-family:微软雅黑;font-size: 38px;color:White">
                    ${LoginUser.uname}欢迎您的登录
                     <s:if test="#session.LoginUser.utype==1">
                         ,您当前的身份:超级管理员
                     </s:if>
                     <s:elseif test="#session.LoginUser.utype==2">
                        ,您当前的身份:管理员
                     </s:elseif>
                </span>

                <p id="time" style="font-family:微软雅黑;font-size: 38px;color:White">当前时间：
                    <font color="white">
                        <span id="nowDateTimeSpan" style="font-size:28px;"></span>
                    </font>
                </p>

                <p style="font-family:微软雅黑;font-size: 20px;color:White">
                    Tip:所有出售(买书)均为书籍损坏的赔偿
                </p>

            </div>
        </div>
    </div>


    <div id="mm" class="easyui-menu" style="width:150px;">
        <div id="mm-tabclose">关闭</div>
        <div id="mm-tabcloseall">全部关闭</div>
        <div id="mm-tabcloseother">除此之外全部关闭</div>
        <div class="menu-sep"></div>
        <div id="mm-tabcloseright">当前页右侧全部关闭</div>
        <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
    </div>


</body>

<script type="text/javascript">

    var _menus = {"menus":[
        <s:if test="#session.LoginUser.utype==1">
        {"menuid":"1","icon":"icon-sys","menuname":"&nbsp;用户设置",
            "menus":[
                {"menuname":"查询用户","icon":"icon-add","url":"${pageContext.request.contextPath}/userAction_findUsersList"},
                {"menuname":"已经销户的用户","icon":"icon-users","url":"${pageContext.request.contextPath}/userAction_findInvalidUsersList"},
                {"menuname":"添加用户","icon":"icon-users","url":"${pageContext.request.contextPath}/pages/addPages/addUser.jsp"}
            ]
        },
        </s:if>
        <s:elseif test="#session.LoginUser.utype==2">
        {"menuid":"1","icon":"icon-sys","menuname":"&nbsp;用户设置",
            "menus":[
                {"menuname":"查询用户","icon":"icon-add","url":"${pageContext.request.contextPath}/userAction_findUsersList2"},
                {"menuname":"添加用户","icon":"icon-users","url":"${pageContext.request.contextPath}/pages/addPages/addUser.jsp"}
            ]
        },
        </s:elseif>
        {"menuid":"8","icon":"icon-sys","menuname":"&nbsp;图书设置",
            "menus":[
                {"menuname":"出租或出售","icon":"icon-nav","url":"${pageContext.request.contextPath}/bookAction_findBookStatus1"},
                {"menuname":"归还图书","icon":"icon-nav","url":"${pageContext.request.contextPath}/bookAction_findBookStatus2"},
                {"menuname":"已售出图书","icon":"icon-nav","url":"${pageContext.request.contextPath}/bookAction_findBookStatus3"},
                {"menuname":"查询图书","icon":"icon-nav","url":"${pageContext.request.contextPath}/bookAction_findBookList"},
                {"menuname":"添加图书","icon":"icon-nav","url":"${pageContext.request.contextPath}/pages/addPages/addBook.jsp"},
                {"menuname":"查询书籍类型","icon":"icon-nav","url":"${pageContext.request.contextPath}/btypeAction_findBtypeList"},
                {"menuname":"添加书籍类型","icon":"icon-nav","url":"${pageContext.request.contextPath}/pages/addPages/addBtype.jsp"}

            ]
        },{"menuid":"56","icon":"icon-sys","menuname":"&nbsp;读者设置",
                "menus":[
                    {"menuname":"查询读者","icon":"icon-nav","url":"${pageContext.request.contextPath}/readerAction_findReadersList"},
                <s:if test="#session.LoginUser.utype==1">
                    {"menuname":"读者行为","icon":"icon-nav","url":"${pageContext.request.contextPath}/readerAction_findReadersDo"},
                </s:if>
                <s:elseif test="#session.LoginUser.utype!=1">
                    {"menuname":"读者行为","icon":"icon-nav","url":"${pageContext.request.contextPath}/pages/showPages/readersDo2.jsp"},
                </s:elseif>
                    {"menuname":"添加读者","icon":"icon-nav","url":"${pageContext.request.contextPath}/pages/addPages/addReader.jsp"}
                ]
            },
        {"menuid":"28","icon":"icon-sys","menuname":"&nbsp;个人设置",
            "menus":[
                {"menuname":"我的信息","icon":"icon-nav","url":"${pageContext.request.contextPath}/userAction_toUpdateUserPer?user.uno=${LoginUser.uno}"},
                {"menuname":"修改密码","icon":"icon-nav","url":"${pageContext.request.contextPath}/userAction_toUpdateUserPwd?user.uno=${LoginUser.uno}"}
            ]
        }
    ]};

    function loginOut() {
        $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
            if (r) {
                location.href = '${pageContext.request.contextPath}/index.jsp';
            }
        });
    }


    //当前时间

    function startTime()
    {
        var today=new Date();//定义日期对象
        var yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
        var MM = today.getMonth()+1;//通过日期对象的getMonth()方法返回年
        var dd = today.getDate();//通过日期对象的getDate()方法返回年
        var hh=today.getHours();//通过日期对象的getHours方法返回小时
        var mm=today.getMinutes();//通过日期对象的getMinutes方法返回分钟
        var ss=today.getSeconds();//通过日期对象的getSeconds方法返回秒
        // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
        MM=checkTime(MM);
        dd=checkTime(dd);
        mm=checkTime(mm);
        ss=checkTime(ss);
        var day; //用于保存星期（getDay()方法得到星期编号）
        if(today.getDay()==0)   day   =   "星期日 "
        if(today.getDay()==1)   day   =   "星期一 "
        if(today.getDay()==2)   day   =   "星期二 "
        if(today.getDay()==3)   day   =   "星期三 "
        if(today.getDay()==4)   day   =   "星期四 "
        if(today.getDay()==5)   day   =   "星期五 "
        if(today.getDay()==6)   day   =   "星期六 "
        document.getElementById('nowDateTimeSpan').innerHTML=yyyy+"年-"+MM +"月-"+ dd +"日 " + hh+":"+mm+":"+ss+"   " + day;
        setTimeout('startTime()',1000);//每一秒中重新加载startTime()方法
    }

    function checkTime(i)
    {
        if (i<10){
            i="0" + i;
        }
        return i;
    }


    javascript :window.history.forward(0);
</script>

</html>
