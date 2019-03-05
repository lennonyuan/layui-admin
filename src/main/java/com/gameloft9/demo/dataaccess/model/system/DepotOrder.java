package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class DepotOrder {
    private String Id;
    private String OrderType;
    private String GoodsId;
    private String GoodsNumber;
    private String ApplyUser;
    private String ApplyTime;
    private String State;
    private String OrderAuditUser;
    private String OrderAuditTime;
    private String ApplyDescribe;
    private String AuditDescribe;

}
