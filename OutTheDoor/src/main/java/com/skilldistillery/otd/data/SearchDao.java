package com.skilldistillery.otd.data;

import java.util.List;

import com.skilldistillery.otd.entities.Activity;

public interface SearchDao {
	List<Activity> findAllHikes();
	Activity findActivityByCategory();
	
	
}
