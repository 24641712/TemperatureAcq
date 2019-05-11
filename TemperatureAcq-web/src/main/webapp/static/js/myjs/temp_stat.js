function searchtemp() {
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
       var info = {"inpstart":inpstart,"inpend":inpend,"ip":ip};
       alert(info)
       $.post(
           "/data/temp.do",
           info,
           function (data) {
               var temps = data.temps;
               $("#selectid_2").val(ip);
               $("#inpstart_2").val(inpstart);
               $("#inpend_2").val(inpend);
               for(var i=0;i<temps;i++){
                   alert(temps.created);
               }
               alert("调用成功");
           },
           "text"
       );
   }
}


function pageTemp(pageNow) {
    var inpstart_2 = $("#inpstart_2").val();
    var inpend_2 = $("#inpend_2").val();
    var ip_2 = $("#selectid_2").val();
    var info1 = "pageTemp方法:"+"inpstart"+inpstart_2+"inpend"+inpend_2+"ip"+ip_2+"pageNow"+pageNow;
    var info = {"inpstart":inpstart_2,"inpend":inpend_2,"ip":ip_2,"pageNow":pageNow};
    alert(info1)
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
            alert(data.str);
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
            console.log(table)
        },
        error:function (data) {
            alert("data:" +data);
        }
    })
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

//首页
function pageAjaxFirst() {
    alert("pageAjaxFirst");
    // $('#pageNow').val(1);
    // alert(1);
    // searchResult();
}

//上一页
function pageAjaxPrev() {
    alert("pageAjaxPrev");
    // var maxys = parseInt($('#totalPageCount').val());
    // var pageNow = parseInt($('#pageNow').val());
    // if (parseInt(pageNow)-1 > 0) {
    //     $('#pageNow').val(pageNow -1);
    //     alert(pageNow -1);
    // }else{
    //     $('#pageNow').val(1);
    //     alert(1);
    // }
    // searchResult();
}

//下一页
function pageAjaxNext(){
    alert("pageAjaxNext");
    // var totalPageCount = parseInt($('#totalPageCount').val());
    // var pageNow = parseInt($('#pageNow').val());
    // if(totalPageCount==0){
    //     $('#pageNow').val(pageNow);
    //     alert(pageNow)
    // }else if(pageNow+1<totalPageCount){
    //     $('#pageNow').val(pageNow+1);
    //     alert(pageNow+1)
    // }else {
    //     $('#pageNow').val(totalPageCount);
    //     alert(totalPageCount)
    // }
    // searchResult();
}

//尾页
function pageAjaxEnd(){
    alert("pageAjaxEnd");
    // var totalPageCount = parseInt($('#totalPageCount').val());
    // var pageNow = parseInt($('#pageNow').val());
    // if(totalPageCount==0){
    //     $('#pageNow').val(pageNow);
    //     alert(pageNow)
    // }else{
    //     $('#pageNow').val(totalPageCount);
    //     alert(totalPageCount)
    // }
    // searchResult();
}

function searchResult() {
    alert("正在搜索数据");
}
