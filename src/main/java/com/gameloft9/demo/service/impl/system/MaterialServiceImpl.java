package com.gameloft9.demo.service.impl.system;

import com.gameloft9.demo.dataaccess.dao.system.MaterialMapper;
import com.gameloft9.demo.dataaccess.model.system.Material;
import com.gameloft9.demo.service.api.system.MaterialService;
import com.gameloft9.demo.service.beans.system.PageRange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 *功能描述
 * @author Lennon
 * @date 2019/3/4
 * @time 19:44
 *
 * Material的service层的实现
 */
@Service
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    MaterialMapper materialMapper;

    @Override
    public List<Material> selectByAll() {
        return materialMapper.selectByAll();
    }

    @Override
    public Material selectByPrimaryKey(String Id) {
        return materialMapper.selectByPrimaryKey(Id);
    }

    @Override
    public int insert(Material material) {
        return materialMapper.insert(material);
    }

    @Override
    public int update(Material material) {
        return materialMapper.update(material);
    }

    @Override
    public boolean delete(String Id) {
        if(materialMapper.delete(Id)>0){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public int dataCount() {
        return materialMapper.dataCount();
    }

    @Override
    public List<Material> selectAll(String page, String limit, String GoodsName, String GoodsDescribe) {
        PageRange pageRange = new PageRange(page,limit);
        return materialMapper.selectAll(pageRange.getStart(),pageRange.getEnd(),GoodsName,GoodsDescribe);
    }
}
