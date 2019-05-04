package cn.lnu.dao.user;

import cn.lnu.entity.MUser;

import java.util.List;

/**
 * 管理员数据库操作
 * @Author ccl
 * @Date 2019/5/3
 */
public interface MUserDao {

    public List<MUser> findAllMUser();

    public MUser selectByName(MUser mUser);


}
