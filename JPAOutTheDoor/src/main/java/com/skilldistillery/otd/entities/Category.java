package com.skilldistillery.otd.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Category {
	@Id
	@GeneratedValue
	private int id;

	@Column(name="activity_type")
	private String activity;
	
	
	
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
