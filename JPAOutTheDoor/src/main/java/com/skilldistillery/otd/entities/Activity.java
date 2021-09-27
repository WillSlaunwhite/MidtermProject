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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProTips() {
		return proTips;
	}

	public void setProTips(String proTips) {
		this.proTips = proTips;
	}

	public int getElevationGain() {
		return elevationGain;
	}

	public void setElevationGain(int elevationGain) {
		this.elevationGain = elevationGain;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public boolean isHandicapAccessible() {
		return handicapAccessible;
	}

	public void setHandicapAccessible(boolean handicapAccessible) {
		this.handicapAccessible = handicapAccessible;
	}

	public boolean isDogsAllowed() {
		return dogsAllowed;
	}

	public void setDogsAllowed(boolean dogsAllowed) {
		this.dogsAllowed = dogsAllowed;
	}

	public boolean isParking() {
		return parking;
	}

	public void setParking(boolean parking) {
		this.parking = parking;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProfileURL() {
		return profileURL;
	}

	public void setProfileURL(String profileURL) {
		this.profileURL = profileURL;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public double getDistanceInMiles() {
		return distanceInMiles;
	}

	public void setDistanceInMiles(double distanceInMiles) {
		this.distanceInMiles = distanceInMiles;
	}
	
	
	
	
}
