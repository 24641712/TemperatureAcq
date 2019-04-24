package cn.lnu.serviceimpl;

import cn.lnu.dao.user.TbUserDao;
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
}
