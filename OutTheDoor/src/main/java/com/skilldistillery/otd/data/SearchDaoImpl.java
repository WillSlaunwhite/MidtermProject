package com.skilldistillery.otd.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.otd.entities.Activity;

@Service
@Transactional
public class SearchDaoImpl implements SearchDao{
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public List<Activity> findAllHiking() {
		List<Activity> activities;
		String jpql = "SELECT a from Activity a WHERE a.category.id=1";
		activities = em.createQuery(jpql, Activity.class).getResultList();
	
		
		return activities;
	}

	@Override
	public List<Activity> findAllBiking() {
		List<Activity> activities;
		String jpql = "SELECT a from Activity a WHERE a.category.id=2";
		activities = em.createQuery(jpql, Activity.class).getResultList();
	
		
		return activities;	
	}

	@Override
	public List<Activity> findAllKayaking() {
		List<Activity> activities;
		String jpql = "SELECT a from Activity a WHERE a.category.id=3";
		activities = em.createQuery(jpql, Activity.class).getResultList();
	
		
		return activities;
	}


	@Override
	public List<Activity> findAllRafting() {
		List<Activity> activities;
		String jpql = "SELECT a from Activity a WHERE a.category.id=4";
		activities = em.createQuery(jpql, Activity.class).getResultList();
	
		
		return activities;
	}


	@Override
	public List<Activity> findAllFishing() {
		List<Activity> activities;
		String jpql = "SELECT a from Activity a WHERE a.category.id=5";
		activities = em.createQuery(jpql, Activity.class).getResultList();
		
		
		return activities;
	}
	
	@Override
	public Activity findActivityById(int id) {
		Activity activity;
		activity = em.find(Activity.class, id);
		
		
		return activity;
	}
	
	@Override
	public Activity findActivityByCategory() {
//		String jpql = "SELECT a from Activity a where a.category.id =1";
		Activity a = em.find(Activity.class, 1);
		return a;
	}
}
