package cn.lnu.entity.insert_pojo;

import cn.lnu.entity.TbFacility;

import java.util.Date;

/**
 * @Author
 * @Date 2019/5/11
 */
public class InsertTbFacility extends TbFacility {
    private Date insertUpload;

    public InsertTbFacility() {
    }

    public Date getInsertUpload() {
        return insertUpload;
    }

    public void setInsertUpload(Date insertUpload) {
        this.insertUpload = insertUpload;
    }

    @Override
    public String toString() {
        return "InsertTbFacility{" +
                "insertUpload=" + insertUpload +
                '}';
    }
}
