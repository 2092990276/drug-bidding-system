package com.drug.bidding.service;

import com.drug.bidding.entity.Tender;
import java.util.List;

public interface TenderService {
    void createTender(Tender tender);
    Tender findById(String tenderId);
    List<Tender> findAll();
    List<Tender> findByCondition(String drugName, String tenderId);
    void updateTender(Tender tender);
    void deleteTender(String tenderId);
}