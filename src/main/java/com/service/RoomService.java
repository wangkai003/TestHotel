package com.service;
import com.entity.Room;
import com.dao.RoomDao;
import com.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RoomService {
    @Autowired
    private RoomDao roomDao;

    public Room selectByPrimaryKey(Integer id) {
        Room result = roomDao.selectByPrimaryKey(id);
        return result;
    }
    public int insertSelective(Room record) {
         return roomDao.insertSelective(record);
    }

    public int deleteByPrimaryKey(Integer id) {
        return roomDao.deleteByPrimaryKey(id);
    }
  
    public int updateByPrimaryKeySelective(Room record) {
        return roomDao.updateByPrimaryKeySelective(record);
    }
    
    public List<Room> selectAll(){
        return roomDao.selectAll();
    }
    
    public List<Room> search(String name){
        name = "%" + name + "%"; 
        return roomDao.search(name);
    }
    
    public int selectCount(){
         return roomDao.selectCount();
    }
}