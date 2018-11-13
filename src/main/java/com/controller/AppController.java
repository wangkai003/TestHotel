package com.controller;

import com.entity.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.HOrderService;
import com.service.RoomService;
import com.service.UserService;
import com.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("app")
@ResponseBody
public class AppController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private HOrderService hOrderService;

    @RequestMapping("login")
    public Result login(User user){
        User login = userService.login(user);
        if (login == null){
            return ResultUtil.error("登陆失败");
        }else {
            return ResultUtil.success(login);
        }
    }

    @RequestMapping("reg")
    public Result reg(User user){
        int i = userService.insertSelective(user);
        if (i == 0){
            return ResultUtil.error("注册失败");
        }else {
            return ResultUtil.success(user);
        }
    }

    /**
     *@描述 预定房间
     *@返回值
     *@创建人  陈纬
     *@创建时间  2018/10/7
     */
    @ResponseBody
    @RequestMapping("/room/book")
    public Result book(Integer id,Integer uid){
        Room room = roomService.selectByPrimaryKey(id);
        if (room.getStatus() ==0){
            room.setStatus(1);
            roomService.updateByPrimaryKeySelective(room);
            HOrder hOrder = new HOrder();
            hOrder.setUserid(uid);
            hOrder.setRoomid(id);
            hOrder.setDay(1);
            hOrder.setTime(new Date());
            hOrderService.insertSelective(hOrder);
            return ResultUtil.success(null);
        }else {
            return ResultUtil.error("此房间已被预定！");
        }
    }

    /**
     *@描述 查询所有房间列表
     *@返回值
     *@创建人  陈纬
     *@创建时间  2018/10/7
     */
    @RequestMapping("/room/list")
    @ResponseBody
    public Result roomList(@RequestParam(required =true,defaultValue = "1")Integer pageNum,@RequestParam(required =true,defaultValue = "10")Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<Room> roomList = roomService.selectAll();
        PageInfo<Room> list = new PageInfo<Room>(roomList);
        return ResultUtil.success(list.getList());
    }

    /**
     *@描述 查看订单
     *@返回值
     *@创建人  陈纬
     *@创建时间  2018/10/7
     */

    @ResponseBody
    @RequestMapping("/order/list")
    public Result orderList(Integer uid){
        List<HOrder> orderList = hOrderService.selectAllByUid(uid);
        if (orderList != null){
            for (int i = 0; i < orderList.size(); i++) {
                User user = userService.selectByPrimaryKey(orderList.get(i).getUserid());
                orderList.get(i).setUser(user);
                Room room = roomService.selectByPrimaryKey(orderList.get(i).getRoomid());
                orderList.get(i).setRoom(room);
            }
        }
        return ResultUtil.success(orderList);
    }

    @RequestMapping("/room/detail")
    @ResponseBody
    public Result roomDetail(Integer id){
        Room room = roomService.selectByPrimaryKey(id);
        return  ResultUtil.success(room);
    }
}
