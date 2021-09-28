package com.skilldistillery.otd.data;

import java.util.List;

import com.skilldistillery.otd.entities.Activity;

public interface SearchDao {
	List<Activity> findAllHiking();
	List<Activity> findAllBiking();
	List<Activity> findAllKayaking();
	List<Activity> findAllRafting();
	List<Activity> findAllFishing();
	Activity findActivityById(int id);
	Activity findActivityByCategory();
	
	
}
