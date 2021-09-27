package com.skilldistillery.otd.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Activity {
	@Id
	@GeneratedValue
	private int id;
	
	private String title;
	
	@Column(name="pro_tips")
	private String proTips;
	
	@Column(name="elevation_gain_feet")
	private int elevationGain;

	private String route;
	
	@Column(name="handicap_accessible")
	private boolean handicapAccessible;
	
	@Column(name="dogs_allowed")
	private boolean dogsAllowed;
	
	private boolean parking;
	
	private String description;
	
	@Column(name="profile_url")
	private String profileURL;
	
	@Column(name="category_id")
	private int categoryId;
	
	@Column(name="location_id")
	private int locationId;
	
	private int difficulty;
	
	@Column(name="distance_miles")
	private double distanceInMiles;
	
	
	
	
}
