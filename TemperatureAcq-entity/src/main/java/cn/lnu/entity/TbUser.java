package cn.lnu.entity;

import cn.lnu.util.FormatDate;

import java.util.Date;

/**
 * @Author
 * @Date 2019/4/24
 */
public class TbUser {
    private Long uid;

    private String username;

    private String email;

    private Date created;

    public TbUser() { }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreated() {
       String date =  FormatDate.mdhms(created.toString());
        return date;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "TbUser{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", created=" + created +
                '}';
    }
}
