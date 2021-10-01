package com.skilldistillery.otd.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.otd.data.UserDao;
import com.skilldistillery.otd.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(path={"/", "login.do"})
	public String login() {
		return "login";
	}
	
	@RequestMapping(path="createUserWebpage.do")
	public String createUserWebpage() {
		return "createUser";
	}
	
	@RequestMapping(path="createNewUser.do", method=RequestMethod.GET)
	public String createNewUser(String username, String password, Model model) {
		User user = userDao.createUser(username, password);
		model.addAttribute("user", user);
		return "newUser";
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
