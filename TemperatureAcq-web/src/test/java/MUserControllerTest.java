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



}
