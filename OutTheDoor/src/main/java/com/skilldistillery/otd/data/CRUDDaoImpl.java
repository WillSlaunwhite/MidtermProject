package com.skilldistillery.otd.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.otd.entities.Activity;

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
