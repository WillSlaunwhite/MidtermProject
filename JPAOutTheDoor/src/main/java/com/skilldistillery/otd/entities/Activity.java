package com.skilldistillery.otd.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Activity {
	@Id
	@GeneratedValue
	private int id;

	private String title;

	@Column(name = "pro_tips")
	private String proTips;

	@Column(name = "elevation_gain_feet")
	private int elevationGain;

	private String route;

	@Column(name = "handicap_accessible")
	private boolean handicapAccessible;

	@Column(name = "dogs_allowed")
	private boolean dogsAllowed;

	private boolean parking;

	private String description;

	@Column(name = "profile_url")
	private String profileURL;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	private int difficulty;

	@Column(name = "distance_miles")
	private double distanceInMiles;

	
	@OneToMany(mappedBy="activity")
	private List<Image> images;
	
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(mappedBy="activity")
	private List<Comment> comments;
	
	
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
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
	
	public void addImage(Image image) {
		if(images == null) images = new ArrayList<>();
		
		if(!images.contains(image)) {
			images.add(image);
			if(image.getActivity() !=null) {
				image.getActivity().getImages().remove(image);
			}
			image.setActivity(this);
		}
	}
	
	public void removeImage(Image image) {
		image.setActivity(null);
		if(image !=null) {
			images.remove(image);
		}
	}
	public void addComment(Comment comment) {
		if(comments == null) comments = new ArrayList<>();
		
		if(!comments.contains(comment)) {
			comments.add(comment);
			if(comment.getActivity() !=null) {
				comment.getActivity().getComments().remove(comment);
			}
			comment.setActivity(this);
		}
	}
	
	public void removeComment(Comment comment) {
		comment.setActivity(null);
		if(comment !=null) {
			comments.remove(comment);
		}
	}
	
	
	
	
	

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Activity other = (Activity) obj;
		return id == other.id;
	}

}
