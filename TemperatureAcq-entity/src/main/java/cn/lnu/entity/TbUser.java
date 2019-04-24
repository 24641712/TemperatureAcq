package cn.lnu.entity;

import java.util.Date;

/**
 * @Author
 * @Date 2019/4/24
 */
public class TbUser {
    private Long Uid;

    private String username;

    private String email;

    private Date created;

    public TbUser() { }

    public Long getUid() {
        return Uid;
    }

    public void setUid(Long uid) {
        Uid = uid;
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

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "TbUser{" +
                "Uid=" + Uid +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", created=" + created +
                '}';
    }
}
