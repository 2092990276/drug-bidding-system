package com.drug.bidding.service.impl;

import com.drug.bidding.dao.TenderDAO;
import com.drug.bidding.entity.Tender;
import com.drug.bidding.service.TenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TenderServiceImpl implements TenderService {
    
    @Autowired
    private TenderDAO tenderDAO;
    
    @Override
    public void createTender(Tender tender) {
        tenderDAO.insert(tender);
    }
    
    @Override
    public Tender findById(String tenderId) {
        return tenderDAO.findById(tenderId);
    }
    
    @Override
    public List<Tender> findAll() {
        return tenderDAO.findAll();
    }
    
    @Override
    public List<Tender> findByCondition(String drugName, String tenderId) {
        return tenderDAO.findByCondition(drugName, tenderId);
    }
    
    @Override
    public void updateTender(Tender tender) {
        tenderDAO.update(tender);
    }
    
    @Override
    public void deleteTender(String tenderId) {
        tenderDAO.delete(tenderId);
    }
}