package com.drug.bidding.dao;

import com.drug.bidding.entity.Tender;
import java.util.List;

public interface TenderDAO {
    void insert(Tender tender);
    Tender findById(String tenderId);
    List<Tender> findAll();
    List<Tender> findByCondition(String drugName, String tenderId);
    void update(Tender tender);
    void delete(String tenderId);
}