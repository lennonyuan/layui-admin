package com.gameloft9.demo.dataaccess.dao.system;
import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;
import org.apache.ibatis.annotations.Param;

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
    MaterialGoods selectMaterialGoodsByPrimaryKey(String Id);
    /*增加*/
    int insertMaterialGoods(MaterialGoods MaterialGoods);
    /*修改*/
    int updateMaterialGoods(MaterialGoods MaterialGoods);
    /*删除*/
    int deleteMaterialGoods(String Id);
    /*统计所有行数*/
    int dataCount();

    List<MaterialGoods> selectAll(
            @Param("start") int start,
            @Param("end") int end,
            @Param("SupplierId") String SupplierId,
            @Param("MaterialId") String MaterialId);
}

