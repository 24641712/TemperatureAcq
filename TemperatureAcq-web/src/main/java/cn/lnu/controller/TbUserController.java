package cn.lnu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;

/**
 * 用户控制层
 * @Author ccl
 * @Date 2019/4/24
 */
@Controller
@RequestMapping("/user")
public class TbUserController {

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
        System.out.println("后台");
        return "redirect:/index.jsp";
    }




}
