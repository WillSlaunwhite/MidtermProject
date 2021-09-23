package com.skilldistillery.otd.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.otd.data.UserDao;

@Controller
public class HomeController {
	@Autowired
	private UserDao userDao;
	
	
	@RequestMapping(path = {"/", "home.do"} )
	public String home() { 
		return "home";
	}
	
	
	
}
