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
	public List<Activity> findAllHikes() {
		List<Activity> activities;
		String jpql = "SELECT a from Activity a";
			activities = em.createQuery(jpql, Activity.class).getResultList();
	
		
		
			return activities;
	}


	@Override
	public Activity findActivityByCategory() {
//		String jpql = "SELECT a from Activity a where a.category.id =1";
		Activity a = em.find(Activity.class, 1);
		return a;
	}
	

}
