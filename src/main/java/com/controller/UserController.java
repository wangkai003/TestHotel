package com.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import com.entity.User;
import com.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController{
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(value="/detail")
    public String detail(HttpServletRequest request, Integer id) {
    
        User result = userService.selectByPrimaryKey(id);
        request.setAttribute("result",result);
     
        return "";
    }
    
    @RequestMapping(value="/list")
    public String list(HttpServletRequest request) {
    
        List<User> list = userService.selectAll();
        request.setAttribute("list",list);
     
        return "/user_list";
    }

    @RequestMapping(value="save")
    public String save( User user) {
        Integer id = user.getId();
        if (id == null){
            userService.insertSelective(user);
        }else {
            userService.updateByPrimaryKeySelective(user);
        }
        return "redirect:/user/list";
    }
    
    @RequestMapping(value="update")
    @ResponseBody
    public int update( User user) {
        
        return userService.updateByPrimaryKeySelective(user);
    }
    
    @RequestMapping(value="delete")
    @ResponseBody
    public int delete( Integer id) {
        
        return userService.deleteByPrimaryKey(id);
    }

    @RequestMapping(value="del")
    public String del( Integer id) {

         userService.deleteByPrimaryKey(id);
        return "redirect:/user/list";
    }
    
    @RequestMapping(value="/add")
    public String add(HttpServletRequest request) {
        return "/user_add";
    }

    @RequestMapping(value = "login")
    public String login(User user){
        User login = userService.login(user);
        if (login == null || login.getType()==0){
            return "/login";
        }else {
            return "/index";
        }

    }

    @RequestMapping("edit")
    public String edit(Model model,Integer id){
        User user = userService.selectByPrimaryKey(id);
        model.addAttribute("user",user);
        return "user_edit";
    }

    @RequestMapping("search")
    public String edit(Model model,String name){
        List<User> list = userService.search(name);
        model.addAttribute("list",list);
        return "/user_list";
    }
}