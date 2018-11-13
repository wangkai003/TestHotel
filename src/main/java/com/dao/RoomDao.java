package com.dao;

import com.entity.Room;

import java.util.List;

public interface RoomDao {

    Room selectByPrimaryKey(Integer id);

    int insertSelective(Room record);
    
    int deleteByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(Room record);
    
    List<Room > selectAll();
    
    List<Room > search(String name);
    
    int selectCount();
    
}