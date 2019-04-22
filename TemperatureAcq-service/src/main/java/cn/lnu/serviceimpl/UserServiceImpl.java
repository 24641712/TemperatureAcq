package cn.lnu.serviceimpl;

import cn.lnu.dao.user.UserDao;
import cn.lnu.entity.User;
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
    private UserDao userDao;


    public List<User> findAllUser() {
        return userDao.findAllUsers();
    }
}
