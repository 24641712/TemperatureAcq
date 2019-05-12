package cn.lnu.dao.data;

import cn.lnu.entity.TbFacility;
import cn.lnu.entity.insert_pojo.InsertTbFacility;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 设备信息持久化
 * @Author ccl
 * @Date 2019/4/25
 */
public interface TbFacilityDao {
    public List<TbFacility> findAllTbFacilities();

    public int count(@Param(value = "handler") String handler);

    public List<TbFacility> selectTbFacilityByPage(
            @Param(value = "startPos") Integer startPos,
            @Param(value = "pageSize") Integer pageSize,
            @Param(value="handler") String handler);

    //查询设备
    public List<TbFacility> selectHandlers();

    //添加设备
    public int insertTbFacility(InsertTbFacility insertTbFacility);




}
