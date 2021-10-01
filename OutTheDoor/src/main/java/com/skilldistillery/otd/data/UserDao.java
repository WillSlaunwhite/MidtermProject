package com.skilldistillery.otd.data;

import com.skilldistillery.otd.entities.User;

public interface UserDao {
	User findByUsername(String username);
	User createUser(String username, String password);
}
