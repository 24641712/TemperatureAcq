package cn.lnu.controller.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户登录拦截器
 * @Author ccl
 * @Date 2019/5/3
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    private List<String> excludeUrls;

    public void setExcludeUrls(List<String> excludeUrls) {
        this.excludeUrls = excludeUrls;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        String requestUri = request.getRequestURI();
        for(String url : excludeUrls){
            if(requestUri.endsWith(url)){
                return  true;
            }
        }
        HttpSession session =request.getSession();
        System.out.println(session.getLastAccessedTime());

        if(session.getAttribute("username") == null){
            System.out.println("用户状态：未登录");
            throw new WebAuthException();
        }else {
            System.out.println("用户状态：已登录");
            return true;
        }
    }


}
