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
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
    <script src="http://www.jemui.com/demo/js/modules/jeui.js"></script>
    <!-- Core stylesheets -->
</head>

<body>
<div style="margin-left: 20px">
    <!--==============================================
               导航条
    ================================================-->
    <div align="left"><font size="4"><b>温度统计&nbsp;
        /&nbsp;Temperature statistics</b></font></div><br/>
    <!--====================================================
              下拉菜单、日期联动、数据导出
    ======================================================-->
    <div align="left" style="margin-left: 30px;margin-top: -30px;height: 70px;width: auto;">
        <div class="zzsc" style="float: left;margin-top: 20px;width: 140px;">
            <select id="selectid">
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
                <button type="button" class="btn btn-info" onclick="searchtemp(1)">查询</button>
                &nbsp;&nbsp;<button type="button" class="btn btn-success">数据导出</button>
                <input type="hidden" id="selectid_2"/>
                <input type="hidden" id="inpstart_2"/>
                <input type="hidden" id="inpend_2"/>
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
    <!--===============================================
              温度统计表数据
    =================================================-->

    <!--***** CONTENT *****-->
    <div style="margin-left: 50px;margin-right: 50px">
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
            <tbody id="tbody">
            </tbody>
        </table>
        <div align="center">
            <font size="2">共<span id="totalpage"></span>页</font>
            <font size="2">第<span id="currentpage"></span>页</font>
            <a href="#" onclick="pageAjaxFirst()">首页</a>

            <a href="#" onclick="pageAjaxPrev()">上一页</a>

            <a href="#" onclick="pageAjaxNext()">下一页</a>

            <a href="#" onclick="pageAjaxEnd()">尾页</a>

            <input type="hidden" id="totalPageCount" value=""/>
            <<input type="hidden" id="pageNow" value="">
        </div>
    </div>

</div>

<!--Global Javascript -->
<script src="${ctx}/static/js/js/jquery.min.js"></script>
<script src="http://www.jemui.com/demo/js/userdata.js"></script>
<script src="${ctx}/static/js/myjs/jquery.combo.select.js"></script>
<script src="${ctx}/static/js/popper/popper.min.js"></script>
<script src="${ctx}/static/js/js/tether.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/js/jquery.cookie.js"></script>
<script src="${ctx}/static/js/js/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/chart.min.js"></script>
<script src="${ctx}/static/js/js/front.js"></script>
<script src="${ctx}/static/js/myjs/temp_stat.js"></script>

<!--Core Javascript -->
<script type="text/javascript">
    window.onload = function () {
        alert("弹出数据");
        setColor()
        pageTemp(1);

        // var color = ['table-warning','table-success','table-danger','table-info']
        // var rows=document.getElementById("table1").rows;
        // var index = 0;
        // for(var i=1;i<rows.length;i++){
        //     if(i%2==0){
        //         rows[i].setAttribute('class',color[index++]);
        //     }
        //     if(index>=color.length){
        //         index = 0;
        //     }
        // }
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