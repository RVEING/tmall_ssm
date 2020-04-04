package com.rveing.service.impl;

import com.rveing.mapper.PropertyMapper;
import com.rveing.pojo.Property;
import com.rveing.pojo.PropertyExample;
import com.rveing.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService {
    @Autowired
    PropertyMapper propertyMapper;

    @Override
    public void add(Property p) {
        propertyMapper.insertSelective(p);
    }

    @Override
    public void delete(int id) {
        propertyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Property p) {
        propertyMapper.updateByPrimaryKeySelective(p);
    }

    @Override
    public Property get(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List list(int cid) {
        PropertyExample example=new PropertyExample();
        example.createCriteria().andCategory_idEqualTo(cid);
        return propertyMapper.selectByExample(example);
    }
}
