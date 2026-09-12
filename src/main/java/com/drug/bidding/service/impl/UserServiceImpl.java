package com.drug.bidding.service.impl;

import com.drug.bidding.dao.UserDAO;
import com.drug.bidding.entity.User;
import com.drug.bidding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserDAO userDAO;
    
    @Override
    public User login(String username, String password) {
        User user = userDAO.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
    
    @Override
    public void register(User user) {
        userDAO.insert(user);
    }
    
    @Override
    public User findById(Integer id) {
        return userDAO.findById(id);
    }
    
    @Override
    public void update(User user) {
        userDAO.update(user);
    }
    
    @Override
    public void delete(Integer id) {
        userDAO.delete(id);
    }
    
    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }
}