package cn.lnu.entity;

import cn.lnu.util.FormatDate;

import java.util.Date;

/**
 * 历史数据管理
 * @Author ccl
 * @Date 2019/4/27
 */
public class HistoricalData {
    private Long id;

    //设备名
    private String handler;

    //最低温度阈值
    private int min_temp;

    //最高温度阈值
    private int max_temp;

    //当前温度
    private int temp;

    //超温
    private int exceed;

    //温度异常通知的用户
    private String notify;

    //创建时间
    private Date created;

    public HistoricalData() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public int getMin_temp() {
        return min_temp;
    }

    public void setMin_temp(int min_temp) {
        this.min_temp = min_temp;
    }

    public int getMax_temp() {
        return max_temp;
    }

    public void setMax_temp(int max_temp) {
        this.max_temp = max_temp;
    }

    public int getTemp() {
        return temp;
    }

    public void setTemp(int temp) {
        this.temp = temp;
    }

    public int getExceed() {
        if(temp>=min_temp&&temp<=max_temp){
            this.exceed = 0;
        }else if(temp<min_temp){
            this.exceed = temp - min_temp;
        }else{
            this.exceed = temp - max_temp;
        }
        return exceed;
    }

    public void setExceed(int exceed) {
         this.exceed = exceed;
    }

    public String getNotify() {
        return notify;
    }

    public void setNotify(String notify) {
        this.notify = notify;
    }

    public String getCreated() {
        String date = FormatDate.mdhms(created.toString());
        return date;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "HistoricalData{" +
                "id=" + id +
                ", handler='" + handler + '\'' +
                ", min_temp=" + min_temp +
                ", max_temp=" + max_temp +
                ", temp=" + temp +
                ", exceed=" + getExceed() +
                ", notify='" + notify + '\'' +
                ", created=" + FormatDate.mdhms(created.toString()) +
                '}';
    }
}
