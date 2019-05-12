package cn.lnu.controller.user;

import cn.lnu.entity.insert_pojo.InsertTbUser;
import cn.lnu.entity.TbFacility;
import cn.lnu.entity.TbUser;
import cn.lnu.service.TbFacilityService;
import cn.lnu.service.UserService;
import cn.lnu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户控制层
 * @Author ccl
 * @Date 2019/4/24
 */
@Controller
@RequestMapping("/user")
public class TbUserController {

    @Resource
    private UserService userService;

    @Resource
    private TbFacilityService tbFacilityService;

    @RequestMapping("/logout")
    public ModelAndView getLogout(){
        ModelAndView model =  new ModelAndView();
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "addTbUser",method = RequestMethod.POST)
    public void getAddTbUser(HttpServletResponse response, HttpServletRequest request)throws IOException {
        response.setContentType("text/html;charset=utf-8");
        InsertTbUser insertTbUser = new InsertTbUser();
        String yhm = request.getParameter("yhm");
        String email = request.getParameter("email");
        insertTbUser.setUsername(yhm);
        insertTbUser.setEmail(email);
        insertTbUser.setInsertCreated(new Date());
        System.out.println(yhm+" "+email);
        int result = userService.addTbUser(insertTbUser);
        PrintWriter out = response.getWriter();
        if(result == 1){
            out.println("用户添加成功");
        }else{
            out.println("用户添加失败");
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/TbUsers")
    public ModelAndView getAddTbUsers(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        model.setViewName("/person/TbUsers");
        return model;
    }

    @ResponseBody
    @RequestMapping("ajax_tbUser")
    public Map<String,Object> getAjax_TbUser(HttpServletRequest request){
        String yhm = request.getParameter("yhm");
        String pageNow = request.getParameter("pageNow");
        int totalcount = userService.count(yhm);
        System.out.println("yhm:"+yhm+", pageNow:"+pageNow);
        Page page = null;
        if(pageNow!=null && Integer.parseInt(pageNow)!=0){
            page = new Page(totalcount,Integer.parseInt(pageNow));
        }else{
            page = new Page(totalcount,1);
        }
        System.out.println("pageNow");
        List<TbUser> tbUsers = userService.selectTbUserByPage(
                page.getStartPos(),page.getPageSize(),yhm);
        for(TbUser tbUser:tbUsers){
            System.out.println(tbUser.toString());
        }

        Map<String,Object> map = new HashMap<>();
        map.put("tbUsers",tbUsers);
        map.put("page",page);
        return map;
    }

    @RequestMapping("/Facilities")
    public ModelAndView getFacilities(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String pageNow = request.getParameter("pageNow");
        int totalCount = tbFacilityService.count("");
        Page page = null;
        List<TbFacility> tbFacilities = null;
        if(pageNow==null){
            page = new Page(totalCount,1);
        }else{
            page = new Page(totalCount,Integer.parseInt(pageNow));
        }
        tbFacilities = tbFacilityService.selectTbFacilityByPage(page.getStartPos(),page.getPageSize(),"");
        model.addObject("tbFacilities",tbFacilities);
        model.addObject("page",page);
        model.setViewName("person/tbfacilities");
        return model;
    }

    @ResponseBody
    @RequestMapping("ajax_tbFacility")
    public Map<String,Object> getAjax_TbFacility(HttpServletRequest request){
        String handler = request.getParameter("handler");
        String pageNow = request.getParameter("pageNow");
        int totalCount = tbFacilityService.count(handler);
        System.out.println("pageNow:"+pageNow);
        Page page = null;
        List<TbFacility> tbFacilities = null;
        if(pageNow==null || Integer.parseInt(pageNow)==0){
            page = new Page(totalCount,1);
        }else{
            page = new Page(totalCount,Integer.parseInt(pageNow));
        }
        tbFacilities = tbFacilityService.selectTbFacilityByPage(page.getStartPos(),page.getPageSize(),handler);
        Map<String,Object> map = new HashMap<>();
        map.put("tbFacilities",tbFacilities);
        map.put("page",page);
        return map;
    }






}
