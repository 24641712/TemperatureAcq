//添加设备
function addFatifities() {
      var handler = $("#handler").val();
      var ip =$("#ip").val();
      var min = $("#min").val();
      var max =$("#max").val();
      var options = "";
      $("#selectid option:selected").each(function () {
         options += $(this).val()+",";
     })
    if(handler==""||handler==null){
          $("#nameDiv2").html("Handler不能为空!");
          return;
      }else if(ip==""||ip==null){
          $("#nameDiv2").html("ip不能为空!");
          return;
      }else if(min==""||min==null){
          $("#nameDiv2").html("温度最低值不能为空!");
          return;
      }else if(max==""||max==null){
          $("#nameDiv2").html("温度最高值不能为空!");
          return;
      }else if(options == ""||options==null){
        $("#nameDiv2").html("请选择异常时通知的用户!");
        return;

      }else{
        var length = options.length;
        options = options.substring(0,length-1);
        var info = {"handler":handler,"ip":ip,"min_temp":min,"max_temp":max,"notify":options};
        $.post("addTbFacility.do",
            info,
            function (data) {
                alert(data);
                $("#myModal2").modal("hide");
                $("#yhm").val("");
                $("#email").val("");
                pageSearch();
            },
            "text"
        );
    }
}

//显示已选择的用户
$('#selectid').on("change", function(){
    var options = "";
    $("#nameDiv2").empty();
    $("#selectid option:selected").each(function () {
        options += $(this).val()+"、";
    })
    var length = options.length;
    $("#selectcontainer").html("当前选择用户："+options.substring(0,length-1));
})

//验证IP地址
$("#ip").blur(function () {
    $("#nameDiv2").empty();
    var reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
    if(!reg.test($("#ip").val())){
        $("#nameDiv2").html("IP地址格式输入错误!");
        return;
    }
})

//判断最低温度值是否非法
$("#min").blur(function () {
    $("#nameDiv2").empty();
    var myRegExp = /^[\d]*$/;
    if(!myRegExp.test($("#min").val())){
        $("#nameDiv2").html("最小温度值必须为数字!");
        return;
    }else if($("#max").val()!="" && $("#max").val()!=null){
        if(($("#min").val()-$("#max").val())>0){
            $("#nameDiv2").html("最小温度值设置过高!");
            return;
        }
    }
});

//判断最高温度值是否非法
$("#max").blur(function () {
    var myRegExp = /^[\d]*$/;
    if(!myRegExp.test($("#max").val())){
        $("#nameDiv2").html("最大温度值必须为数字!");
        return;
    }else if(($("#min").val()-$("#max").val())>0){
        $("#nameDiv2").html("最小温度值设置过高!");
        return;
    }else{
        $("#nameDiv2").empty();
        return;
    }
});

