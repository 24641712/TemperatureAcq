import cn.lnu.dao.data.TbFacilityDao;
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
        int totalCount = userService.count();
        int pageNow = 1;
        Page page = new Page(totalCount,pageNow);
        List<TbUser> tbUsers = userService.selectTbUserByPage(page.getStartPOs(),page.getPageSize());
        for(TbUser tbUser:tbUsers){
            System.out.println(tbUser.toString());
        }
        System.out.println("共"+page.getTotalPageCount()+"页");
        System.out.println("当前第"+page.getPageNow()+"页");
        if(page.isHasFirst()){
            System.out.println("首页");
        }else{
            System.out.println("无首页");
        }
        if(page.isHasPre()){
            System.out.println("上一页");
        }else{
            System.out.println("无上一页");
        }
        if(page.isHasNext()){
            System.out.println("下一页");
        }else{
            System.out.println("无下一页");
        }
        if(page.isHasLast()){
            System.out.println("尾页");
        }else{
            System.out.println("无尾页");
        }
    }








}
