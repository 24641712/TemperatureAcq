import cn.lnu.entity.insert_pojo.InsertTbUser;
import cn.lnu.entity.TbFacility;
import cn.lnu.entity.TbUser;
import cn.lnu.service.TbFacilityService;
import cn.lnu.service.UserService;
import cn.lnu.util.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @Test
    public void getCount(){
        int pageNow = 1;
        String yhm = "用户9";
        int totalCount = userService.count(yhm);
        System.out.println("totalCount:"+totalCount);
        Page page = new Page(totalCount,pageNow);
        List<TbUser> tbUsers = userService.selectTbUserByPage(page.getStartPos(),page.getPageSize(),yhm);
        for(TbUser tbUser:tbUsers){
            System.out.println(tbUser.toString());
        }
    }

    @Test
    public void getAddTbUser() throws ParseException {
        InsertTbUser tbUser = new InsertTbUser();
//        tbUser.setUid(51L);
        tbUser.setUsername("yonghu54");
        tbUser.setEmail("username54@qorvo.com");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String strDate = "2019-04-24 12:13:14";
        tbUser.setCreated(df.parse(strDate));
        tbUser.setInsertCreated(new Date());
//        int result = userService.addTbUser(tbUser);
        System.out.println(tbUser.toString());
        System.out.println(df.format(new Date()));
//        System.out.println(result);

    }


}
