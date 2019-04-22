package cn.lnu.dao.data;

import cn.lnu.entity.User;

import java.util.List;

/**
 * 持久层
 * @Author
 * @Date 2019/4/22
 */
public interface DataDao {
    public List<User> findAllUser();



}
