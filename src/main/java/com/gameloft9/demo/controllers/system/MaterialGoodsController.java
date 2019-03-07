package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.MaterialGoods;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.api.system.MaterialGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/materialgoods")
public class MaterialGoodsController {

    @Autowired
    MaterialGoodsService service;

    /*分页及模糊查询*/
    @RequestMapping(value = "/pagelist",method = RequestMethod.POST)
    public PageResultBean<List> pagelist(String page ,String limit , String SupplierId , String MaterialId ){
        return new PageResultBean<List>(service.selectAllMaterialGoods(page, limit, SupplierId, MaterialId),service.dataCount());
    }

    /*增加*/
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public  IResult add(MaterialGoods materialGoods){
        return new ResultBean<String>(service.insertMaterialGoods(materialGoods.getSupplierId(),materialGoods.getMaterialId(),materialGoods.getGoodsPrice()));
    }


    /*修改*/
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public IResult update(MaterialGoods materialGoods){
        return new ResultBean<Boolean>(service.updateMaterialGoods(materialGoods.getId(),materialGoods.getSupplierId(),materialGoods.getMaterialId(),materialGoods.getGoodsPrice()));
    }

    /*删除*/
    @RequestMapping("/delete")
    @ResponseBody
    public IResult delete(String Id){
        return new ResultBean<Boolean>(service.deleteMaterialGoodsById(Id));
    }

    /*按id查寻*/
    @RequestMapping(value = "/get" , method = RequestMethod.POST)
    @ResponseBody
    public IResult getbyID(String Id){
        return  new ResultBean<MaterialGoods>(service.selectMaterialGoodsByPrimaryKey(Id));
    }
}
