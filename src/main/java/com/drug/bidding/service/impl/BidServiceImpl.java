package com.drug.bidding.service.impl;

import com.drug.bidding.dao.BidDAO;
import com.drug.bidding.entity.Bid;
import com.drug.bidding.service.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BidServiceImpl implements BidService {
    
    @Autowired
    private BidDAO bidDAO;
    
    @Override
    public void createBid(Bid bid) {
        bidDAO.insert(bid);
    }
    
    @Override
    public Bid findById(Integer id) {
        return bidDAO.findById(id);
    }
    
    @Override
    public List<Bid> findByTenderId(String tenderId) {
        return bidDAO.findByTenderId(tenderId);
    }
    
    @Override
    public List<Bid> findAll() {
        return bidDAO.findAll();
    }
    
    @Override
    public void updateBid(Bid bid) {
        bidDAO.update(bid);
    }
    
    @Override
    public void deleteBid(Integer id) {
        bidDAO.delete(id);
    }
}