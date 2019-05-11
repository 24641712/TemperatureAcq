package cn.lnu.serviceimpl;

import cn.lnu.dao.data.TbFacilityDao;
import cn.lnu.entity.TbFacility;
import cn.lnu.entity.insert_pojo.InsertTbFacility;
import cn.lnu.service.TbFacilityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author
 * @Date 2019/4/25
 */
@Service("tbFacilityService")
public class TbFacilitiesImpl implements TbFacilityService {

    @Resource
    private TbFacilityDao tbFacilityDao;

    public List<TbFacility> findAllFacilities() {
        return tbFacilityDao.findAllTbFacilities();
    }

    public int count() {
        return tbFacilityDao.count();
    }

    public List<TbFacility> selectTbFacilityByPage(int startPos,int pageSize) {
        return tbFacilityDao.selectTbFacilityByPage(startPos,pageSize);
    }

    public List<TbFacility> selectHandlers() {
        return tbFacilityDao.selectHandlers();
    }

    public int insertTbFacility(InsertTbFacility insertTbFacility) {
        return tbFacilityDao.insertTbFacility(insertTbFacility);
    }


}
