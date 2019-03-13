package com.gameloft9.demo.dataaccess.dao.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PurchaseOrderMapper {

    /**
     *
     * @param id
     * @return
     */
    PurchaseOrder selectByPrimaryKey(String id);


    List<PurchaseOrder> selectByAll();

    int insert (PurchaseOrder purchaseOrder);

    int update(PurchaseOrder purchaseOrder);

    int delete (String id);

    int dataCount();

    int updatestepback(@Param("state") String state,@Param("id") String id);

    /**
     *
     * @param start
     * @param end
     * @param applyUser 申请人
     * @param state 订单状态
     * @return
     */
    List<PurchaseOrder> selectAll( @Param("start") int start,
                                   @Param("end") int end,
                                   @Param("applyUser") String applyUser,
                                   @Param("state") String state
    );

}
