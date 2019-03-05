package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class Material {

    private String Id;
    private String GoodsName;
    private String GoodsType;
    private String GoodsDescribe;

    public Material(String id, String goodsName, String goodsType, String goodsDescribe) {
        Id = id;
        GoodsName = goodsName;
        GoodsType = goodsType;
        GoodsDescribe = goodsDescribe;
    }

    public Material() {
    }
}
