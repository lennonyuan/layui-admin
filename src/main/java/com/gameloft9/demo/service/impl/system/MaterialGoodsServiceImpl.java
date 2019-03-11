package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.MaterialGoodsMapper;
import com.gameloft9.demo.dataaccess.dao.system.MaterialMapper;
import com.gameloft9.demo.dataaccess.model.system.Material;
import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;
import com.gameloft9.demo.dataaccess.model.system.MaterialSupplierBean;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.MaterialGoodsService;
import com.gameloft9.demo.service.api.system.SupplierService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoaderListener;

import java.util.Collection;
import java.util.Collections;
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
    MaterialMapper materialMapper;

    @Autowired
    SupplierService supplierService;

    @Autowired
    MaterialGoodsMapper mapper;

    /*查找*/
    @Override
    public MaterialGoods selectMaterialGoodsByPrimaryKey(String id) {
        return mapper.selectMaterialGoodsByPrimaryKey(id);
    }

    /*增加*/
    @Override
    public String insertMaterialGoods(MaterialGoods materialGoods) {


        /*查重*/
        String uuid = UUIDUtil.getUUID();
        MaterialGoods goods = mapper.selectMaterialGoodsByPrimaryKey(uuid);
        CheckUtil.check(goods==null,"ID已存在");
        /* MaterialGoods materialGoods = new MaterialGoods(UUIDUtil.getUUID(), supplierId, materialId, goodsPrice);*/
        MaterialGoods materialGoods1 = new MaterialGoods();
        materialGoods1.setId(uuid);
        materialGoods1.setMaterialId(materialGoods.getMaterialId());
        materialGoods1.setSupplierId(materialGoods.getSupplierId());
        materialGoods1.setGoodsPrice(materialGoods.getGoodsPrice());
        mapper.insertMaterialGoods(materialGoods1);
        return  materialGoods1.getId();
    }

    /*修改*/
    @Override
    public boolean updateMaterialGoods(MaterialGoods materialGoods/*String id, String supplierId, String materialId, String goodsPrice*/) {
       int flag = mapper.updateMaterialGoods(materialGoods);
        if (flag>0){return true;
        }else {
            return false;
        }
    }

    /*删除*/
    @Override
    public boolean deleteMaterialGoodsById(String id) {
        int flag = mapper.deleteMaterialGoods(id);
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


    /*列表选择*/
    @Override
    public List<MaterialSupplierBean> selection() {
        return mapper.selection();
    }

    /*分页和模糊查询*/
    @Override
    public List<MaterialSupplierBean> selectAllMaterialGoods(String page, String limit, String supplierId, String materialId,String goodsPrice) {
        PageRange pageRange = new PageRange(page,limit);
        return mapper.selectAll(pageRange.getStart(),pageRange.getEnd(),supplierId,materialId,goodsPrice);
    }
}
