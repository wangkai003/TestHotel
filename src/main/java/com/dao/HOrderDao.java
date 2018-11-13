package com.dao;

import com.entity.HOrder;

import java.util.List;

public interface HOrderDao {

    HOrder selectByPrimaryKey(Integer id);

    int insertSelective(HOrder record);
    
    int deleteByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(HOrder record);
    
    List<HOrder > selectAll();
    List<HOrder > selectAllByUid(Integer uid);

    List<HOrder > search(String name);
    
    int selectCount();
    
}