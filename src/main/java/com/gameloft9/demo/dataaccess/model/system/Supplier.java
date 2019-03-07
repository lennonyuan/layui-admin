package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class Supplier {

    private String Id;
    private String SupplierName;
    private String SupplierDescribe;
    private String Phone;

    public Supplier(String id, String supplierName, String supplierDescribe, String phone) {

        Id = id;
        SupplierName = supplierName;
        SupplierDescribe = supplierDescribe;
        Phone = phone;
    }

    public Supplier() {
    }
}
