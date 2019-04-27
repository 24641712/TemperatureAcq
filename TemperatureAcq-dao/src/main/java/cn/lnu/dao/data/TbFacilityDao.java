package cn.lnu.dao.data;

import cn.lnu.entity.TbFacility;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 设备信息持久化
 * @Author ccl
 * @Date 2019/4/25
 */
public interface TbFacilityDao {
    public List<TbFacility> findAllTbFacilities();

    public int count();

    public List<TbFacility> selectTbFacilityByPage(
            @Param(value = "startPos") Integer startPos,
            @Param(value = "pageSize") Integer pageSize);




}
