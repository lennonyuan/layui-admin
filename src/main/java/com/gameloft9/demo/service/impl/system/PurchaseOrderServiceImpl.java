package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.PurchaseOrderMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import com.gameloft9.demo.mgrframework.exceptions.CheckException;
import com.gameloft9.demo.mgrframework.handler.ExceptionHandler;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.PurchaseOrderService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;


/**
 * 功能描述
 *
 * @author Lennon_Yuan
 * @date 2019/3/12 0012
 * @time 上午 11:23
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
        PurchaseOrder order = new PurchaseOrder();
        String uuid = UUIDUtil.getUUID();
        PurchaseOrder order1 = mapper.selectByPrimaryKey(uuid);
        CheckUtil.check(order1 == null, "采购订单id已存在");
        Date date = new Date();
        order.setId(uuid);
        order.setOrderNumber(uuid);
        order.setGoodsId(purchaseOrder.getGoodsId());
        order.setGoodsNumber(purchaseOrder.getGoodsNumber());
        order.setApplyUser(purchaseOrder.getApplyUser());
        order.setApplyTime(date);
        order.setState("0");
        order.setOrderAuditUser(purchaseOrder.getOrderAuditUser());
        order.setOrderAuditTime(date);
        order.setPayAuditUser(purchaseOrder.getPayAuditUser());
        order.setPayAuditTime(date);
        order.setApplyDescribe(purchaseOrder.getApplyDescribe());
        order.setAuditDescribe(purchaseOrder.getAuditDescribe());
        if (mapper.insert(order) > 0) {
            return true;
        } else {
            return false;
        }

    }

    @Override
    public int completeData() {
        return mapper.completeData();
    }

    @Override
    public List<PurchaseOrder> compeleteOrder(String page, String limit, String applyUser, String orderAuditUser) {
        PageRange pageRange = new PageRange(page, limit);
        return mapper.completeOrder(pageRange.getStart(), pageRange.getEnd(), applyUser, orderAuditUser);
    }

    @Override
    public boolean update(PurchaseOrder purchaseOrder, String app) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date parse = null;
        try {
            parse = format.parse(app);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        PurchaseOrder order = new PurchaseOrder();
        order.setId(purchaseOrder.getId());
        order.setOrderNumber(purchaseOrder.getOrderNumber());
        order.setGoodsId(purchaseOrder.getGoodsId());
        order.setGoodsNumber(purchaseOrder.getGoodsNumber());
        order.setApplyUser(purchaseOrder.getApplyUser());
        //order.setApplyTime(purchaseOrder.getApplyTime());
        order.setApplyTime(parse);
        order.setState(purchaseOrder.getState());
        order.setOrderAuditUser(purchaseOrder.getOrderAuditUser());
        order.setOrderAuditTime(purchaseOrder.getOrderAuditTime());
        order.setPayAuditUser(purchaseOrder.getPayAuditUser());
        order.setPayAuditTime(purchaseOrder.getPayAuditTime());
        order.setApplyDescribe(purchaseOrder.getApplyDescribe());
        order.setAuditDescribe(purchaseOrder.getAuditDescribe());

        if (mapper.update(order) > 0) {
            return true;
        } else {
            return false;
        }
    }

    //工作流
    @Override
    public boolean stateForward(String id) {
        int i = -1;
        String s = null;
        PurchaseOrder purchaseOrder = mapper.selectByPrimaryKey(id);
        String state = purchaseOrder.getState();
        Integer state1 = Integer.parseInt(state);
        Subject subject = SecurityUtils.getSubject();
        ArrayList<String> list = new ArrayList<>();
        list.add("采购主管");
        for (String str : list) {
            if (!subject.hasRole(str)) {
                if (state1 >= 0 && state1 < 2) {
                    state1++;
                    String s1 = String.valueOf(state1);
                    i = mapper.updatestepback(s1, id);
                } else {
                    //TODO
                    throw new CheckException("没有足够权限完成操作");

                }
            } else {
                if (state1 >= 0 && state1 < 5) {
                    state1++;
                    String s1 = String.valueOf(state1);
                    i = mapper.updatestepback(s1, id);
                } else {
                    //todo
                    throw new CheckException("没有足够权限完成操作");


                }
            }


        }
        if (i > 0) {
            return true;
        }else{
            //todo
            throw new CheckException("没有足够权限完成操作");


        }
    }


    @Override
    public boolean delete(String id) {
        if (mapper.delete(id) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int dataCount() {
        return mapper.dataCount();
    }

    //修改状态
    @Override
    public boolean updatestepback(String id) {
        PurchaseOrder order = mapper.selectByPrimaryKey(id);
        String s = order.getState();
        Integer state1 = Integer.parseInt(s);
        Integer state2 = state1 - 1;
        String s1 = String.valueOf(state2);
        if (mapper.updatestepback(s1, id) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<PurchaseOrder> selectAll(String page, String limit, String applyUser, String state) {
        PageRange pageRange = new PageRange(page, limit);
        return mapper.selectAll(pageRange.getStart(), pageRange.getEnd(), applyUser, state);

    }
}
