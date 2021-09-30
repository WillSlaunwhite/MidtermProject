package com.skilldistillery.otd.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.otd.data.SearchDao;
import com.skilldistillery.otd.data.UserDao;
import com.skilldistillery.otd.entities.Activity;

@Controller
public class HomeController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private SearchDao searchDao;

	
	@RequestMapping(path = {"home.do"} )
	public String home(Model model) { 
		model.addAttribute("DEBUG", userDao.findByUsername("admin"));
		return "home";
	}
	
	@RequestMapping(path="getAllHiking.do", method=RequestMethod.GET)
	public String allHikes(Model model) {
		model.addAttribute("results", searchDao.findAllHiking());
		return "allHikes";
		
	}
	
	@RequestMapping(path="getAllBiking.do", method=RequestMethod.GET)
	public String allBiking(Model model) {
		model.addAttribute("results", searchDao.findAllBiking());
		return "allBiking";
		
	}
	
	@RequestMapping(path="getAllKayaking.do", method=RequestMethod.GET)
	public String allKayaking(Model model) {
		model.addAttribute("results", searchDao.findAllKayaking());
		return "allKayaking";
		
	}

	@RequestMapping(path="getAllRafting.do", method=RequestMethod.GET)
	public String allRafting(Model model) {
		model.addAttribute("results", searchDao.findAllRafting());
		return "allRafting";
		
	}

	@RequestMapping(path="getAllFishing.do", method=RequestMethod.GET)
	public String allFishing(Model model) {
		model.addAttribute("results", searchDao.findAllFishing());
		return "allFishing";
		
	}
	
	@RequestMapping(path="getActivity.do", method=RequestMethod.GET)
	public String getActivity(@RequestParam("id") int id, Model model) {
		model.addAttribute("activity", searchDao.findActivityById(id));
		return "activity";
	}
	
	@RequestMapping(path = "findActivityByKW.do")
	public String findActivityByKW(@RequestParam("search")String keywordSearch, Model model, HttpSession session) {
			List<Activity> activities = searchDao.findActivityByKeyword(keywordSearch);
			model.addAttribute("keywordSearch", activities);
			return "searchResults";
	}
		
}

