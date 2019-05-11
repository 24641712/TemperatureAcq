<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--获取绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <title>用户登录 </title>

    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">
    <!-- Core stylesheets -->
    <link rel="stylesheet" href="${ctx}/static/css/pages/login.css">
</head>

<body>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<section class="hero-area">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 ">
                <div class="contact-h-cont">
                    <h3 class="text-center"><img src="${ctx}/static/img/logo.png" class="img-fluid" alt=""></h3><br>
                    <form>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" placeholder="管理员">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="密码">
                        </div>
                        <button class="btn btn-general btn-blue" role="button" id="submit">
                            <i fa fa-right-arrow></i>
                           登录
                        </button>
                        <button class="btn btn-general btn-blue" role="button">
                            <i fa fa-right-arrow></i>
                            注册
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!--Global Javascript -->
<script src="${ctx}/static/js/js/jquery.min.js"></script>
<script src="${ctx}/static/js/js/tether.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    //实现用户登录验证功能
    $(function () {
        $("#submit").click(function () {
            username=$("#username").val();
            password=$("#password").val();
            var regInfo = {"username":username,"password":password};
            var successurl="${ctx}/m_user/index.do";
            $.ajax({
                async:false,
                url:"${ctx}/m_user/login.do",
                type:"post",
                data:regInfo,
                dataType:"json",
                success:function(data,xstatus,xhr){
                    if(data.code==1){
                        alert("登录成功");
                        window.open("${ctx}/m_user/index.do");
                        window.close();
                    }else if(data.code==2){
                        alert("账号或密码错误");
                    }
                },
                error:function(){
                    alert("请求异常");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $("body").keydown(function () {
        if(event.keyCode == "13"){
            $("#submit").click();
        }
    });
</script>
</body>

</html>