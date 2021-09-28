package com.skilldistillery.otd.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.otd.data.SearchDao;
import com.skilldistillery.otd.data.UserDao;
import com.skilldistillery.otd.entities.Activity;

@Controller
public class HomeController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private SearchDao searchDao;

	
	@RequestMapping(path = {"/", "home.do"} )
	public String home(Model model) { 
		model.addAttribute("DEBUG", userDao.findByUsername("admin"));
		return "home";
	}
//	@RequestMapping(path="getAllHiking.do", method=RequestMethod.GET)
//	public String allHikes(Model model) {
//		model.addAttribute("results", searchDao.findAllHikes());
//		return "allHikes";
		
		
//	}
	@RequestMapping(path = "getAllHiking.do")
	public String findActivity(Model model) {
		model.addAttribute("activity", searchDao.findActivityByCategory());
		return "test";
	}
	
	
	
}
