import cn.lnu.entity.TbUser;
import cn.lnu.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author
 * @Date 2019/4/23
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:config/applicationContext.xml",
        "classpath:config/spring-mvc.xml"})
public class UserControllerTest {
    @Resource
    private UserService userService;

    @Test
    public void getFindAllTbUsers(){
        List<TbUser> tbUsers = userService.findAllTbUsers();
        for(TbUser tbUser:tbUsers){
            System.out.println(tbUser.toString());
        }
    }







}
