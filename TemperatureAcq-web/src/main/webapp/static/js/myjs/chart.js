function  getData() {
    var start = $("#start").val();
    var end = $("#end").val();
    alert(start+" "+end);
    $.ajax({
        url:"${ctx}/data/item.do",
        type:"post",
        datatype:"json",
        success:function (res) {
            var list = res.list;
            var str="";
            for(i=0;i<=res.length;i++){
                str += list[i].id;
                str += list[i].title;
                str += list[i].price;
                str += list[i].image;
            }
            $("#reply").append("我在尝试");
            alert("走到这里了");
        },
        error:function () {
            alert("出错了");
        }





    });


}

function generateChart(data) {
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