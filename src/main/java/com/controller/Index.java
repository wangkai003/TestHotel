package com.controller;

import com.entity.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class Index {

    @RequestMapping("login")
    public String login(){

        return "/login";
    }

    @RequestMapping("")
    public String index(){

        return "redirect:/web/index";
    }
    @RequestMapping("welcome")
    public String welcome(){
        return "welcome";
    }


    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "/login";
    }

    @RequestMapping("/web/tologin")
    public String tologin(Model model,Integer type){
        model.addAttribute("type",type);
        return "/before/login";
    }


}
