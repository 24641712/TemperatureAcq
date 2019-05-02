function addTbUser() {
    var yhm = $("#yhm").val();
    var email = $("#email").val();
    if(yhm==""||email==""||yhm==null||email==null){
        $("#nameDiv2").html("用户名或邮箱不能为空!");
        return;
    }
    alert("用户名："+yhm+"  email："+email);
    $.post("/user/addTbUser.do",
        {"yhm":yhm,"email":email},
        function (data) {
            alert(data);
            $("#myModal1").modal("hide");
            $("#yhm").val("");
            $("#email").val("");
        },
        "text"
        );

}