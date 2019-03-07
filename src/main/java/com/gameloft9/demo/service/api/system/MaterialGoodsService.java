package com.gameloft9.demo.service.api.system;



import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;

import java.util.List;

public interface MaterialGoodsService {

    MaterialGoods selectMaterialGoodsByPrimaryKey(String Id);
    /*增加*/
    String insertMaterialGoods(String SupplierId,String MaterialId, String GoodsPrice);
    /*修改*/
    boolean updateMaterialGoods(String Id,String SupplierId,String MaterialId,String GoodsPrice);
    /*删除*/
    boolean deleteMaterialGoodsById(String Id);
    /*行数统计*/
    int dataCount();

    List<MaterialGoods> selectAllMaterialGoods(String page, String limit, String SupplierId , String MaterialId);


}
