package com.skilldistillery.otd.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Comment {
	@Id
	@GeneratedValue
	private int id;
	
	private String description;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="activity_id")
	private int activityId;
	
	@Column(name="create_date")
	private LocalDateTime createDate;

	public Comment() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", description=" + description + ", userId=" + userId + ", activityId="
				+ activityId + ", createDate=" + createDate + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(activityId, createDate, description, id, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		return activityId == other.activityId && Objects.equals(createDate, other.createDate)
				&& Objects.equals(description, other.description) && id == other.id && userId == other.userId;
	}
	
	
	

}
