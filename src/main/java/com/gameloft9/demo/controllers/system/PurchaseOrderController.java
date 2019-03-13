package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.PurchaseOrder;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.impl.system.PurchaseOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/12 0012
 * @time 上午 11:26
 * purchaseOrder 控制层
 *
 */
@Controller
@RequestMapping("/po")
public class PurchaseOrderController {

    @Autowired
    PurchaseOrderServiceImpl service;

    @RequestMapping("/selectall")
    @ResponseBody
    public IResult selectall() {
        return new ResultBean<List>(service.selectByAll());
    }

    @RequestMapping("/pagelist")
    @ResponseBody
    public IResult pagelist(String page, String limit, String applyUser, String state) {
        return new PageResultBean<List>(service.selectAll(page, limit, applyUser, state), service.dataCount());
    }

    @RequestMapping("/list")
    @ResponseBody
    public IResult getById(String id) {
        return new ResultBean<PurchaseOrder>(service.selectByPrimaryKey(id));
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public IResult addition(PurchaseOrder purchaseOrder) {
        boolean insert = service.insert(purchaseOrder);
        if (insert) {
            return new ResultBean<String>(purchaseOrder.getId());
        } else {
            return new ResultBean<>(null, "插入失败");
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public IResult update(PurchaseOrder purchaseOrder) {

        return new ResultBean<Boolean>(service.update(purchaseOrder));
    }

    @RequestMapping("/delete")
    @ResponseBody
    public IResult delete(String id) {
        return new ResultBean<Boolean>(service.delete(id));
    }


    @RequestMapping("/updatestate")
    @ResponseBody
    public IResult stepback(String id) {
        return new ResultBean<Boolean>(service.updatestepback(id));
    }

    @RequestMapping("/updatestateforward")
    @ResponseBody
    public IResult stateForward(String id) {
        return new ResultBean<Boolean>(service.stateForward(id));
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

    }

}