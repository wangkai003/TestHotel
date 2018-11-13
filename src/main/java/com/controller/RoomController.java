package com.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import com.entity.Room;
import com.dao.RoomDao;
import com.service.RoomService;

@Controller
@RequestMapping(value="/room")
public class RoomController{
    
    @Autowired
    private RoomService roomService;
    
    @RequestMapping(value="/detail")
    public String detail(HttpServletRequest request, Integer id) {
    
        Room result = roomService.selectByPrimaryKey(id);
        request.setAttribute("result",result);
     
        return "";
    }
    
    
    @RequestMapping(value="/search")
    public String search(HttpServletRequest request, String name) {
    
        List<Room> list = roomService.search(name);
        request.setAttribute("list",list);
     
        return "/room_list";
    }
    
    @RequestMapping(value="/list")
    public String list(HttpServletRequest request) {
    
        List<Room> list = roomService.selectAll();
        request.setAttribute("list",list);
     
        return "/room_list";
    }

    @RequestMapping(value="save")
    public String save( Room room) {
        
     roomService.insertSelective(room);
     return  "redirect:/room/list";
    }
    
    @RequestMapping(value="update")
    public String update( Room room) {
        roomService.updateByPrimaryKeySelective(room);
        return  "redirect:/room/list";
    }
    
    @RequestMapping(value="delete")
    public String delete(Integer id) {
        
        roomService.deleteByPrimaryKey(id);
        
        return  "redirect:/room/list";
    }
    
    @RequestMapping(value="/add")
    public String add(HttpServletRequest request) {
        return "/room_add";
    }


    @RequestMapping(value="/edit")
    public String edit(HttpServletRequest request,Integer id) {
        Room room = roomService.selectByPrimaryKey(id);
        request.setAttribute("room",room);
        return "/room_add";
    }

    @RequestMapping(value="/refond")
    public String refond(HttpServletRequest request,Integer id) {

        Room room = new Room();
        room.setId(id);
        room.setStatus(0);
        roomService.updateByPrimaryKeySelective(room);
        return "redirect:/room/list";
    }
}