package com.skilldistillery.otd.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.otd.entities.Activity;
import com.skilldistillery.otd.entities.Location;

@Service
@Transactional
public class CRUDDaoImpl implements CRUDDao {
	@PersistenceContext
	private EntityManager em;

	@Override
	public void updateActivity(Activity activity, int id) {

		Activity updated = em.find(Activity.class, id);
		if (activity.getTitle() != null) {
			updated.setTitle(activity.getTitle());
		}
		if (activity.getDescription() != null) {
			updated.setDescription(activity.getDescription());
		}
		if (activity.getDifficulty() != 0) {
			updated.setDifficulty(activity.getDifficulty());
		}

	}

	@Override
	public Location addLocation(Location location) {
		String jpql = "SELECT l from Location l where l.zipCode=:zip";
		List<Location> locs = em.createQuery(jpql, 
				Location.class).setParameter("zip",
						location.getZipCode()).getResultList();
		if(locs.size()!=0) {
			location = locs.get(0);
		}else {
		em.persist(location);
;		em.flush();
		return location;
	}
		return location;
	}

	@Override
	public Activity addActivity(Activity activity, Location location) {
		em.persist(activity);
		em.flush();
		String jpql = "Update Activity a "
				+ "set location_id = :loc "
				+ "where a.id = :id";
		em.createQuery(jpql).setParameter("loc", location.getId())
		.setParameter("id", activity.getId());
//		String jpql2 = "Update Activity a "
//				+ "set category_id = :cat "
//				+ "where a.id = :id";
//		em.createQuery(jpql2).setParameter("cat", id)
//		.setParameter("id", activity.getId());
//		
		return activity;
		
	}

	@Override
	public boolean deleteActivity(int activityId) {
		boolean complete = false;
		Activity t = em.find(Activity.class, activityId);
		em.remove(t);
		complete = em.contains(t);
		return complete;

	}

	
	

}
