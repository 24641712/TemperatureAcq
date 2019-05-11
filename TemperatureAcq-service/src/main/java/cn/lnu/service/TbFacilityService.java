package cn.lnu.service;

import cn.lnu.entity.TbFacility;
import cn.lnu.entity.insert_pojo.InsertTbFacility;

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

    public int insertTbFacility(InsertTbFacility insertTbFacility);


}
