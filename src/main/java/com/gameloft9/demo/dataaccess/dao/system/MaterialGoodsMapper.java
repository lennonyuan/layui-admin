package com.gameloft9.demo.dataaccess.dao.system;
import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;
import com.gameloft9.demo.dataaccess.model.system.MaterialSupplierBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/7
 * @time 14:21
 * MaterialGoods 的dao层
 */

public interface MaterialGoodsMapper {
    /*查询所有*/
    List<MaterialGoods> selectByAll();
    /*按照主键查询*/
    MaterialGoods selectMaterialGoodsByPrimaryKey(String id);
    /*增加*/
    int insertMaterialGoods(MaterialGoods MaterialGoods);
    /*修改*/
    int updateMaterialGoods(MaterialGoods MaterialGoods);
    /*删除*/
    int deleteMaterialGoods(String id);
    /*统计所有行数*/
    int dataCount();
    List<MaterialSupplierBean> selection();

    List<MaterialSupplierBean> selectAll(
            @Param("start") int start,
            @Param("end") int end,
            @Param("SupplierId") String supplierId,
            @Param("MaterialId") String materialId,
            @Param("goodsPrice") String goodsPrice
            );
}

