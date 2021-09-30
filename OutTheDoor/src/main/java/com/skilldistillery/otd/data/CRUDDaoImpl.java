package com.skilldistillery.otd.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
			if(activity.getDescription()!=null) {
				updated.setDescription(activity.getDescription());
			}
			if(activity.getDifficulty()!=0){
				updated.setDifficulty(activity.getDifficulty());
			}
			
			
			
			
	}
	@Override
	public int addLocation(Location location) {
		String jpql = "SELECT l.id from Location l where l.zip_code = :zip";
		List<Location> locs = em.createQuery(jpql, Location.class).setParameter("zip", 
				location.getZipCode()).getResultList();
		if(locs.size() == 0) {
			em.persist(location);
			em.flush();
			String jpql = "UPDATE activity "
		}
		
		return 0;
		
	}	
	@Override
	public Activity addActivity(Activity activity) {
		
		
		
		
		em.persist(activity);
		em.flush();
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
