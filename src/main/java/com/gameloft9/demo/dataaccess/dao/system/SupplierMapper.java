package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.Material;
import com.gameloft9.demo.dataaccess.model.system.Supplier;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/7
 * @time 10:06
 *
 *供应商查询接口
 */
@Repository
public interface SupplierMapper {
    /*查询所有*/
    List<Supplier> selectByAll();
    /*按照主键查询*/
    Supplier selectSupplierByPrimaryKey(String Id);
    /*增加*/
    int insertSupplier(Supplier supplier);
    /*修改*/
    int updateSupplier(Supplier supplier);
    /*删除*/
    int deleteSupplierById(String Id);
    /*统计所有行数*/
    int dataCount();

    List<Supplier> selectAllSupplier(
            @Param("start") int start,
            @Param("end") int end,
            @Param("SupplierName") String SupplierName,
            @Param("SupplierDescribe") String SupplierDescribe,
            @Param("Phone") String Phone);


}
