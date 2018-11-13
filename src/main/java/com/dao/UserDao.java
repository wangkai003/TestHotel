package com.dao;

import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    User  selectByPrimaryKey(Integer id);

    int insertSelective(User record);
    
    int deleteByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(User record);
    
    List<User > selectAll();

    User  login(User user);

    int selectCount();

    List<User > search(String name);

}