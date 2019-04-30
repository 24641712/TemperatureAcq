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

    <title>Bootstrap Admin Template </title>
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="${ctx}/static/css/ui-elements/card.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.css">
</head>

<body>
<div style="margin-left: 20px">
    <div align="left"><font size="4"><b>当前设备最新温度情况</b></font></div><br/>
    <!--====================================================
                            PAGE CONTENT
    ======================================================-->
    <div class="page-content d-flex align-items-stretch">
        <div class="content-inner">
            <!--***** REPORT-1 *****-->
            <div class="row" id="report1">
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0">
                                    <i class="ti-arrow-up text-success"></i>
                                    &nbsp;&nbsp;&nbsp;23&#8451;</h2>
                                <span class="text-muted">设备：DZ1S11</span>
                            </div>
                            <span class="text-success">0</span>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 80%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p><small>12/13 13:24:34</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0">
                                    <i class="ti-arrow-up text-danger"></i>
                                    &nbsp;&nbsp;&nbsp;24&#8451;</h2>
                                <span class="text-muted">设备：DZ1S1</span>
                            </div>
                            <span class="text-danger">+1</span>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 43%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p><small>12/13 13:24:34</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0">
                                    <i class="ti-arrow-up text-warning"></i>
                                    &nbsp;&nbsp;&nbsp;25&#8451;</h2>
                                <span class="text-muted">设备：DZ1S19 </span>
                            </div>
                            <span class="text-danger">+2</span>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 53%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p><small>12/13 13:24:34</small></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0">
                                    <i class="ti-arrow-up text-info"></i>
                                    &nbsp;&nbsp;&nbsp;21&#8451;</h2>
                                <span class="text-muted">设备：DZ1S26</span>
                            </div>
                            <span class="text-info">-2</span>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 70%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p><small>12/13 13:24:34</small></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--Global Javascript -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/popper/popper.min.js"></script>
<script src="${ctx}/static/js/tether.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/jquery.cookie.js"></script>
<script src="${ctx}/static/js/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/chart.min.js"></script>
<script src="${ctx}/static/js/front.js"></script>
<!--Core Javascript -->
<script src="${ctx}/static/js/mychart.js"></script>
</body>

</html>