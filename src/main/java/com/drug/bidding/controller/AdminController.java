package com.drug.bidding.controller;

import com.drug.bidding.entity.Message;
import com.drug.bidding.entity.User;
import com.drug.bidding.service.MessageService;
import com.drug.bidding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private MessageService messageService;
    
    @RequestMapping("index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/index");
        return mv;
    }
    
    @RequestMapping("userList")
    public ModelAndView userList() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("users", userService.findAll());
        mv.setViewName("admin/userList");
        return mv;
    }
    
    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam("id") Integer id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", userService.findById(id));
        mv.setViewName("admin/editUser");
        return mv;
    }
    
    @RequestMapping("doEditUser")
    public ModelAndView doEditUser(User user) {
        ModelAndView mv = new ModelAndView();
        userService.update(user);
        mv.setViewName("redirect:/admin/userList");
        return mv;
    }
    
    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam("id") Integer id) {
        ModelAndView mv = new ModelAndView();
        userService.delete(id);
        mv.setViewName("redirect:/admin/userList");
        return mv;
    }
    
    @RequestMapping("messageList")
    public ModelAndView messageList() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("messages", messageService.findAll());
        mv.setViewName("admin/messageList");
        return mv;
    }
    
    @RequestMapping("deleteMessage")
    public ModelAndView deleteMessage(@RequestParam("id") Integer id) {
        ModelAndView mv = new ModelAndView();
        messageService.deleteMessage(id);
        mv.setViewName("redirect:/admin/messageList");
        return mv;
    }
}