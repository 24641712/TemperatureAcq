package cn.lnu.controller.data;

import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.Temperature;
import cn.lnu.service.TemperatureService;
import cn.lnu.util.Page;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author ccl
 * @Date 2019/4/27
 */
@Controller
@RequestMapping("data")
public class DataController {
    @Resource
    private TemperatureService temperatureService;

    @RequestMapping("temp")
    public ModelAndView getTemp(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        int totalCount = temperatureService.count();
        String pageNow = request.getParameter("pageNow");
        Page page = null;
        if(pageNow == null){
            page = new Page(totalCount,1);
        }else{
            page = new Page(totalCount,Integer.parseInt(pageNow));
        }
        List<Temperature> temps = temperatureService.selectTempByPage(
                page.getStartPos(),page.getPageSize());

        model.addObject("temps",temps);
        model.addObject("page",page);
        model.setViewName("/data/temp_stat");
        return model;
    }

    @RequestMapping("histotydata")
    public ModelAndView getHistoricalData(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String pageNow = request.getParameter("pageNow");
        int totalCount = temperatureService.historicalDataCount();
        Page page = null;
        if(pageNow == null){
            page = new Page(totalCount,1);
        }else{
            page = new Page(totalCount,Integer.parseInt(pageNow));
        }
        List<HistoricalData> historicalDatas = temperatureService.selectHistoricalDataByPage(
                       page.getStartPos(),page.getPageSize());
        model.addObject("historicalDatas",historicalDatas);
        model.addObject("page",page);
        model.setViewName("/data/historydata");
        return model;
    }

    @RequestMapping("getchart")
    public List<Temperature>  getChartData(HttpServletRequest request){
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        ArrayList<Temperature> temps = new ArrayList<>();
       return temps;
    }

    @RequestMapping("test")
    public ModelAndView getTest(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/test");
        return model;
    }


}
