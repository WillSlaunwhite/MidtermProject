package com.skilldistillery.otd.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Image {
	@Id
	@GeneratedValue
	private int id;
	
	@Column(name="image_url")
	private String imageURL;
	
	@Column(name="user_id")
	private int stringId;
	
	@Column(name="activity_id")
	private int activityId;
	
	@Column(name="date_added")
	private LocalDate dateAdded;

}
