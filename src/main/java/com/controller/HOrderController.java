package com.controller;
import com.entity.Room;
import com.entity.User;
import com.service.RoomService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import com.entity.HOrder;
import com.dao.HOrderDao;
import com.service.HOrderService;

@Controller
@RequestMapping(value="/hOrder")
public class HOrderController{
    
    @Autowired
    private HOrderService hOrderService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoomService roomService;
    
    @RequestMapping(value="/detail")
    public String detail(HttpServletRequest request, Integer id) {
    
        HOrder result = hOrderService.selectByPrimaryKey(id);
        request.setAttribute("result",result);
     
        return "";
    }
    
    
    @RequestMapping(value="/search")
    public String search(HttpServletRequest request, String name) {
    
        List<HOrder> list = hOrderService.search(name);
        request.setAttribute("list",list);
     
        return "";
    }
    
    @RequestMapping(value="/list")
    public String list(HttpServletRequest request) {

        List<HOrder> orderList = hOrderService.selectAll();
        if (orderList != null){
            for (int i = 0; i < orderList.size(); i++) {
                User user = userService.selectByPrimaryKey(orderList.get(i).getUserid());
                orderList.get(i).setUser(user);
                Room room = roomService.selectByPrimaryKey(orderList.get(i).getRoomid());
                orderList.get(i).setRoom(room);
            }
        }
        request.setAttribute("list",orderList);
        return "/orders_list";
    }

    @RequestMapping(value="save")
    public String save( HOrder hOrder) {
        
     hOrderService.insertSelective(hOrder);
     return  "redirect:/hOrder/list";
    }
    
    @RequestMapping(value="update")
    public String update( HOrder hOrder) {
        hOrderService.updateByPrimaryKeySelective(hOrder);
        return  "redirect:/hOrder/list";
    }
    
    @RequestMapping(value="delete")
    public String delete(Integer id) {
        
        hOrderService.deleteByPrimaryKey(id);
        
        return  "redirect:/hOrder/list";
    }
    
    @RequestMapping(value="/add")
    public String add(HttpServletRequest request) {
        return "/addhOrder";
    }
    
}