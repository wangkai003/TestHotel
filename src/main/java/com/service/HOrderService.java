package com.service;
import com.entity.HOrder;
import com.dao.HOrderDao;
import com.service.HOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class HOrderService {
    @Autowired
    private HOrderDao hOrderDao;

    public HOrder selectByPrimaryKey(Integer id) {
        HOrder result = hOrderDao.selectByPrimaryKey(id);
        return result;
    }
    public int insertSelective(HOrder record) {
         return hOrderDao.insertSelective(record);
    }

    public int deleteByPrimaryKey(Integer id) {
        return hOrderDao.deleteByPrimaryKey(id);
    }
  
    public int updateByPrimaryKeySelective(HOrder record) {
        return hOrderDao.updateByPrimaryKeySelective(record);
    }
    
    public List<HOrder> selectAll(){
        return hOrderDao.selectAll();
    }
    public List<HOrder> selectAllByUid(Integer uid){
        return hOrderDao.selectAllByUid(uid);
    }

    public List<HOrder> search(String name){
        name = "%" + name + "%"; 
        return hOrderDao.search(name);
    }
    
    public int selectCount(){
         return hOrderDao.selectCount();
    }
}