function addTbUser() {
    var yhm = $("#yhm").val();
    var email = $("#email").val();
    var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
    if(yhm==""||yhm==null){
        $("#nameDiv2").html("用户名不能为空!");
        return;
    }else if(email==""||email==null){
        $("#nameDiv2").html("邮箱不能为空!");
        return;
    }else if(reg.test($("#email").val())){
        alert("用户名：" + yhm + "  email：" + email);
        $.post("/user/addTbUser.do",
            {"yhm": yhm, "email": email},
            function (data) {
                alert(data);
                $("#myModal1").modal("hide");
                $("#yhm").val("");
                $("#email").val("");
            },
            "text"
        );
    }
}

$("#email").blur(function () {
    $("#nameDiv2").empty();
    var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
    if(!reg.test($("#email").val())){
        $("#nameDiv2").html("邮箱格式输入错误!");
        return;
    }
})