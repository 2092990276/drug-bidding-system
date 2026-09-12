package com.drug.bidding.controller;

import com.drug.bidding.entity.Message;
import com.drug.bidding.entity.Tender;
import com.drug.bidding.entity.Bid;
import com.drug.bidding.service.MessageService;
import com.drug.bidding.service.TenderService;
import com.drug.bidding.service.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/tenderer")
public class TendererController {
    
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
        mv.setViewName("tenderer/index");
        return mv;
    }
    
    @RequestMapping("search")
    public ModelAndView search(@RequestParam(value = "drugName", required = false) String drugName, 
                              @RequestParam(value = "tenderId", required = false) String tenderId) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tenders", tenderService.findByCondition(drugName, tenderId));
        mv.setViewName("tenderer/index");
        return mv;
    }
    
    @RequestMapping("addTender")
    public String addTender() {
        return "tenderer/addTender";
    }
    
    @RequestMapping("doAddTender")
    public ModelAndView doAddTender(Tender tender) {
        ModelAndView mv = new ModelAndView();
        tender.setTenderId(UUID.randomUUID().toString().substring(0, 8));
        tender.setCreateTime(new Date());
        tender.setStatus("1");
        tenderService.createTender(tender);
        mv.setViewName("redirect:/tenderer/index");
        return mv;
    }
    
    @RequestMapping("editTender")
    public ModelAndView editTender(@RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tender", tenderService.findById(tenderId));
        mv.setViewName("tenderer/editTender");
        return mv;
    }
    
    @RequestMapping("doEditTender")
    public ModelAndView doEditTender(Tender tender) {
        ModelAndView mv = new ModelAndView();
        tenderService.updateTender(tender);
        mv.setViewName("redirect:/tenderer/index");
        return mv;
    }
    
    @RequestMapping("deleteTender")
    public ModelAndView deleteTender(@RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        tenderService.deleteTender(tenderId);
        mv.setViewName("redirect:/tenderer/index");
        return mv;
    }
    
    @RequestMapping("viewBids")
    public ModelAndView viewBids(@RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tender", tenderService.findById(tenderId));
        mv.addObject("bids", bidService.findByTenderId(tenderId));
        mv.setViewName("tenderer/viewBids");
        return mv;
    }
    
    @RequestMapping("selectWinner")
    public ModelAndView selectWinner(@RequestParam("bidId") Integer bidId, @RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        // 先更新所有投标为未中标
        List<Bid> bids = bidService.findByTenderId(tenderId);
        for (Bid bid : bids) {
            bid.setStatus("0");
            bidService.updateBid(bid);
        }
        // 更新选中的投标为中标
        Bid winner = bidService.findById(bidId);
        winner.setStatus("2"); // 2表示中标
        bidService.updateBid(winner);
        // 结束招标
        Tender tender = tenderService.findById(tenderId);
        tender.setStatus("0"); // 0表示已结束
        tenderService.updateTender(tender);
        mv.addObject("message", "中标单位已确定，招标已结束！");
        mv.setViewName("redirect:/tenderer/index");
        return mv;
    }
    
    @RequestMapping("endTender")
    public ModelAndView endTender(@RequestParam("tenderId") String tenderId) {
        ModelAndView mv = new ModelAndView();
        Tender tender = tenderService.findById(tenderId);
        tender.setStatus("0"); // 0表示已结束
        tenderService.updateTender(tender);
        mv.addObject("message", "招标已结束！");
        mv.setViewName("redirect:/tenderer/index");
        return mv;
    }
    
    @RequestMapping("message")
    public ModelAndView message() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("messages", messageService.findAll());
        mv.setViewName("tenderer/message");
        return mv;
    }
    
    @RequestMapping("addMessage")
    public ModelAndView addMessage(Message message) {
        ModelAndView mv = new ModelAndView();
        message.setSendTime(new Date());
        message.setStatus("1");
        messageService.createMessage(message);
        mv.setViewName("redirect:/tenderer/message");
        return mv;
    }
}