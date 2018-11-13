package com.controller;

import com.entity.HOrder;
import com.entity.Result;
import com.entity.Room;
import com.entity.User;
import com.service.HOrderService;
import com.service.RoomService;
import com.service.UserService;
import com.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("/web")
@Controller
public class WebController {
    @Autowired
    private RoomService roomService;
    @Autowired
    private UserService userService;
    @Autowired
    private HOrderService hOrderService;
    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        List<Room> roomList = roomService.selectAll();
        request.setAttribute("roomList",roomList);
        return "/before/index";
    }

    @RequestMapping("book")
    @ResponseBody
    public Result bookRoom(Integer id){
        Room room = roomService.selectByPrimaryKey(id);
        if (room.getStatus() ==0){
            room.setStatus(1);
            roomService.updateByPrimaryKeySelective(room);
            return ResultUtil.success(null);
        }else {
            return ResultUtil.error("此房间已被预定！");
        }
    }

    @RequestMapping(value = "login")
    @ResponseBody
    public Result login(HttpServletRequest request,User user){
        User login = userService.login(user);
        if (login == null){
            return ResultUtil.error("账号或者密码错误");
        }else {
            request.getSession().setAttribute("user",login);
            return ResultUtil.success(user);
        }
    }

    @RequestMapping("reg")
    @ResponseBody
    public Result reg(User user){
        int i = userService.insertSelective(user);
        if (i == 0){
            return ResultUtil.error("注册失败");
        }else {
            return ResultUtil.success(user);
        }
    }

    @RequestMapping("orders")
    public String orders(HttpServletRequest request,Integer uid){
        List<HOrder> orderList = hOrderService.selectAllByUid(uid);
        if (orderList != null){
            for (int i = 0; i < orderList.size(); i++) {
                User user = userService.selectByPrimaryKey(orderList.get(i).getUserid());
                orderList.get(i).setUser(user);
                Room room = roomService.selectByPrimaryKey(orderList.get(i).getRoomid());
                orderList.get(i).setRoom(room);
            }
        }
        request.setAttribute("orderList",orderList);
        return "/before/orders";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "/before/index";
    }
}
