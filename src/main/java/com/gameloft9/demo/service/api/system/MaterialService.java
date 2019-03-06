package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.Material;


import java.util.List;

public interface MaterialService {
    /*查询所有*/
    List<Material> selectByAll();
    /*按照主键查询*/
    Material selectByPrimaryKey(String Id);
    /*增加*/
    String insert(String GoodsName,String GoodsType, String GoodsDescribe);
    /*修改*/
    boolean update(String Id,String GoodsName,String GoodsType,String GoodsDescribe);
    /*删除*/
    boolean delete(String Id);
    /*行数统计*/
    int dataCount();

    List<Material> selectAll(String page, String limit,String GoodsName ,String GoodsDescribe);
}
