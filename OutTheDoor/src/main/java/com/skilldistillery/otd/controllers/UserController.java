package com.skilldistillery.otd.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.otd.data.UserDao;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(path={"/", "login.do"})
	public String login() {
		return "login";
	}
	
	@RequestMapping(path="createUser.do")
	public String createUser() {
		return "createUser";
	}
	
	@RequestMapping(path="signIn.do")
	public String signIn(Model model, String username, String password) {
		if(userDao.findByUsername(username)!=null && userDao.findByUsername(username).getPassword().equals(password)) {
			return "home";
		} else {
			return "error";
		}
		
	}
}
