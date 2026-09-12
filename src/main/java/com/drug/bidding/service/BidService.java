package com.drug.bidding.service;

import com.drug.bidding.entity.Bid;
import java.util.List;

public interface BidService {
    void createBid(Bid bid);
    Bid findById(Integer id);
    List<Bid> findByTenderId(String tenderId);
    List<Bid> findAll();
    void updateBid(Bid bid);
    void deleteBid(Integer id);
}