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

    <title>设备</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
</head>

<body>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<div style="margin-left: 20px;">
    <input type="text" value="Handler"/>
    <button>查询</button>
    <button>添加新设备</button>
</div>
<div class="page-content d-flex align-items-stretch">

    <div class="content-inner chart-cont">

        <!--***** CONTENT *****-->
        <div class="row">
            <table class="table table-hover">
                <thead>
                <tr class="bg-info text-white">
                    <th>序号</th>
                    <th>Handler</th>
                    <th>设备IP</th>
                    <th>正常范围</th>
                    <th>创建时间</th>
                    <th>编辑</th>
                    <th>查看详情</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr class="table-warning">
                    <th scope="row">2</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr class="table-success">
                    <th scope="row">3</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr class="table-danger">
                    <th scope="row">5</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr>
                    <th scope="row">6</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr class="table-info">
                    <th scope="row">7</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr>
                    <th scope="row">8</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr class="table-warning">
                    <th scope="row">9</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr>
                    <th scope="row">10</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                <tr class="table-success">
                    <th scope="row">11</th>
                    <td>DZ1S11</td>
                    <td>192.168.1.1</td>
                    <td>20&#8451;~22&#8451;</td>
                    <td>12/13 13:24:34</td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">查看详情</a></td>
                </tr>
                </tbody>
            </table>
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