package com.skilldistillery.otd.data;

import com.skilldistillery.otd.entities.Activity;
import com.skilldistillery.otd.entities.Location;

public interface CRUDDao {
	void updateActivity(Activity activity, int id);
	Activity addActivity(Activity activity);
	boolean deleteActivity(int activityId);
	int addLocation(Location location);


}
