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

    <title>折线图 </title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">

</head>

<body>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<div class="page-content d-flex align-items-stretch">

    <div class="content-inner chart-cont">

        <!--***** CHART *****-->
        <div class="row">
            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="bar-chart" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="line-chart" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="line-chart-2D" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="pie-chart1" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="pie-chart2" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="radar-chart" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="polar-chart1" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="polar-chart2" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="doughnut-chart1" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="doughnut-chart2" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="bar-chart-horizontal" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="bar-chart-grouped" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="mixed-chart" width="400" height="400"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="bubble-chart" width="400" height="400"></canvas>
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
<script src="${ctx}/static/js/chart-page.js"></script>
<script>
    new Chart(document.getElementById("myChart-nav").getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ["M", "T", "W", "T", "F", "S", "S"],
            datasets: [{
                backgroundColor: [
                    "#2ecc71",
                    "#3498db",
                    "#95a5a6",
                    "#9b59b6",
                    "#f1c40f",
                    "#e74c3c",
                    "#34495e"
                ],
                data: [12, 19, 3, 17, 28, 24, 7]
            }]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: ''
            }
        }
    });
</script>

</body>

</html>