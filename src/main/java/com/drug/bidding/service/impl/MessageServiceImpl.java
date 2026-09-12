package com.drug.bidding.service.impl;

import com.drug.bidding.dao.MessageDAO;
import com.drug.bidding.entity.Message;
import com.drug.bidding.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    
    @Autowired
    private MessageDAO messageDAO;
    
    @Override
    public void createMessage(Message message) {
        messageDAO.insert(message);
    }
    
    @Override
    public Message findById(Integer id) {
        return messageDAO.findById(id);
    }
    
    @Override
    public List<Message> findAll() {
        return messageDAO.findAll();
    }
    
    @Override
    public void updateMessage(Message message) {
        messageDAO.update(message);
    }
    
    @Override
    public void deleteMessage(Integer id) {
        messageDAO.delete(id);
    }
}