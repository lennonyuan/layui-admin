package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class MaterialGoods {

    private String id;
    private String supplierId;
    private String materialId;
    private String goodsPrice;

    /*public MaterialGoods(String id, String supplierId, String materialId, String goodsPrice) {
        this.id = id;
        this.supplierId = supplierId;
        this.materialId = materialId;
        this.goodsPrice = goodsPrice;
    }

    public MaterialGoods() {
    }*/
}
