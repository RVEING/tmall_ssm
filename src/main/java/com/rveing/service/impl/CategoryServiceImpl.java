package com.rveing.service.impl;

import com.rveing.mapper.CategoryMapper;
import com.rveing.pojo.Category;
import com.rveing.pojo.CategoryExample;
import com.rveing.pojo.Product;
import com.rveing.pojo.ProductImage;
import com.rveing.service.CategoryService;
import com.rveing.service.ProductImageService;
import com.rveing.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl  implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    ProductImageService productImageService;
    public List<Category> list(){
            CategoryExample example =new CategoryExample();
            example.setOrderByClause("id desc");
            return categoryMapper.selectByExample(example);
    }

    @Override
    public void add(Category category) {
        categoryMapper.insert(category);
    }

    @Override
    public void delete(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Category get(int id) {
            return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Category category) {
            categoryMapper.updateByPrimaryKeySelective(category);
    }

    @Override
    public void setFirstProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            p.setFirstProductImage(pi);
        }
    }

    public void setFirstProductImage(List<Product> ps) {
        for (Product p : ps) {
            setFirstProductImage(p);
        }
    }

}