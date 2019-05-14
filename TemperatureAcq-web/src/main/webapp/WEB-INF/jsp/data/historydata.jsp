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
    <link rel="stylesheet" href="http://www.jemui.com/demo/css/jeui.css"  media="all">
    <link rel="stylesheet" href="http://www.jemui.com/demo/css/skin/jedate.css"  media="all">
    <link rel="stylesheet" href="${ctx}/static/css/mycss/combo.select.css"  media="all">
    <!-- Core Javascript -->
    <script src="${ctx}/static/js/js/bootstrap.min.js"></script>
    <script src="http://www.jemui.com/demo/js/modules/jeui.js"></script>

</head>

<body>
<div style="margin-left: 20px">
    <!--====================================================
             导航栏
    ======================================================-->
    <div align="left"><font size="4"><b>超温历史数据&nbsp;
        /&nbsp;Overtemperature historical data</b></font></div><br/>
    <!--====================================================
             下拉菜单、日期联动、查询
    ======================================================-->
    <div align="left" style="margin-left: 30px;margin-top: -30px;height: 70px;width: auto;">
        <div class="zzsc" style="float: left;margin-top: 20px;width: 140px;">
            <select>
                <option value="" selected>全部设备</option>
                <c:forEach items="${handlers}" var="head">
                    <option value="${head.ip}">${head.handler}</option>
                </c:forEach>
            </select>
        </div>
        <div class="je-p20"style="margin-left: 10px;width: 650px;float: left;">
            <p>
                <input type="text" name="title" id="inpstart" placeholder="开始日期" readonly class="je-input je-pl5 je-pr5">
                &nbsp;至&nbsp;<input type="text" name="title" id="inpend" placeholder="结束日期" readonly class="je-input je-pl5 je-pr5">
                <button type="button" class="btn btn-info">查询</button>
            </p>
        </div>
        <script type="text/javascript">
            jeui.use(["jquery","jeDate"],function () {
                var start = {
                    format: 'YYYY-MM-DD hh:mm:ss',
                    minDate: '1949-10-01 00:00:00', //设定最小日期为当前日期
                    // isinitVal:true,//是否设置初值
                    //festival:true,//是否显示农历
                    ishmsVal:false,
                    onClose:true,
                    maxDate: $.nowDate({DD:0}), //最大日期
                    choosefun: function(elem, val, date){
                        end.minDate = date; //开始日选好后，重置结束日的最小日期
                        endDates();
                    }
                };
                var end = {
                    format: 'YYYY-MM-DD hh:mm:ss',
                    minDate: '1949-10-01 00:00:00', //设定最小日期为当前日期
                    //festival:true,
                    onClose:true,
                    maxDate: $.nowDate({DD:0}), //最大日期
                    choosefun: function(elem, val, date){
                        start.maxDate = date; //将结束日的初始值设定为开始日的最大日期
                    }
                };
                //这里是日期联动的关键
                function endDates() {
                    //将结束日期的事件改成 false 即可
                    end.trigger = false;
                    $("#inpend").jeDate(end);
                }
                $('#inpstart').jeDate(start);
                $('#inpend').jeDate(end);
            });

        </script>
    </div>
    <!--=======================================================
            超温历史数据表
    =========================================================-->
    <%--<div class="page-content d-flex align-items-stretch">--%>

        <%--<div class="content-inner chart-cont">--%>

            <!--***** CONTENT *****-->
            <div style="margin-left: 50px;margin-right: 50px">
                <table class="table table-hover" id="table1">
                    <thead>
                    <tr class="bg-info text-white">
                        <th>序号</th>
                        <th>Handler</th>
                        <th>正常范围</th>
                        <th>实际值</th>
                        <th>超出值</th>
                        <th>通知用户</th>
                        <th>创建时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${historicalDatas}" var="hd">
                    <tr>
                        <th>${hd.id}</th>
                        <th>${hd.handler}</th>
                        <th>${hd.min_temp}&#8451;~${hd.max_temp}&#8451;</th>
                        <th>${hd.temp}&#8451;</th>
                        <th>${hd.exceed}&#8451;</th>
                        <th>${hd.notify}</th>
                        <th>${hd.created}</th>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div align="center">
                    <font size="2">共${page.totalPageCount}页</font>
                    <font size="2">第${page.pageNow}页</font>
                    <a href="${ctx}/data/histotydata.do?pageNow=1">首页</a>
                    <c:choose>
                        <c:when test="${page.pageNow-1 > 0}">
                            <a href="${ctx}/data/histotydata.do?pageNow=${page.pageNow-1}">上一页</a>
                        </c:when>
                        <c:when test="${page.pageNow-1 <= 0}">
                            <a href="${ctx}/data/histotydata.do?pageNow=1">上一页</a>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page.totalPageCount == 0}">
                            <a href="${ctx}/data/histotydata.do?pageNow=${page.pageNow}">下一页</a>
                        </c:when>
                        <c:when test="${page.pageNow+1 < page.totalPageCount}">
                            <a href="${ctx}/data/histotydata.do?pageNow=${page.pageNow+1}">下一页</a>
                        </c:when>
                        <c:when test="${page.pageNow+1 >= page.totalPageCount}">
                            <a href="${ctx}/data/histotydata.do?pageNow=${page.totalPageCount}">下一页</a>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page.totalPageCount==0}">
                            <a href="${ctx}/data/histotydata.do?pageNow=${page.pageNow}">尾页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/data/histotydata.do?pageNow=${page.totalPageCount}">尾页</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        <%--</div>--%>
    <%--</div>--%>
</div>

<!--Global Javascript -->
<script src="${ctx}/static/js/js/jquery.min.js"></script>
<script src="http://www.jemui.com/demo/js/userdata.js"></script>
<script src="${ctx}/static/js/myjs/jquery.combo.select.js"></script>
<script src="${ctx}/static/js/popper/popper.min.js"></script>
<script src="${ctx}/static/js/js/tether.min.js"></script>
<script src="${ctx}/static/js/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/js/jquery.cookie.js"></script>
<script src="${ctx}/static/js/js/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/js/chart.min.js"></script>
<script src="${ctx}/static/js/js/front.js"></script>

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
<script>
    $(function() {
        $('select').comboSelect();
        $('select').attr("ats","sdf");
    });
</script>
</body>

</html>