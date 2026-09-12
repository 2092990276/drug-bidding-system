package com.drug.bidding.service;

import com.drug.bidding.entity.Message;
import java.util.List;

public interface MessageService {
    void createMessage(Message message);
    Message findById(Integer id);
    List<Message> findAll();
    void updateMessage(Message message);
    void deleteMessage(Integer id);
}