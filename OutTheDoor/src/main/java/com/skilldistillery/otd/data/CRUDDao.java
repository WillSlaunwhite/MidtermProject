package com.skilldistillery.otd.data;

import com.skilldistillery.otd.entities.Activity;

public interface CRUDDao {
	void updateActivity(Activity activity, int id);
	Activity addActivity(Activity activity);
	boolean deleteActivity(int activityId);



}
