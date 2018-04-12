package com.iota.service;

import java.util.List;

import com.iota.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);

    List<User> getAllUsers();

	User getById(Long id);

	void update(User userForm);
}
