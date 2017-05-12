package com.iota.service;

import com.iota.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
