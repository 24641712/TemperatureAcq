package cn.lnu.controller.user;

import cn.lnu.entity.MUser;
import cn.lnu.service.MUserService;
import com.alibaba.fastjson.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * 管理员控制层
 * @Author
 * @Date 2019/5/3
 */
@Controller
@RequestMapping("m_user")
public class MUserController {
    @Resource
    private MUserService mUserService;

    @RequestMapping(value = "login",method = RequestMethod.POST)
    @ResponseBody
    public Map getLogin(String username,String password,HttpServletResponse response,
                         HttpServletRequest request) throws IOException {
      response.setContentType("text/html;charset=utf-8");
//      String username1 = request.getParameter("username");
//      String password = request.getParameter("passowrd");
      MUser mUser = new MUser();
      mUser.setUsername(username);
      mUser.setPassword(password);
      HttpSession session = request.getSession();
      MUser mUserResult = mUserService.selectByName(mUser);
      Map<String,Object> map = new HashMap<>();
      String message=null;
      if(mUserResult != null){
          session.setAttribute("username",username);
          System.out.println("用户登录成功");
          map.put("code",1);
      }else{
          System.out.println("该用户不存在");
          map.put("code",2);
      }
      return map;
    }

    @RequestMapping("index")
    public ModelAndView getLogin(){
        ModelAndView model = new ModelAndView();
        model.setViewName("/person/index");
        return model;
    }




}
