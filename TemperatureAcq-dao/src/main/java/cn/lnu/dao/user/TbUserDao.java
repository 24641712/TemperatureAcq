package cn.lnu.dao.user;

import cn.lnu.entity.TbUser;

import java.util.List;

/**
 * 用户操作
 * @Author ccl
 * @Date 2019/4/24
 */
public interface   TbUserDao {
    public List<TbUser> findAllTbUsers();


}
