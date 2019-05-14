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
        $.post("addTbUser.do",
            {"yhm": yhm, "email": email},
            function (data) {
                alert(data);
                $("#myModal1").modal("hide");
                $("#yhm").val("");
                $("#email").val("");
                pageSearch();
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

function pageSearch() {
    var pageNow = $("#pageNow").val();
    var yhm = $("#searchyhm").val();
    var info = {"yhm":yhm,"pageNow":pageNow};
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
                $("#tbody").empty();
                $("#totalpage").html(0);
                $("#currentpage").html(0);
                $('#totalPageCount').val(0);
                $('#pageNow').val(1);
            }
        },
        error:function (data) {
            alert("数据获取失败1");
        }
    });
}

