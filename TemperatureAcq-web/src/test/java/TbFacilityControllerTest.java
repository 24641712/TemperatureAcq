import cn.lnu.entity.TbFacility;
import cn.lnu.service.TbFacilityService;
import cn.lnu.util.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * 控制层测试类
 * 测试设备数据表
 * @Author ccl
 * @Date 2019/4/27
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:config/applicationContext.xml",
        "classpath:config/spring-mvc.xml"})
public class TbFacilityControllerTest {

    @Resource
    private TbFacilityService tbFacilityService;

    @Test
    public void getSelectTbFacilityByPage(){
        String handler = "";
        int totalCount = tbFacilityService.count(handler);
        Page page = new Page(totalCount,1);
        List<TbFacility> tbFacilities = tbFacilityService.selectTbFacilityByPage(page.getStartPos(),page.getPageSize(),handler);
        for(TbFacility tbFacility:tbFacilities){
            System.out.println(tbFacility.toString());
        }
        System.out.println(totalCount);

    }

    @Test
    public void getSelectTbFacility(){
        List<TbFacility> handlers = tbFacilityService.selectHandlers();
        for(TbFacility tbFacility:handlers){
            System.out.println(tbFacility.getHandler()+","+tbFacility.getIp());
        }
    }



}
