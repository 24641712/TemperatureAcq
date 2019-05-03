package cn.lnu.serviceimpl;

import cn.lnu.dao.user.MUserDao;
import cn.lnu.entity.MUser;
import cn.lnu.service.MUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * MUserService实现类
 * @Author ccl
 * @Date 2019/5/3
 */

@Service("mUserService")
public class MUserServiceImpl implements MUserService {
    @Resource
    private MUserDao mUserDao;

    public List<MUser> findAllMUser() {
        return mUserDao.findAllMUser();
    }
}
