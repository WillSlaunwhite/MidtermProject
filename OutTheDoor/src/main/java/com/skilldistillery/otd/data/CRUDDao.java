package com.skilldistillery.otd.data;

import javax.servlet.http.HttpSession;

import com.skilldistillery.otd.entities.Activity;
import com.skilldistillery.otd.entities.Location;

public interface CRUDDao {
	Activity updateActivity(Activity activity, int id);
	boolean deleteActivity(int activityId);
	Location addLocation(Location location);
	Activity addActivity(Activity activity, int categoryID, int locationID);


}
