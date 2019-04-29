package cn.lnu.service;

import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.Temperature;

import java.text.ParseException;
import java.util.List;

/**
 * @Author
 * @Date 2019/4/27
 */
public interface TemperatureService {

    public List<Temperature> selectTemp();

    public int count();

    //按条件查询温度
    public List<Temperature> selectTempByPage(int startPos,int pageSize);

    //按时间查找数据
    public List<Temperature> selectHistoricalDataByTime(String start,String end);

    public int historicalDataCount();

    //按条件查询历史温度
    public List<HistoricalData> selectHistoricalDataByPage(int startPos,int pageSize);

}
