package com.gameloft9.demo.dataaccess.dao.system;
import com.gameloft9.demo.dataaccess.model.system.Material;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/4
 * @time 21:56
 *
 *
 */

@Repository
public interface MaterialMapper {
    /*查询所有*/
    List<Material> selectByAll();
    /*按照主键查询*/
    Material selectByPrimaryKey(String Id);
    /*增加*/
    int insert(Material material);
    /*修改*/
    int update(Material material);
    /*删除*/
    int delete(String Id);
    /*统计所有行数*/
    int dataCount();

    List<Material> selectAll(
            @Param("start") int start,
            @Param("end") int end,
            @Param("GoodsName") String GoodsName,
            @Param("GoodsDescribe") String GoodsDescribe);
}
