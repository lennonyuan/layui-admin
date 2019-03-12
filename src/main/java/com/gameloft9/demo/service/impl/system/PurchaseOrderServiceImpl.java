package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.PurchaseOrderMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.PurchaseOrderService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/12 0012
 * @time 上午 11:23
 *
 *
 */
@Service
public class PurchaseOrderServiceImpl implements PurchaseOrderService {
    @Autowired
    PurchaseOrderMapper mapper;

    @Override
    public PurchaseOrder selectByPrimaryKey(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<PurchaseOrder> selectByAll() {
        return mapper.selectByAll();
    }

    @Override
    public boolean insert(PurchaseOrder purchaseOrder) {
        if (mapper.insert(purchaseOrder)>0){
            return true;
        }else{
            return false;
        }

    }

    @Override
    public boolean update(PurchaseOrder purchaseOrder) {
        String uuid = UUIDUtil.getUUID();
        PurchaseOrder pojo = mapper.selectByPrimaryKey(uuid);
        CheckUtil.check(pojo==null,"ID已存在");
        PurchaseOrder order = new PurchaseOrder();
        order.setId(uuid);
        order.setOrderNumber(purchaseOrder.getOrderNumber());
        order.setGoodsId(purchaseOrder.getGoodsId());
        order.setGoodsNumber(purchaseOrder.getGoodsNumber());
        order.setApplyUser(purchaseOrder.getApplyUser());
        order.setApplyTime(purchaseOrder.getApplyTime());
        order.setState(purchaseOrder.getState());
        order.setOrderAuditUser(purchaseOrder.getOrderAuditUser());
        order.setOrderAuditTime(purchaseOrder.getOrderAuditTime());
        order.setPayAuditUser(purchaseOrder.getPayAuditUser());
        order.setPayAuditTime(purchaseOrder.getPayAuditTime());
        order.setApplyDescribe(purchaseOrder.getApplyDescribe());
        order.setAuditDescribe(purchaseOrder.getAuditDescribe());

        if (mapper.update(order)>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        if (mapper.delete(id)>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public int dataCount() {
        return mapper.dataCount();
    }

    @Override
    public List<PurchaseOrder> selectAll(String page, String limit, String applyUser, String state) {
        PageRange pageRange= new PageRange(page,limit);
        return mapper.selectAll(pageRange.getStart(),pageRange.getEnd(),applyUser,state);

    }
}
