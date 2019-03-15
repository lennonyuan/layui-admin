package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.DepotOrderMapper;
import com.gameloft9.demo.dataaccess.model.system.DepotOrder;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import com.gameloft9.demo.service.api.system.DepotOrderService;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author: Lenon_Yuan
 * @time: 2019/3/15 0015-下午 4:00
 * @description:
 */

public class DepotOrderServiceImpl implements DepotOrderService {

    @Autowired
    DepotOrderMapper mapper;

    @Override
    public PurchaseOrder selectByPrimaryKey(String id) {
        return null;
    }

    @Override
     /**
      * @Author: Lennon_Yuan
      * @return: java.util.List<com.gameloft9.demo.dataaccess.model.system.PurchaseOrder>
      * @param
      * @Description: 无条件查询所有
      */
    public List<PurchaseOrder> selectByAll()
    {
        return mapper.selectByAll();
    }

    @Override
     /**
      * @Author: Lennon_Yuan
      * @return: boolean
      * @param depotOrder 实体
      * @Description: 增加新纪录
      */
    public boolean insert(DepotOrder depotOrder) {
        return false;
    }

    @Override
    public boolean update(DepotOrder depotOrder, String app) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public int dataCount() {
        return 0;
    }

    @Override
    public boolean updatestepback(String id) {
        return false;
    }

    @Override
    public boolean stateForward(String id) {
        return false;
    }

    @Override
    public List<PurchaseOrder> selectAll(String page, String limit, String applyUser, String state) {
        return null;
    }

    @Override
    public int completeData() {
        return 0;
    }
}
