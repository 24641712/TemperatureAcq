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

    <title>用户</title>
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
    <link rel="stylesheet" href="${ctx}/static/css/mycss/modal.css"  media="all">
    <!-- Core Javascript -->
    <script src="${ctx}/static/js/js/bootstrap.min.js"></script>
    <script src="http://www.jemui.com/demo/js/modules/jeui.js"></script>
</head>

<body>
<div style="margin-left: 20px">
    <!--======================================================
       添加新用户模态框
    =======================================================-->
    <!-- Modal -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header myModal-header">
                    <font size="4"><b>添加新用户</b></font>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body myModal-body">
                    <label>用户名:</label><input type="text" class="form-control" name="yhm" id="yhm" placeholder="用户名"><br/>
                    <label>Email:</label><input type="text" class="form-control" name="email" id="email" placeholder="username1@qorvo.com"><br/>
                    <span id="nameDiv2" style="color: red; font-size: 15px;"></span>
                </div>

                <div class="modal-footer myModal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-info" onclick="addTbUser() ">提交</button>
                </div>
            </div>
        </div>
    </div>
    <!--====================================================
             导航栏
    ======================================================-->
    <div align="left"><font size="4"><b>用户管理&nbsp;
        /&nbsp;User Management</b></font></div><br/>
    <!--====================================================
                 输入框、查询、添加新用户
    ======================================================-->
    <div align="left" style="margin-left: 30px;margin-top: -10px;height: 70px;width: auto;">
        <div style="float: left">
            <input type="text" class="form-control" placeholder="用户名" id="search_yhm"  style="width:280px;">
            <input type="hidden" id="searchyhm" value=""/>
        </div>
        <div>
            <button type="button" class="btn btn-info" onclick="searchResult()">查询</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">添加新用户</button>
        </div>
    </div>
    <!--=====================================================
              用户数据表
    =======================================================-->
    <!--***** CONTENT *****-->
    <div style="margin-left: 50px;margin-right: 50px;margin-top: -20px">
        <table class="table table-hover" id="table1">
            <thead>
            <tr class="bg-info text-white">
                <th>序号</th>
                <th>用户姓名</th>
                <th>Email</th>
                <th>创建时间</th>
                <th>编辑</th>
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
            <input type="hidden" id="pageNow" name="pageNow"/>
            <input type="hidden" id="totalPageCount" name="totalPageCount"/>
        </div>
    </div>
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
<script src="${ctx}/static/js/myjs/TbUser.js"></script>

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

   $('#myModal1').on('shown.bs.modal', function () {
       $("#yhm").val("");$("#email").val("");
       $("#nameDiv2").empty();
       $('#myInput').focus();
   })

   function searchResult(){
       var yhm = $("#search_yhm").val();
       var info = {"yhm":yhm,"pageNow":1};
       $.ajax({
           async:true,//异步加载
           timeout:1000,
           data:info,
           type:"POST",
           url:"ajax_tbUser.do",
           dataType:'json',
           success:function (data) {
               var tbUsers = data.tbUsers;
               var page = data.page;
               var table;
               if(page.totalPageCount>0){
                   $.each(tbUsers,function () {
                       table += " <tr>\n" +
                           " <th scope='row'>"+this.uid+"</th>\n" +
                           " <td>"+this.username+"</td>\n" +
                           " <td>"+this.email+"</td>\n" +
                           " <td>"+this.created+"</td>\n" +
                           " <td><a href='#'>编辑</a></td>\n"+
                           " </tr>";
                   })
                   $("#tbody").html(table);
                   $("#totalpage").html(page.totalPageCount);
                   $("#currentpage").html(page.pageNow);
                   $('#totalPageCount').val(page.totalPageCount);
                   $('#pageNow').val(page.pageNow);
                   $('#searchyhm').val(yhm);
               }else{
                   alert("没有符合条件的数据");
                   $("#tbody").empty();
                   $("#totalpage").html(0);
                   $("#currentpage").html(0);
                   $('#totalPageCount').val(0);
                   $('#pageNow').val(1);
                   $('#searchyhm').val(yhm);
               }
           },
           error:function (data) {
               alert("数据获取失败2");
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
</body>

</html>