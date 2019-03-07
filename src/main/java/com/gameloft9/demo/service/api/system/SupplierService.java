package com.gameloft9.demo.service.api.system;


import com.gameloft9.demo.dataaccess.model.system.Supplier;

import java.util.List;

public interface SupplierService {


    /*按照主键查询*/
    Supplier selectSupplierByPrimaryKey(String Id);
    /*增加*/
    String insertSupplier(/*String SupplierName,String SupplierDescribe, String Phone*/Supplier supplier);
    /*修改*/
    boolean updateSupplier(String Id,String SupplierName,String SupplierDescribe,String GoodsDescribe);
    /*删除*/
    boolean deleteSupplierById(String Id);
    /*行数统计*/
    int dataCount();

    List<Supplier> selectAllSupplier(String page, String limit,String SupplierName ,String GoodsDescribe, String Phone);
}
