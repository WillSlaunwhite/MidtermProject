package com.skilldistillery.otd.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Rating {
//	 Not entirely sure the correct way to do two primary ids for rating,
//	 so leaving these placeholders here for now until we map relationship properly.
	
	@EmbeddedId
	private RatingId id;
	
	
	
	private int rating;
	
	@Column(name="rate_comment")
	private String ratingComment;
	
	
	
	public Rating() {}
	
	

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Rating [rating=").append(rating).append(", ratingComment=").append(ratingComment).append("]");
		return builder.toString();
	}
	
	
}
