package cn.lnu.dao.data;

import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.Temperature;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 持久层
 * @Author
 * @Date 2019/4/22
 */
public interface DataDao {
    public List<Temperature> selectTemp();

    public int count(@Param(value = "inpstart") String inpstart,
                     @Param(value = "inpend") String inpend,
                     @Param(value = "ip") String ip);

    public List<Temperature> selectTempByPage(
            @Param(value = "startPos")Integer startPos,
            @Param(value="pageSize")Integer pageSize,
            @Param(value = "inpstart") String inpstart,
            @Param(value = "inpend") String inpend,
            @Param(value = "ip") String ip);

    //查询历史数据
    public List<HistoricalData> selectHistoricalDataByPage(
            @Param(value="startPos")Integer startPos,
            @Param(value="pageSize")Integer pageSize);

    //查询历史数据总数
    public int historicalDataCount();

    //按时间查找数据
    public List<Temperature> selectHistoricalDataByTime(
            @Param(value = "start") String start,
            @Param(value = "end") String end);




}
