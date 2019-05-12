package cn.lnu.serviceimpl;

import cn.lnu.dao.user.TbUserDao;
import cn.lnu.entity.insert_pojo.InsertTbUser;
import cn.lnu.entity.TbUser;
import cn.lnu.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author
 * @Date 2019/4/22
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private TbUserDao tbUserDao;

    public List<TbUser> findAllTbUsers() {
        return tbUserDao.findAllTbUsers();
    }

    public int count(String yhm) {
        return tbUserDao.count(yhm);
    }

    public List<TbUser> selectTbUserByPage(int startPos, int pageSize,String yhm) {
        return tbUserDao.selectTbUsersByPage(startPos,pageSize,yhm);
    }

    public int addTbUser(InsertTbUser tbUser) {
        return tbUserDao.addTbUser(tbUser);
    }
}
