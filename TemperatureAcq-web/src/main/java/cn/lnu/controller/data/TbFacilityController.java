package cn.lnu.controller.data;

import cn.lnu.service.TbFacilityService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.jws.WebParam;

/**
 * @Author
 * @Date 2019/4/25
 */
@Controller
@RequestMapping("facility")
public class TbFacilityController {

    @Resource
    private TbFacilityService tbFacilityService;

    @RequestMapping("stat")
    public ModelAndView getTbFacility(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/temp_stat");
        return model;
    }

    @RequestMapping("manage")
    public ModelAndView getDataManage(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/data/datamanage");
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
