package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.PurchaseOrderMapper;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import com.gameloft9.demo.mgrframework.exceptions.CheckException;
import com.gameloft9.demo.mgrframework.utils.CheckUtil;
import com.gameloft9.demo.service.api.system.PurchaseOrderService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


 /**
  * @Author: Lennon_Yuan
  * @return:
  * @param null 
  * @Description:
  */
@SuppressWarnings({"ALL", "AlibabaClassMustHaveAuthor"})
@Service
public class PurchaseOrderServiceImpl implements PurchaseOrderService {
    @Autowired
    PurchaseOrderMapper mapper;

    @Override
     /**
      * @author: Lennon_Yuan
      * @Param: [id]
      * @Return: com.gameloft9.demo.dataaccess.model.system.PurchaseOrder
      * @Description:
      */
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
      /**
       * @author: Lennon_Yuan
       * @Param: [id]
       * @Return: boolean
       * @Description: 操作下一步的方法
       */
    public boolean stateForward(String id) {
        int i = -1;
        String s = null;
        PurchaseOrder purchaseOrder = mapper.selectByPrimaryKey(id);
        String state = purchaseOrder.getState();
        //获取实体的state状态进行判断权限
        Integer state1 = Integer.parseInt(state);
        //获取shiro中存储用户信息
        Subject subject = SecurityUtils.getSubject();
        if (subject.hasRole("采购员") ){
            if (state1>=0 && state1<2||state1==5){
                state1++;
                String s1 = String.valueOf(state1);
                mapper.updatestepback(s1,id);
                return true;
            }else{
                throw new CheckException("没有足够权限完成操作");
            }
        }else if (subject.hasRole("采购主管")){
                if (state1>=0 && state1<3||state1==5){
                    state1++;
                    String s1 = String.valueOf(state1);
                    mapper.updatestepback(s1,id);
                    return true;
                }else{
                    throw new CheckException("没有足够权限完成操作");
                }
        }else  if (subject.hasRole("仓库主管")){
            if (state1>=6 && state1<8){
                state1++;
                String s1 = String.valueOf(state1);
                mapper.updatestepback(s1,id);
                return true;
            }else{
                throw new CheckException("没有足够权限完成操作");
            }
        }else if (subject.hasRole("财务主管")){
            if (state1>=3 && state1<5){
                state1++;
                String s1 = String.valueOf(state1);
                mapper.updatestepback(s1,id);
                return true;
            }else{
                throw new CheckException("没有足够权限完成操作");
            }
        }else{
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
         /**
          * @Author: Lennon_Yuan
          * @return: java.util.List<com.gameloft9.demo.dataaccess.model.system.PurchaseOrder>
          * @param page 
          * @param limit 
          * @param applyUser
          * @param state 
          * @Description: 带分页的模糊查询
          */
    public List<PurchaseOrder> selectAll(String page, String limit, String applyUser, String state) {
        PageRange pageRange = new PageRange(page, limit);
        return mapper.selectAll(pageRange.getStart(), pageRange.getEnd(), applyUser, state);

    }
}
