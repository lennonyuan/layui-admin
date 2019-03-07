package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.MaterialGoodsMapper;
import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;
import com.gameloft9.demo.service.api.system.MaterialGoodsService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/7
 * @time 14:54
 *
 *MaterialGoods服务层实现
 */
@Service
public class MaterialGoodsServiceImpl implements MaterialGoodsService {


    @Autowired
    MaterialGoodsMapper mapper;

    /*查找*/
    @Override
    public MaterialGoods selectMaterialGoodsByPrimaryKey(String Id) {
        return mapper.selectMaterialGoodsByPrimaryKey(Id);
    }

    /*增加*/
    @Override
    public String insertMaterialGoods(String SupplierId, String MaterialId, String GoodsPrice) {

        MaterialGoods materialGoods = new MaterialGoods(UUIDUtil.getUUID(), SupplierId, MaterialId, GoodsPrice);
        mapper.insertMaterialGoods(materialGoods);
         return  materialGoods.getId();
    }

    /*修改*/
    @Override
    public boolean updateMaterialGoods(String Id, String SupplierId, String MaterialId, String GoodsPrice) {
        int flag = mapper.updateMaterialGoods(new MaterialGoods(UUIDUtil.getUUID(), SupplierId, MaterialId, GoodsPrice));
        if (flag>0){return true;
        }else {
            return false;
        }
    }

    /*删除*/
    @Override
    public boolean deleteMaterialGoodsById(String Id) {
        int flag = mapper.deleteMaterialGoods(Id);
        if (flag>0){return true;
        }else {
            return false;
        }
    }

    /*查询总记录*/
    @Override
    public int dataCount() {
        return mapper.dataCount();
    }

    /*分页和模糊查询*/
    @Override
    public List<MaterialGoods> selectAllMaterialGoods(String page, String limit, String SupplierId, String MaterialId) {
        PageRange pageRange = new PageRange(page,limit);
        return mapper.selectAll(pageRange.getStart(),pageRange.getEnd(),SupplierId,MaterialId);
    }
}
