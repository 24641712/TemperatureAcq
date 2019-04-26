package cn.lnu.entity;

import java.util.Date;

/**
 * 设备实体
 * @Author ccl
 * @Date 2019/4/25
 */
public class TbFacility {
    private Long fid;

    private String handler;

    private String ip;

    private int min_temp;

    private int max_temp;

    private Date created;

    public TbFacility() {
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
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

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "TbFacility{" +
                "fid=" + fid +
                ", handler='" + handler + '\'' +
                ", ip='" + ip + '\'' +
                ", min_temp=" + min_temp +
                ", max_temp=" + max_temp +
                ", created=" + created +
                '}';
    }
}