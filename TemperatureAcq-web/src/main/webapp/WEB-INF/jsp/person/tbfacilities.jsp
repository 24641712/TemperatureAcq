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
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/font-icon-style.css">
    <link rel="stylesheet" href="${ctx}/static/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/mycss/modal.css"  media="all">
    <link rel="stylesheet" href="${ctx}/static/css/mycss/fSelect.css" media="all"/>
</head>

<body>
<div style="margin-left: 20px">
    <!--======================================================
       添加新设备模态框
=======================================================-->
    <!-- Modal -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header myModal-header">
                    <font size="4"><b>添加新设备</b></font>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body myModal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Handler:</label>
                        <input type="text" class="form-control" id="handler" placeholder="DZ1S11">
                    </div>
                    <div class="form-group">
                        <label style="display: inline-block;width: 120px">&nbsp;&nbsp;设备IP:</label>
                        <input type="text" class="form-control" id="ip" placeholder="192.168.1.1">
                    </div>
                    <div class="form-group">
                        <div>
                            <label style="display: block;width: 300px">&nbsp;&nbsp;正常范围:</label>
                        </div>
                        <div class="form-inline">
                            <input type="text" class="form-control" id="min" name="min" placeholder="最低值&#8451;" style="width: 120px">&nbsp;~
                            &nbsp;<input type="text" class="form-control" id="max" name="max" placeholder="最高值&#8451;" style="width: 120px">
                        </div>
                    </div>
                    <div class="form-group" style="height: 97px">
                        <div>
                            <div>
                                <label>&nbsp;&nbsp;异常通知用户列表:</label>
                            </div>
                        </div>
                        <div>
                            <div class="container" style="width:250px;margin-left: -17px;">
                                <select class="demo" id="selectid" multiple="multiple" style="width: 80px">
                                    <optgroup label="Group1">
                                        <option value="用户1">用户1</option>
                                        <option value="用户2">用户2</option>
                                        <option value="用户3">用户3</option>
                                        <option value="用户4">用户4</option>
                                    </optgroup>
                                    <optgroup label="Group2">
                                        <option value="用户5">用户5</option>
                                        <option value="用户6">用户6</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div style="height: 30px;margin-top: 5px;">
                                <span id="selectcontainer">&nbsp;</span>
                            </div>
                       </div>
                        <span id="nameDiv2" style="color: red; font-size: 15px;"></span>
                    </div>
                </div>
                <div class="modal-footer myModal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-info" onclick="addFatifities()">提交</button>
                </div>
            </div>
        </div>
    </div>
    <!--====================================================
             导航栏
    ======================================================-->
    <div align="left"><font size="4"><b>设备管理&nbsp;
        /&nbsp;Device Management</b></font></div><br/>
    <!--====================================================
                 输入框、查询、添加新用户
    ======================================================-->
    <div align="left" style="margin-left: 30px;margin-top: -10px;height: 70px;width: auto;">
        <div style="float: left">
            <input type="text" class="form-control" id="search_handler" placeholder="handler" style="width:280px;">
            <input type="hidden" name="searchhandler" id="searchhandler">
        </div>
        <div>
            <button type="button" class="btn btn-info" onclick="searchResult()">查询</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2">添加新设备</button>
        </div>
    </div>
    <!--===============================================
            设备数据表
    ================================================-->
    <!--***** CONTENT *****-->
    <div style="margin-left: 50px;margin-right: 50px;margin-top: -20px">
        <table class="table table-hover" id="table1">
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
            <input type="hidden" id="pageNow" value=""/>
        </div>
    </div>
</div>
<!--Global Javascript -->
<script src="${ctx}/static/js/js/jquery.min.js"></script>
<script src="${ctx}/static/js/myjs/TbFacilities.js"></script>
<script src="${ctx}/static/js/myjs/fSelect.js"></script>
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
        searchResult();
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

    $('#myModal2').on('shown.bs.modal', function () {
        $("#handler").val("");$("#ip").val("");
        $("#min").val("");$("#max").val("");
        $("#nameDiv2").empty();
        $('#myInput').focus();
    })

    $(function() {
        $('.demo').fSelect();
    });

