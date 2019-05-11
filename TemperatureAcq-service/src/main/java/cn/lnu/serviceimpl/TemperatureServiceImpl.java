package cn.lnu.serviceimpl;

import cn.lnu.dao.data.DataDao;
import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.Temperature;
import cn.lnu.service.TemperatureService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 设备温度
 * @Author ccl
 * @Date 2019/4/27
 */
@Service("temperatureService")
public class TemperatureServiceImpl implements TemperatureService {

    @Resource
    private DataDao dataDao;

    public List<Temperature> selectTemp() {
        return dataDao.selectTemp();
    }

    public int count(String inpstart, String inpend, String ip) {
        return dataDao.count(inpstart,inpend,ip);
    }


    public List<Temperature> selectTempByPage(int startPos, int pageSize,String inpstart,String inpend,String ip) {
        return dataDao.selectTempByPage(startPos,pageSize,inpstart,inpend,ip);
    }

    public List<Temperature> selectHistoricalDataByTime(String start, String end) {
        return dataDao.selectHistoricalDataByTime(start,end);
    }

    public int historicalDataCount() {
        return dataDao.historicalDataCount();
    }

    public List<HistoricalData> selectHistoricalDataByPage(int startPos, int pageSize) {
        return dataDao.selectHistoricalDataByPage(startPos,pageSize);
    }


}
