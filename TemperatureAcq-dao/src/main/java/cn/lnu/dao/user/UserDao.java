package cn.lnu.dao.user;

import cn.lnu.entity.User;

import java.util.List;

/**
 * @Author
 * @Date 2019/4/22
 */
public interface UserDao {
    public List<User> findAllUsers();

}
