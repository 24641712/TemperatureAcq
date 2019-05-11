package cn.lnu.controller.data;

import cn.lnu.entity.HistoricalData;
import cn.lnu.entity.TbFacility;
import cn.lnu.entity.Temperature;
import cn.lnu.service.TbFacilityService;
import cn.lnu.service.TemperatureService;
import cn.lnu.util.Page;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author ccl
 * @Date 2019/4/27
 */
@Controller
@RequestMapping("data")
public class DataController {
    @Resource
    private TemperatureService temperatureService;

    @Resource
    private TbFacilityService tbFacilityService;

    //按条件显示温度统计数据
    @RequestMapping("temp")
    public ModelAndView getTemp(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/temp_stat");
        return model;
    }

    @ResponseBody
    @RequestMapping("ajax_temp")
    public Map<String,Object> getAjax_Temp(HttpServletRequest request){
        String pageNow = request.getParameter("pageNow");
        String inpstart = request.getParameter("inpstart");
        String inpend = request.getParameter("inpend");
        String ip = request.getParameter("ip");
        System.out.println("pageNow:"+pageNow+", inpstart:"+inpstart+",inpend:"+inpend+",ip:"+ip);
        int totalCount = temperatureService.count(inpstart,inpend,ip);
        Page page = null;
        if(pageNow == null){
            page = new Page(totalCount,1);
        }else{
            page = new Page(totalCount,Integer.parseInt(pageNow));
        }
        List<Temperature> temps = temperatureService.selectTempByPage(
                page.getStartPos(),page.getPageSize(),inpstart,inpend,ip);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("temps",temps);
        map.put("page",page);
        map.put("str","罗纳尔多");
        return map;
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
        List<TbFacility> handlers = tbFacilityService.selectHandlers();
        model.addObject("handlers",handlers);
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
