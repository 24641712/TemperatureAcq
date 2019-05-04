package cn.lnu.controller.user;

import cn.lnu.entity.TbFacility;
import cn.lnu.entity.TbUser;
import cn.lnu.service.TbFacilityService;
import cn.lnu.service.UserService;
import cn.lnu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
        String yhm = request.getParameter("yhm");
        String email = request.getParameter("email");
        System.out.println(yhm+" "+email);
        PrintWriter out = response.getWriter();
        out.println("用户添加成功");
        out.flush();
        out.close();
    }

    @RequestMapping("/TbUsers")
    public ModelAndView getAddTbUsers(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String pageNow = request.getParameter("pageNow");
        int totalcount = userService.count();
        Page page = null;
        if(pageNow!=null){
            page = new Page(totalcount,Integer.parseInt(pageNow));
            List<TbUser> tbUsers = userService.selectTbUserByPage(
                    page.getStartPos(),page.getPageSize());
        }else{
            page = new Page(totalcount,1);
            List<TbUser> tbUsers = userService.selectTbUserByPage(
                    page.getStartPos(),page.getPageSize());
        }


        List<TbUser> tbUsers = userService.selectTbUserByPage(
                page.getStartPos(),page.getPageSize());
        model.addObject("tbUsers",tbUsers);
        model.addObject("page",page);
        model.setViewName("/person/TbUsers");
        return model;
    }

    @RequestMapping("/Facilities")
    public ModelAndView getFacilities(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String pageNow = request.getParameter("pageNow");
        int totalCount = tbFacilityService.count();
        Page page = null;
        List<TbFacility> tbFacilities = null;
        if(pageNow==null){
            page = new Page(totalCount,1);
        }else{
            page = new Page(totalCount,Integer.parseInt(pageNow));
        }
        tbFacilities = tbFacilityService.selectTbFacilityByPage(page.getStartPos(),page.getPageSize());
        model.addObject("tbFacilities",tbFacilities);
        model.addObject("page",page);
        model.setViewName("/person/facilities");
        return model;
    }






}
