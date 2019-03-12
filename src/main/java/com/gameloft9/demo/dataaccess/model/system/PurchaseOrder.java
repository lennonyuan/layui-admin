package com.gameloft9.demo.dataaccess.model.system;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.util.Date;

/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/12 0012
 * @time 下午 7:27
 *
 *
 */
@Data
public class PurchaseOrder {
    private String id;
    private String orderNumber;
    private String goodsId;
    /*原料ID*/

    private String goodsNumber;
    private String applyUser;
    @JsonFormat(timezone="GMT+8", pattern = "yyyy-MM-dd hh:mm:ss")
    private Date applyTime;
    /*申请时间*/

    private String state;
    private String orderAuditUser;
    @JsonFormat(timezone="GMT+8", pattern = "yyyy-MM-dd hh:mm:ss")
    private Date orderAuditTime;
    /*订单审核时间*/

    private String payAuditUser;

    @JsonFormat(timezone="GMT+8", pattern = "yyyy-MM-dd hh:mm:ss")
    private Date payAuditTime;
    /*支付审核时间*/

    private String applyDescribe;

    private String auditDescribe;

}
