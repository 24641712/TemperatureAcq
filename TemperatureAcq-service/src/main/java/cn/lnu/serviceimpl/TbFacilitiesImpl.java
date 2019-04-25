package cn.lnu.serviceimpl;

import cn.lnu.dao.data.TbFacilityDao;
import cn.lnu.entity.TbFacility;
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
}
