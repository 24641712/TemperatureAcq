package cn.lnu.entity.insert_pojo;

import cn.lnu.entity.TbUser;

import java.util.Date;

/**
 * @Author
 * @Date 2019/5/11
 */
public class InsertTbUser  extends TbUser {
    private Date insertCreated;

    public InsertTbUser() {
    }

    public Date getInsertCreated() {
        return insertCreated;
    }

    public void setInsertCreated(Date insertCreated) {
        this.insertCreated = insertCreated;
    }

    @Override
    public String toString() {
        return "InsertTbUser{" +
                "insertCreated=" + insertCreated +
                '}';
    }
}
