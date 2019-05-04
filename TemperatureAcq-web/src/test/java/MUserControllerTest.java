import cn.lnu.entity.MUser;
import cn.lnu.service.MUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author
 * @Date 2019/5/3
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:config/applicationContext.xml",
        "classpath:config/spring-mvc.xml"})
public class MUserControllerTest {
    @Resource
    private MUserService mUserService;

    @Test
    public void getFindALLMUser(){
        List<MUser> mUsers = mUserService.findAllMUser();
        for(MUser mUser:mUsers){
            System.out.println(mUser.toString());
        }
    }

    @Test
    public void getSelectByName(){
        MUser mUser = new MUser();
        mUser.setUsername("admin");
        mUser.setPassword("admin1234");
        MUser mUser1 = mUserService.selectByName(mUser);
        if(mUser1!=null){
            System.out.println("用户登录成功");
        }else{
            System.out.println("用户登录失败");
        }

    }



}
