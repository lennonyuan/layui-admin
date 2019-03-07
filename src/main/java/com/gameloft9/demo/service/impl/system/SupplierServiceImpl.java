package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.SupplierMapper;
import com.gameloft9.demo.dataaccess.model.system.Supplier;
import com.gameloft9.demo.service.api.system.SupplierService;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/7
 * @time 14:11
 * Supplier服务层实现类
 *
 */
@Service
public class SupplierServiceImpl implements SupplierService {


    @Autowired
    SupplierMapper supplierMapper;


    @Override
    public Supplier selectSupplierByPrimaryKey(String Id) {
        return supplierMapper.selectSupplierByPrimaryKey(Id);
    }
    /*返回实体类的ID字段*/
    @Override
    public String insertSupplier(/*String SupplierName, String SupplierDescribe, String Phone*/Supplier supplier) {
        supplier.setId(UUIDUtil.getUUID());
        supplierMapper.insertSupplier(supplier);
        return supplier.getId();

    }

    @Override
    public boolean updateSupplier(String Id, String SupplierName, String SupplierDescribe, String Phone) {

        int i = supplierMapper.updateSupplier(new Supplier(Id, SupplierName, SupplierDescribe, Phone));
         if (i>0){
             return true;
         }else{
             return false;
         }


    }

    @Override
    public boolean deleteSupplierById(String Id) {
        if(supplierMapper.deleteSupplierById(Id)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public int dataCount() {
        return supplierMapper.dataCount();
    }

    @Override
    public List<Supplier> selectAllSupplier(String page, String limit, String SupplierName, String SupplierDescribe , String Phone) {
        PageRange pageRange = new PageRange(page, limit);

        List<Supplier> suppliers = supplierMapper.selectAllSupplier(pageRange.getStart(), pageRange.getEnd(),
                SupplierName, SupplierDescribe, Phone);
        return suppliers;
    }
}
