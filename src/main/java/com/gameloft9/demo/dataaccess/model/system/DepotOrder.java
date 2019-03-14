package com.gameloft9.demo.dataaccess.model.system;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class DepotOrder {
    private String id;
    private String orderType;
    private String goodsId;
    private String goodsNumber;
    private String applyUser;
    @JsonFormat(timezone="GMT+8", pattern = "yyyy-MM-dd")
    private Date applyTime;
    private String state;
    private String orderAuditUser;
    @JsonFormat(timezone="GMT+8", pattern = "yyyy-MM-dd")
    private Date orderAuditTime;
    private String applyDescribe;
    private String auditDescribe;

}
