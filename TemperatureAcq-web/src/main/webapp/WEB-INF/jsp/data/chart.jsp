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
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="http://www.jemui.com/demo/css/jeui.css"  media="all">
    <link rel="stylesheet" href="http://www.jemui.com/demo/css/skin/jedate.css"  media="all">
    <link rel="stylesheet" href="${ctx}/static/css/mycss/bootstrap-theme.min.css"  media="all">
    <link rel="stylesheet" href="${ctx}/static/css/mycss/combo.select.css"  media="all">
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
    <script src="http://www.jemui.com/demo/js/modules/jeui.js"></script>

</head>

<body>
<div>
<div align="left" style="margin-left: 30px;margin-top: -10px;height: 70px;width: auto">
    <div class="zzsc" style="float: left;margin-top: 20px;width: 140px;">
        <select>
            <option value="" selected>全部设备</option>
            <option value="一月">DZ1S11</option>
            <option value="二月">DZ1S1</option>
            <option value="三月">DZ1S19</option>
            <option value="四月">DZ1S26</option>
            <option value="五月">DZ5S10</option>
            <option value="六月">DZ7S04</option>
            <option value="七月">DZ1S26</option>
            <option value="八月">DZ5S10</option>
            <option value="九月">DZ7S04</option>
        </select>
    </div>
    <div class="je-p20"style="margin-left: 130px;width: 500px">
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
<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="content-inner chart-cont">
        <div id="main" style="height:400px;margin-left: 10px"></div>
        <script type="text/javascript">
            window.onload=function (data) {
                var myChart = echarts.init(document.getElementById('main'), 'macarons');
                option = {
                    title: {
                        text: '当前时间段温度变化',
                        subtext: '纯属虚构'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['最高气温', '最低气温']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日','周','周']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} °C'
                            }
                        }
                    ],
                    series: [
                        {
                            name: '最高气温',
                            type: 'line',
                            data: [11,9,10, 11, 15, 13, 12, 13, 10],
                            markPoint: {
                                data: [
                                    {type: 'max', name: '最大值'},
                                    {type: 'min', name: '最小值'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name: '最低气温',
                            type: 'line',
                            data: [1, -2, 2, 5, 3, 2, 0],
                            markPoint: {
                                data: [
                                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        }
                    ]
                };

                myChart.setOption(option);
            }
        </script>
    </div>
</div>

<!--Global Javascript -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="http://www.jemui.com/demo/js/userdata.js"></script>
<script src="${ctx}/static/js/myjs/jquery.combo.select.js"></script>
<script src="${ctx}/static/js/popper/popper.min.js"></script>
<script src="${ctx}/static/js/tether.min.js"></script>
<script src="${ctx}/static/js/echarts-all.js"></script>
<script src="${ctx}/static/js/chart.min.js"></script>
<script src="${ctx}/static/js/front.js"></script>
<script src="${ctx}/static/js/myjs/chart.js"></script>
<!--Core Javascript -->
<script src="${ctx}/static/js/chart-page.js"></script>
<script>
        $(function() {
            $('select').comboSelect();
            $('select').attr("ats","sdf");
        });
</script>
</body>

</html>