//搜索功能
function searchResult() {
   var inpstart = $("#inpstart").val();
   var inpend = $("#inpend").val();
   var ip;
   $("#selectid option:selected").each(function () {
       ip = $(this).val();
   });
   if(inpstart==""||inpstart==null){
       alert("请选择开始时间");
   }else if(inpend==""||inpend==null){
       alert("请选择结束时间");
   }else{
       var info1 = "searchResult方法:"+"inpstart"+inpstart+", inpend"+inpend+", ip"+ip;
       var info = {"inpstart":inpstart,"inpend":inpend,"ip":ip};
       $.ajax({
           async:true,//异步加载
           timeout:1000,
           data:info,
           type:"POST",
           url:"/data/ajax_temp.do",
           dataType:'json',
           success:function (data) {
               var temps = data.temps;
               var page = data.page;
               var table;
               $.each(temps,function () {
                   table += " <tr>\n" +
                       " <th scope='row'>"+this.id+"</th>\n" +
                       " <td>"+this.handler+"</td>\n" +
                       " <td>"+this.temp+"&#8451;</td>\n" +
                       " <td>"+this.created+"</td>\n" +
                       " <td>"+this.upload+"</td>\n" +
                       " </tr>";
               })
               $("#totalpage").html(page.totalPageCount);
               $("#currentpage").html(page.pageNow);
               $("#tbody").html(table);
               $("#totalPageCount").val(page.totalPageCount);
               $("#pageNow").val(page.pageNow);
               $("#selectid_2").val(ip);
               $("#inpstart_2").val(inpstart);
               $("#inpend_2").val(inpend);
               for(var i=0;i<temps;i++){
                   alert(temps.created);
               }
           },
           error:function (data) {
               alert("出错了data:" +data);
           }
       });
   }
}

//初始化数据
function initTemp() {
    var inpstart_2 = $("#inpstart_2").val();
    var inpend_2 = $("#inpend_2").val();
    var ip_2 = $("#selectid_2").val();
    var info1 = "pageTemp方法:"+"inpstart"+inpstart_2+"inpend"+inpend_2+"ip"+ip_2;
    var info = {"inpstart":inpstart_2,"inpend":inpend_2,"ip":ip_2};
    $.ajax({
        async:true,//异步加载
        timeout:1000,
        data:info,
        type:"POST",
        url:"/data/ajax_temp.do",
        dataType:'json',
        success:function (data) {
            var temps = data.temps;
            var page = data.page;
            var table;
            $.each(temps,function () {
                table += " <tr>\n" +
                    " <th scope='row'>"+this.id+"</th>\n" +
                    " <td>"+this.handler+"</td>\n" +
                    " <td>"+this.temp+"&#8451;</td>\n" +
                    " <td>"+this.created+"</td>\n" +
                    " <td>"+this.upload+"</td>\n" +
                    " </tr>";
            })

            $("#totalpage").html(page.totalPageCount);
            $("#currentpage").html(page.pageNow);
            $("#tbody").html(table);
            $('#totalPageCount').val(page.totalPageCount);
            $('#pageNow').val(page.pageNow);

        },
        error:function (data) {
            alert("数据加载失败");
        }
    });
}

//翻页功能
function pageSearch() {
    var inpstart_2 = $("#inpstart_2").val();
    var inpend_2 = $("#inpend_2").val();
    var ip_2 = $("#selectid_2").val();
    var pageNow = $('#pageNow').val();
    var info1 = "pageTemp方法:"+"inpstart"+inpstart_2+"inpend"+inpend_2+"ip"+ip_2+"pageNow"+pageNow;
    var info = {"inpstart":inpstart_2,"inpend":inpend_2,"ip":ip_2,"pageNow":pageNow};
    $.ajax({
        async:true,//异步加载
        timeout:1000,
        data:info,
        type:"POST",
        url:"/data/ajax_temp.do",
        dataType:'json',
        success:function (data) {
            var temps = data.temps;
            var page = data.page;
            // alert(data.str);
            var table;
            $.each(temps,function () {
                table += " <tr>\n" +
                    " <th scope='row'>"+this.id+"</th>\n" +
                    " <td>"+this.handler+"</td>\n" +
                    " <td>"+this.temp+"&#8451;</td>\n" +
                    " <td>"+this.created+"</td>\n" +
                    " <td>"+this.upload+"</td>\n" +
                    " </tr>";
            })

            $("#totalpage").html(page.totalPageCount);
            $("#currentpage").html(page.pageNow);
            $('#totalPageCount').val(page.totalPageCount);
            $('#pageNow').val(page.pageNow);
            $("#tbody").html(table);
        },
        error:function (data) {
            alert("出错了" +data);
        }
    });
}


//给表格设置颜色
function setColor() {
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
