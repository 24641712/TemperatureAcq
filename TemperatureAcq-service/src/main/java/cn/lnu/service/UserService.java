package cn.lnu.service;

import cn.lnu.entity.insert_pojo.InsertTbUser;
import cn.lnu.entity.TbUser;

import java.util.List;

/**
 * @Author
 * @Date 2019/4/22
 */
public interface UserService {

    public List<TbUser> findAllTbUsers();

    public int count(String yhm);

    public List<TbUser> selectTbUserByPage(int startPos,int pageSize,String yhm);

    public int addTbUser(InsertTbUser tbUser);

}
