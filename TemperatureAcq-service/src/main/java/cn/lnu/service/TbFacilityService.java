package cn.lnu.service;

import cn.lnu.entity.TbFacility;

import java.util.List;

/**
 * @Author ccl
 * @Date 2019/4/25
 */
public interface TbFacilityService {

    public List<TbFacility> findAllFacilities();

    public int count();

    public List<TbFacility> selectTbFacilityByPage(int startPos,int pageSize);

    public List<TbFacility> selectHandlers();


}
