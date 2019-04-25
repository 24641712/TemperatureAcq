import cn.lnu.dao.data.TbFacilityDao;
import cn.lnu.entity.TbFacility;
import cn.lnu.entity.TbUser;
import cn.lnu.service.TbFacilityService;
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

    @Resource
    private TbFacilityService tbFacilityService;

    @Test
    public void getFindAllTbUsers(){
        List<TbUser> tbUsers = userService.findAllTbUsers();
        for(TbUser tbUser:tbUsers){
            System.out.println(tbUser.toString());
        }
    }

    @Test
    public void getFindAllTbFacility(){
        List<TbFacility> facilities = tbFacilityService.findAllFacilities();
        for(TbFacility tbFacility:facilities){
            System.out.println(tbFacility.toString());
        }
    }








}
