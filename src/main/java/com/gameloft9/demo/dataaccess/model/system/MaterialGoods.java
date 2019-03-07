package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class MaterialGoods {

    private String Id;
    private String SupplierId;
    private String MaterialId;
    private String GoodsPrice;

    public MaterialGoods(String id, String supplierId, String materialId, String goodsPrice) {
        Id = id;
        SupplierId = supplierId;
        MaterialId = materialId;
        GoodsPrice = goodsPrice;
    }

    public MaterialGoods() {
    }
}
