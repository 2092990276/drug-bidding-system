package com.drug.bidding.dao;

import com.drug.bidding.entity.Message;
import java.util.List;

public interface MessageDAO {
    void insert(Message message);
    Message findById(Integer id);
    List<Message> findAll();
    void update(Message message);
    void delete(Integer id);
}