</script>
<script type="text/javascript">
    function searchResult() {
        var handler = $("#search_handler").val();
        var info = {"handler":handler,"pageNow":1};
        $.ajax({
            async:true,//异步加载
            timeout:1000,
            data:info,
            type:"POST",
            url:"/user/ajax_tbFacility.do",
            dataType:'json',
            success:function (data) {
                var tbFacilities = data.tbFacilities;
                var page = data.page;
                var table;
                if(page.totalPageCount>0){
                    $.each(tbFacilities,function () {
                        table += " <tr>\n" +
                            " <th scope='row'>"+this.fid+"</th>\n" +
                            " <td>"+this.handler+"</td>\n" +
                            " <td>"+this.ip+"</td>\n" +
                            " <td>"+this.min_temp+"</td>\n" +
                            " <td>"+this.max_temp+"</td>\n" +
                            " <td>"+this.notify+"</td>\n" +
                            " <td>"+this.created+"</td>\n" +
                            "<td><a href='#'>编辑</a></td>\n"+
                            "<td><a href='#'>查看详情</a></td>\n"+
                            " </tr>";
                    })
                    $("#tbody").html(table);
                    $("#totalpage").html(page.totalPageCount);
                    $("#currentpage").html(page.pageNow);
                    $('#totalPageCount').val(page.totalPageCount);
                    $('#pageNow').val(page.pageNow);
                    $('#searchhandler').val(yhm);

                }else{
                    alert("没有符合条件的数据");
                    $("#tbody").empty();
                    $("#totalpage").html(0);
                    $("#currentpage").html(0);
                    $('#totalPageCount').val(0);
                    $('#pageNow').val(1);
                    $('#searchhandler').val(yhm);
                }
            },
            error:function (data) {
                alert("出错了" +data);
            }
        });
    }
</script>

<script type="text/javascript">
    //首页
    function pageAjaxFirst() {
        $('#pageNow').val(1);
        pageSearch();
    }

    //上一页
    function pageAjaxPrev() {
        var pageNow = parseInt($('#pageNow').val());
        if (pageNow-1 > 0) {
            $('#pageNow').val(pageNow -1);
        }else{
            $('#pageNow').val(1);
        }
        pageSearch();
    }

    //下一页
    function pageAjaxNext(){
        var totalPageCount = parseInt($('#totalPageCount').val());
        var pageNow = parseInt($('#pageNow').val());
        if(totalPageCount==0){
            $('#pageNow').val(pageNow);

        }else if(pageNow+1<totalPageCount){
            $('#pageNow').val(pageNow+1);

        }else {
            $('#pageNow').val(totalPageCount);

        }
        pageSearch();
    }

    //尾页
    function pageAjaxEnd(){
        var totalPageCount = parseInt($('#totalPageCount').val());
        var pageNow = parseInt($('#pageNow').val());
        if(totalPageCount==0){
            $('#pageNow').val(pageNow);
        }else{
            $('#pageNow').val(totalPageCount);
        }
        pageSearch();
    }
</script>

<script type="text/javascript">
    function pageSearch() {
        var pageNow = $('#pageNow').val();
        var handler = $("#search_handler").val();
        var info = {"handler":handler,"pageNow":pageNow};
        $.ajax({
            async:true,//异步加载
            timeout:1000,
            data:info,
            type:"POST",
            url:"/user/ajax_tbFacility.do",
            dataType:'json',
            success:function (data) {
                var tbFacilities = data.tbFacilities;
                var page = data.page;
                var table;
                if(page.totalPageCount>0){
                    $.each(tbFacilities,function () {
                        table += " <tr>\n" +
                            " <th scope='row'>"+this.fid+"</th>\n" +
                            " <td>"+this.handler+"</td>\n" +
                            " <td>"+this.ip+"</td>\n" +
                            " <td>"+this.min_temp+"</td>\n" +
                            " <td>"+this.max_temp+"</td>\n" +
                            " <td>"+this.notify+"</td>\n" +
                            " <td>"+this.created+"</td>\n" +
                            "<td><a href='#'>编辑</a></td>\n"+
                            "<td><a href='#'>查看详情</a></td>\n"+
                            " </tr>";
                    })
                    $("#tbody").html(table);
                    $("#totalpage").html(page.totalPageCount);
                    $("#currentpage").html(page.pageNow);
                    $('#totalPageCount').val(page.totalPageCount);
                    $('#pageNow').val(page.pageNow);
                    $('#searchhandler').val(yhm);

                }else{
                    alert("没有符合条件的数据");
                    $("#tbody").empty();
                    $("#totalpage").html(0);
                    $("#currentpage").html(0);
                    $('#totalPageCount').val(0);
                    $('#pageNow').val(1);
                    $('#searchhandler').val(yhm);
                }
            },
            error:function (data) {
                alert("出错了" +data);
            }
        });
    }
</script>

</body>
</html>