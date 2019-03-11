package com.gameloft9.demo.service.api.system;



import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;
import com.gameloft9.demo.dataaccess.model.system.MaterialSupplierBean;

import java.util.Collection;
import java.util.List;

public interface MaterialGoodsService {

    MaterialGoods selectMaterialGoodsByPrimaryKey(String id);
    /*增加*/
    String insertMaterialGoods(MaterialGoods materialGoods);
    /*修改*/
    boolean updateMaterialGoods(MaterialGoods materialGoods);
    /*删除*/
    boolean deleteMaterialGoodsById(String id);
    /*行数统计*/
    int dataCount();
    /*选择列表*/
    List<MaterialSupplierBean> selection();

    List<MaterialSupplierBean> selectAllMaterialGoods(String page, String limit, String supplierId , String materialId ,String goodsPice);


}
