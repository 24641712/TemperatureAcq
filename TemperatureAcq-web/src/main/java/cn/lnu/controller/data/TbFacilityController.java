package cn.lnu.controller.data;

import cn.lnu.entity.TbFacility;
import cn.lnu.entity.insert_pojo.InsertTbFacility;
import cn.lnu.service.TbFacilityService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * @Author
 * @Date 2019/4/25
 */
@Controller
@RequestMapping("facility")
public class TbFacilityController {

    @Resource
    private TbFacilityService tbFacilityService;

    @RequestMapping(value = "addTbFacility",method = RequestMethod.POST)
    public void getAddTbUser(HttpServletResponse response, HttpServletRequest request)throws IOException {
        response.setContentType("text/html;charset=utf-8");
        InsertTbFacility insertTbFacility = new InsertTbFacility();
        String handler = request.getParameter("handler");
        String ip = request.getParameter("ip");
        String min_temp = request.getParameter("min_temp");
        String max_temp = request.getParameter("max_temp");
        String notify = request.getParameter("notify");
        insertTbFacility.setHandler(handler);
        insertTbFacility.setIp(ip);
        insertTbFacility.setMin_temp(Integer.parseInt(min_temp));
        insertTbFacility.setMax_temp(Integer.parseInt(max_temp));
        insertTbFacility.setNotify(notify);
        insertTbFacility.setInsertUpload(new Date());
        int result = tbFacilityService.insertTbFacility(insertTbFacility);
        System.out.println(insertTbFacility.toString());
        PrintWriter out = response.getWriter();
        if(result == 1){
            out.println("设备添加成功");
        }else{
            out.println("设备添加失败");
        }
        out.flush();
        out.close();



    }

    @RequestMapping("manage")
    public ModelAndView getDataManage(){
        ModelAndView model = new ModelAndView();
        model.setViewName("data/historydata");
        return model;
    }

    @RequestMapping("shouye")
    public ModelAndView getShouye(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/shouye");
        return model;
    }

    @RequestMapping("chart")
    public ModelAndView getChart(){
        ModelAndView model = new ModelAndView();
        List<TbFacility> tbFacilities = tbFacilityService.selectHandlers();
        model.addObject("handlers",tbFacilities);
        model.setViewName("/data/chart");
        return model;
    }

    @RequestMapping("calendar")
    public ModelAndView getCalendar(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/calendar");
        return model;
    }

    @RequestMapping("email")
    public ModelAndView getEmail(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/email");
        return model;
    }





}
