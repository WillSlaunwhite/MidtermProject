package com.skilldistillery.otd.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.otd.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findByUsername(String username) {
		String jpql = "SELECT u FROM User u WHERE u.username = :uname";
		User user = null;
		
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("uname", username)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("No User Found with username: " + username);
		}
		
		return user;
	}
}
