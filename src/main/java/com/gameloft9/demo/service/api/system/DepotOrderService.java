package com.gameloft9.demo.service.api.system;

import com.gameloft9.demo.dataaccess.model.system.DepotOrder;
import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepotOrderService {
    /**
     *
     * @param id
     * @return
     */
    PurchaseOrder selectByPrimaryKey(String id);

    List<PurchaseOrder> selectByAll();

    boolean insert(DepotOrder depotOrder);


    boolean update(DepotOrder depotOrder, String app);

    boolean delete(String id);

    int dataCount();

    /**
     *
     * @param id
     * @return
     */
    boolean updatestepback(String id);

    /**
     *
     * @param id
     * @return
     */
    boolean stateForward(String id);

    /**
     *
     * @param page
     * @param limit
     * @param applyUser
     * @param state
     * @return
     */
    List<PurchaseOrder> selectAll(String page, String limit, String applyUser, String state
    );

    /**
     *
     * @return
     */
    int completeData();

}
