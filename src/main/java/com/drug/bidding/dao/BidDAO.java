package com.drug.bidding.dao;

import com.drug.bidding.entity.Bid;
import java.util.List;

public interface BidDAO {
    void insert(Bid bid);
    Bid findById(Integer id);
    List<Bid> findByTenderId(String tenderId);
    List<Bid> findAll();
    void update(Bid bid);
    void delete(Integer id);
}