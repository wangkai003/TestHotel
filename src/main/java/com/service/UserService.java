package com.service;
import com.dao.UserDao;
import com.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public User selectByPrimaryKey(Integer id) {
        User result = userDao.selectByPrimaryKey(id);
        return result;
    }
    public int insertSelective(User record) {
         return userDao.insertSelective(record);
    }

    public int deleteByPrimaryKey(Integer id) {
        return userDao.deleteByPrimaryKey(id);
    }
  
    public int updateByPrimaryKeySelective(User record) {
        return userDao.updateByPrimaryKeySelective(record);
    }
    
    public List<User> selectAll(){
        return userDao.selectAll();
    }
    
    public int selectCount(){
         return userDao.selectCount();
    }

    public User login(User user){
        User login = userDao.login(user);
        return login;
    }

    public List<User> search(String name){
        name = "%" + name + "%";
        List<User> search = userDao.search(name);
        return search;
    }
}