package cn.lnu.service;

import cn.lnu.entity.MUser;

import java.util.List;

/**
 * @Author
 * @Date 2019/5/3
 */
public interface MUserService {
    public List<MUser> findAllMUser();

    public MUser selectByName(MUser mUser);

}
