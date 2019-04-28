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

    <title>设备温度统计</title>
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
</head>

<body>
<div align="left" style="margin-left: 20px;"><h5>温度统计&nbsp;
    /&nbsp;Temperature statistics</h5></div><br/>
<!--====================================================
                        PAGE CONTENT
======================================================-->
<div style="margin-left: 20px">
    <select>
        <option>所有设备</option>
        <option>DZ1S11</option>
        <option>DZ1S1</option>
        <option>DZ1S19</option>
        <option>DZ1S26</option>
        <option>DZ5S10</option>
        <option>DZ7S04</option>
    </select>
    <input type="text" value="开始时间"/>&nbsp;至&nbsp;
    <input type="text" value="结束时间"/>
    <button>查询</button>
    <button>导出数据</button>
</div>
<div class="page-content d-flex align-items-stretch">

    <div class="content-inner chart-cont">

        <!--***** CONTENT *****-->
        <div class="row">
            <table class="table table-hover" id="table1">
                <thead>
                <tr class="bg-info text-white">
                    <th>序号</th>
                    <th>Handler</th>
                    <th>温度值</th>
                    <th>创建时间</th>
                    <th>上传时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${temps}" var="temp">
                <tr>
                    <th scope="row">${temp.id}</th>
                    <td>${temp.handler}</td>
                    <td>${temp.temp}&#8451;</td>
                    <td>${temp.created}</td>
                    <td>${temp.upload}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <div align="center">
                <font size="2">共${page.totalPageCount}页</font>
                <font size="2">第${page.pageNow}页</font>
                <a href="${ctx}/data/temp.do?pageNow=1">首页</a>
                <c:choose>
                    <c:when test="${page.pageNow-1 > 0}">
                        <a href="${ctx}/data/temp.do?pageNow=${page.pageNow-1}">上一页</a>
                    </c:when>
                    <c:when test="${page.pageNow-1 <= 0}">
                        <a href="${ctx}/data/temp.do?pageNow=1">上一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount == 0}">
                        <a href="${ctx}/data/temp.do?pageNow=${page.pageNow}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow+1 < page.totalPageCount}">
                        <a href="${ctx}/data/temp.do?pageNow=${page.pageNow+1}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow+1 >= page.totalPageCount}">
                        <a href="${ctx}/data/temp.do?pageNow=${page.totalPageCount}">下一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${ctx}/data/temp.do?pageNow=${page.pageNow}">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx}/data/temp.do?pageNow=${page.totalPageCount}">尾页</a>
                    </c:otherwise>
                </c:choose>
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
<script type="text/javascript">
    window.onload = function () {
        var color = ['table-warning','table-success','table-danger','table-info']
        var rows=document.getElementById("table1").rows;
        var index = 0;
        for(var i=1;i<rows.length;i++){
            if(i%2==0){
                rows[i].setAttribute('class',color[index++]);
            }
            if(index>=color.length){
                index = 0;
            }
        }
    }
</script>
</body>

</html>