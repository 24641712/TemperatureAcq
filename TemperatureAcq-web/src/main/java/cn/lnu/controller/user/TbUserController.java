package cn.lnu.controller.user;

import cn.lnu.entity.TbUser;
import cn.lnu.service.UserService;
import cn.lnu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.jws.WebParam;
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

    @RequestMapping("/logout")
    public ModelAndView getLogout(){
        ModelAndView model =  new ModelAndView();
        model.setViewName("/person/login");
        return model;
    }

    @RequestMapping("/login")
    public String getLogin(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/index");
        return "redirect:/index.jsp";
    }

    @RequestMapping("/TbUsers")
    public ModelAndView getAddTbUsers(){
        ModelAndView model = new ModelAndView();
        int pageNow = 1;
        int totalcount = userService.count();
        Page page = new Page(totalcount,pageNow);
        List<TbUser> tbUsers = userService.selectTbUserByPage(
                page.getStartPOs(),page.getPageSize());
        model.addObject("tbUsers",tbUsers);
        model.addObject("page",page);
        model.setViewName("/person/TbUsers");
        return model;
    }

    @RequestMapping("/Facilities")
    public ModelAndView getFacilities(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/person/facilities");
        return model;
    }






}
