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
