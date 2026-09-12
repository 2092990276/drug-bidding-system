package com.drug.bidding.service;

import com.drug.bidding.entity.User;
import java.util.List;

public interface UserService {
    User login(String username, String password);
    void register(User user);
    User findById(Integer id);
    void update(User user);
    void delete(Integer id);
    List<User> findAll();
}