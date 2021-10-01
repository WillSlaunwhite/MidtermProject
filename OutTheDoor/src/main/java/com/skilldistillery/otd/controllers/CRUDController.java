package com.skilldistillery.otd.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.otd.data.CRUDDao;
import com.skilldistillery.otd.data.SearchDao;
import com.skilldistillery.otd.entities.Activity;
import com.skilldistillery.otd.entities.Location;

@Controller
public class CRUDController {
	@Autowired
	private CRUDDao crudDao;
	@Autowired
	private SearchDao searchDao;
	
	@RequestMapping(path ="getUpdate.do", method= RequestMethod.GET)
		public String populateUpdateForm(@RequestParam("id") int id, Model model) {
			model.addAttribute("activity", searchDao.findActivityById(id));
			return "updateForm";
	}
	
	
	@RequestMapping(path="update.do", method=RequestMethod.POST)
	public ModelAndView updateActivity(Activity activity) { 
		ModelAndView mv = new ModelAndView();
		mv.addObject("activity", activity);
		crudDao.updateActivity(activity, activity.getId());
		mv.setViewName("activity");
		return mv;
	}
	@RequestMapping(path="getAdd.do",method=RequestMethod.GET)
	public String createNewActivity(HttpSession session) {
		return "newLocation";
	}
	@RequestMapping(path="addLocation.do")
	public ModelAndView addLocation(Location location,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Location t = crudDao.addLocation(location);
		mv.addObject("location", t);
		session.setAttribute("location", t);
		mv.setViewName("newActivity");
		return mv;
	}
	
	@RequestMapping(path="getDelete.do")
	public ModelAndView deleteActivity(Integer id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("delete");
		return mv;
	}
	
	@RequestMapping(path="addActivity.do")
	public ModelAndView addActivity(Activity activity,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Location t = (Location) session.getAttribute("location");
		crudDao.addActivity(activity,t);
		mv.addObject("activity", activity);
		mv.setViewName("activity");
		return mv;
	}
}
