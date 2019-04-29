import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.Temperature;
import cn.lnu.service.TemperatureService;
import cn.lnu.util.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;

/**
 * @Author ccl
 * @Date 2019/4/27
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:config/applicationContext.xml",
        "classpath:config/spring-mvc.xml"})
public class TemperatureControllerTest {

    @Resource
    private TemperatureService temperatureService;

    @Test
    public void getTemp(){
        List<Temperature> temps = temperatureService.selectTemp();
        System.out.println(temps.toString());
    }

    @Test
    public void getTempByPage(){
        int totalCount = temperatureService.count();
        Page page = new Page(totalCount,1);
        List<Temperature> temps = temperatureService.selectTempByPage(
                page.getStartPos(),page.getPageSize());
        for(Temperature temperature:temps){
            System.out.println(temperature.toString());
        }
    }

    @Test
    public void getHistoricalDataCount(){
        int totalCount = temperatureService.historicalDataCount();
        Page page = new Page(totalCount,1);
        List<HistoricalData> historicalDatas = temperatureService.selectHistoricalDataByPage(
                page.getStartPos(),page.getPageSize());
        for(HistoricalData historicalData:historicalDatas){
            System.out.println(historicalData.toString());
        }
        System.out.println(totalCount);
    }

    @Test
    public void selectHistoricalDataByTime(){
        String start = "2019-4-22 00:00:00";
        String end = "2019-5-30 00:00:00";
        List<Temperature> temps = null;
        temps = temperatureService.selectHistoricalDataByTime(start,end);
        for(Temperature temp:temps){
            System.out.println(temp.toString());
        }
    }






}
