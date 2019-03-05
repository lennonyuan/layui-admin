package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class DepotInventoryCheckDetail {
    private String Id;
    private String CheckId;
    private String Type;
    private String GoodsId;
    private String GoodsNumber;
    private String AuditUser;

}
