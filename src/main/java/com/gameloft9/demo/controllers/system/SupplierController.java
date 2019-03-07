package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.Supplier;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.impl.system.SupplierServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/7
 * @time 11:46
 *
 * @param Id
 * @param SupplierName
 * @param SupplierDescribe
 * @param Phone
 *
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @Autowired
    SupplierServiceImpl service;

//  分页查询
  @RequestMapping("/pagelist")
  @ResponseBody
  public IResult pagelist(String page,String limit, String SupplierName,String SupplierDescribe,String Phone){
        return new PageResultBean(service.selectAllSupplier(page,limit,SupplierName,SupplierDescribe,Phone),service.dataCount());
  }
//  按关键字查询
    @RequestMapping("/list")
    @ResponseBody
    public IResult listbyId(String Id){
    return  new ResultBean<Supplier>(service.selectSupplierByPrimaryKey(Id));
    }

    /*修改*/
    @RequestMapping("/update")
    @ResponseBody
    public IResult Update(Supplier supplier){
        boolean flag = service.updateSupplier(supplier.getId(), supplier.getSupplierName(), supplier.getSupplierDescribe(), supplier.getPhone());
        return new ResultBean<Boolean>(flag);
    }
    /*删除*/
    @RequestMapping("/delete")
    @ResponseBody
    public IResult delete(String Id){
        boolean flag = service.deleteSupplierById(Id);
        return new ResultBean<Boolean>(flag);
    }
    /*增加*/
    @RequestMapping("/add")
    @ResponseBody
    public  IResult addition(Supplier supplier){
        String supplier1 = service.insertSupplier(supplier/*supplier.getSupplierName(), supplier.getSupplierDescribe(), supplier.getPhone()*/);
        return  new ResultBean<String>(supplier1);
    }
}
