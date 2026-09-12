package com.drug.bidding.controller;

import com.drug.bidding.entity.User;
import com.drug.bidding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class LoginController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping("login")
    public String login() {
        return "login";
    }
    
    @RequestMapping("doLogin")
    public ModelAndView doLogin(@RequestParam("username") String username, 
                               @RequestParam("password") String password, 
                               HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            if ("1".equals(user.getType())) {
                mv.setViewName("redirect:/bidder/index");
            } else if ("2".equals(user.getType())) {
                mv.setViewName("redirect:/tenderer/index");
            } else if ("3".equals(user.getType())) {
                mv.setViewName("redirect:/admin/index");
            }
        } else {
            mv.addObject("error", "用户名或密码错误");
            mv.setViewName("login");
        }
        return mv;
    }
    
    @RequestMapping("register")
    public String register() {
        return "register";
    }
    
    @RequestMapping("doRegister")
    public ModelAndView doRegister(User user) {
        ModelAndView mv = new ModelAndView();
        userService.register(user);
        mv.addObject("message", "注册成功，请登录");
        mv.setViewName("login");
        return mv;
    }
    
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}