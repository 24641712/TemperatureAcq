package cn.lnu.dao.user;

import cn.lnu.entity.insert_pojo.InsertTbUser;
import cn.lnu.entity.TbUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户操作
 * @Author ccl
 * @Date 2019/4/24
 */
public interface   TbUserDao {
    public List<TbUser> findAllTbUsers();

    public int count();

    public List<TbUser> selectTbUsersByPage(@Param(value="startPos")Integer startPos,
                                            @Param(value="pageSize")Integer pageSize);

    public int addTbUser(InsertTbUser tbUser);


}
