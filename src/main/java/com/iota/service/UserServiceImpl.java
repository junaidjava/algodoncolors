package com.iota.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.iota.enums.RoleName;
import com.iota.model.User;
import com.iota.repository.RoleRepository;
import com.iota.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.getRoles().add(roleRepository.getByName(RoleName.ROLE_USER.getValue()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public User getById(Long id) {
		return userRepository.findOne(id);
	}

	@Override
	public void update(User userForm) {
		User dbUser=userRepository.findByUsername(userForm.getUsername());
		dbUser.setActive(userForm.getActive());
		dbUser.setEmail(userForm.getEmail());
		dbUser.setFirstName(userForm.getFirstName());
		dbUser.setLastName(userForm.getLastName());
		userRepository.save(dbUser);
	}

	@Override
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
}
