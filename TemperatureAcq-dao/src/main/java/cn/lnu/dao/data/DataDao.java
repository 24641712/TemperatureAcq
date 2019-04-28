package cn.lnu.dao.data;

import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.Temperature;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 持久层
 * @Author
 * @Date 2019/4/22
 */
public interface DataDao {
    public List<Temperature> selectTemp();

    public int count();

    public List<Temperature> selectTempByPage(
            @Param(value = "startPos")Integer startPos,
            @Param(value="pageSize")Integer pageSize);

    //查询历史数据
    public List<HistoricalData> selectHistoricalDataByPage(
            @Param(value="startPos")Integer startPos,
            @Param(value="pageSize")Integer pageSize);

    //查询历史数据总数
    public int historicalDataCount();




}
