package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;

import java.util.List;


public interface PurchaseOrderService {

    public PurchaseOrder selectByPrimaryKey(String id);

    List<PurchaseOrder> selectByAll();

    boolean insert (PurchaseOrder purchaseOrder);

    boolean update(PurchaseOrder purchaseOrder);

    boolean delete (String id);

    int dataCount();

    /**
     *
     * @param page
     * @param limit
     * @param applyUser 申请人
     * @param state 订单状态
     * @return
     */
    List<PurchaseOrder> selectAll( String page,String limit ,String applyUser, String state
    );

}
