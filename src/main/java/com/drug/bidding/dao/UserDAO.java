package com.drug.bidding.dao;

import com.drug.bidding.entity.User;
import java.util.List;

public interface UserDAO {
    User findByUsername(String username);
    void insert(User user);
    User findById(Integer id);
    void update(User user);
    void delete(Integer id);
    List<User> findAll();
}