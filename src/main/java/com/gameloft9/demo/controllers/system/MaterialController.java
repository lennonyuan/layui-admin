package com.gameloft9.demo.controllers.system;

import com.gameloft9.demo.dataaccess.model.system.Material;
import com.gameloft9.demo.mgrframework.beans.response.IResult;
import com.gameloft9.demo.mgrframework.beans.response.PageResultBean;
import com.gameloft9.demo.mgrframework.beans.response.ResultBean;
import com.gameloft9.demo.service.beans.system.PageRange;
import com.gameloft9.demo.service.impl.system.MaterialServiceImpl;
import com.gameloft9.demo.utils.UUIDUtil;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 *功能描述
 * @author Lennon_Yuan
 * @date 2019/3/4
 * @time 23:04
 *
 *t_material表的控制层实现
 */
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/material")
public class MaterialController {

    @Autowired
    MaterialServiceImpl materialServiceImpl;

    /*查询所有Material表*/
    @RequestMapping("/list")
    @ResponseBody
    public String listAll(){
        List<Material> materials = materialServiceImpl.selectByAll();
        return  new ResultBean<List>(materials).toString();
    }

    /*按照id查询*/
    @RequestMapping("/list/{id}")
    @ResponseBody
    public String listById(@PathVariable String id){
        Material material = materialServiceImpl.selectByPrimaryKey(id);
        return new ResultBean(material).toString();
    }

    /*删除*/
    @RequestMapping("/delete")
    @ResponseBody
    public IResult deleteById(String materId){
        return new ResultBean<Boolean>(materialServiceImpl.delete(materId));
    }

    /*增加*/
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public IResult add(String GoodsName,String GoodsType,String GoodsDescribe){
        return new ResultBean<Integer>(materialServiceImpl.update(new Material(UUIDUtil.getUUID(),GoodsName,GoodsType,GoodsDescribe)));
    }
    /*修改*/

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public String update(Material material){
        //TODO
        int i = materialServiceImpl.update(material);
        if(i>0){
            return  new ResultBean("200","成功").toString();
        }else{
            return  new ResultBean("500","失败").toString();
        }
    }
    /**
     * 获取所有材料列表
     * @param page 页序
     * @param limit 分页大小
     * */
    @RequestMapping(value = "/pagelist",method = RequestMethod.POST)
    @ResponseBody
    public IResult listPage(String page, String limit,String GoodsName,String GoodsDescribe){

        return new PageResultBean<List>(materialServiceImpl.selectAll(page,limit,GoodsName,GoodsDescribe),materialServiceImpl.dataCount());
    }

}
