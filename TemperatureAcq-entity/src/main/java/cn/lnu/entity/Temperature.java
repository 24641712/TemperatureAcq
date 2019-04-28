package cn.lnu.entity;

import cn.lnu.util.FormatDate;

import java.io.Serializable;
import java.util.Date;

/**
 * 设备温度实体
 * @Author ccl
 * @Date 2019/4/27
 */
public class Temperature {
    private Long id;

    private String handler;

    private int temp;

    private Date created;

    private Date upload;

    public Temperature() {
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

    public int getTemp() {
        return temp;
    }

    public void setTemp(int temp) {
        this.temp = temp;
    }

    public String getCreated() {
        String date = FormatDate.mdhms(created.toString());
        return date;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getUpload() {
        String date = FormatDate.mdhms(upload.toString());
        return date;
    }

    public void setUpload(Date uploead) {
        this.upload = uploead;
    }

    @Override
    public String toString() {
        return "Temperature{" +
                "id=" + id +
                ", handler='" + handler + '\'' +
                ", temp=" + temp +
                ", created=" + FormatDate.mdhms(created.toString()) +
                ", upload=" + FormatDate.mdhms(upload.toString()) +
                '}';
    }
}
