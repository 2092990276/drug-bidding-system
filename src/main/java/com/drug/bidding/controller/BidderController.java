package com.drug.bidding.controller;

import com.drug.bidding.entity.Bid;
import com.drug.bidding.entity.Message;
import com.drug.bidding.entity.Tender;
import com.drug.bidding.service.BidService;
import com.drug.bidding.service.MessageService;
import com.drug.bidding.service.TenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/bidder")
public class BidderController {
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(dateFormat, true));
    }
    
    @Autowired
    private TenderService tenderService;
    
    @Autowired
    private MessageService messageService;
    
    @Autowired
    private BidService bidService;
    
    @RequestMapping("index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tenders", tenderService.findAll());
        mv.setViewName("bidder/index");
        return mv;
    }
    
    @RequestMapping("viewTender")
    public ModelAndView viewTender(@RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tender", tenderService.findById(tenderId));
        mv.setViewName("bidder/viewTender");
        return mv;
    }
    
    @RequestMapping("message")
    public ModelAndView message() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("messages", messageService.findAll());
        mv.setViewName("bidder/message");
        return mv;
    }
    
    @RequestMapping("addMessage")
    public ModelAndView addMessage(Message message) {
        ModelAndView mv = new ModelAndView();
        message.setSendTime(new Date());
        message.setStatus("1");
        messageService.createMessage(message);
        mv.setViewName("redirect:/bidder/message");
        return mv;
    }
    
    @RequestMapping("bid")
    public ModelAndView bid(@RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        Tender tender = tenderService.findById(tenderId);
        if (tender == null) {
            mv.addObject("message", "招标信息不存在！");
            mv.setViewName("bidder/index");
            return mv;
        }
        if (!"1".equals(tender.getStatus())) {
            mv.addObject("message", "招标已结束，无法投标！");
            mv.setViewName("bidder/index");
            return mv;
        }
        mv.addObject("tender", tender);
        mv.setViewName("bidder/bid");
        return mv;
    }
    
    @RequestMapping("doBid")
    public ModelAndView doBid(Bid bid) {
        ModelAndView mv = new ModelAndView();
        // 检查招标是否存在且处于招标中状态
        Tender tender = tenderService.findById(bid.getTenderId());
        if (tender == null) {
            mv.addObject("message", "招标信息不存在！");
            mv.setViewName("bidder/index");
            return mv;
        }
        if (!"1".equals(tender.getStatus())) {
            mv.addObject("message", "招标已结束，无法投标！");
            mv.setViewName("bidder/index");
            return mv;
        }
        bid.setBidDate(new Date());
        bid.setStatus("1");
        bidService.createBid(bid);
        mv.addObject("message", "投标成功！");
        mv.setViewName("bidder/index");
        return mv;
    }
}