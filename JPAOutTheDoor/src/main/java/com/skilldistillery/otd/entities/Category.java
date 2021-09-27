package com.skilldistillery.otd.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue
	private int id;

	@Column(name="activity_type")
	private String activity;
	
	@OneToMany(mappedBy="category")
	private List<Activity> activities;
	
	
	public List<Activity> getActivities() {
		return activities;
	}



	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public void addActivity(Activity activity) {
		if(activities == null) activities = new ArrayList<>();
		
		if(!activities.contains(activity)) {
			activities.add(activity);
			if(activity.getCategory() !=null) {
				activity.getCategory().getActivities().remove(activity);
			}
			activity.setCategory(this);
		}
	}
	
	public void removeActivity(Activity activity) {
		activity.setCategory(null);
		if(activity !=null) {
			activities.remove(activity);
		}
	}

	public Category() {}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Category [id=").append(id).append(", activity=").append(activity).append("]");
		return builder.toString();
	}
}
