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

	@Override
	public User createUser(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setRole("user");
		user.setEnabled(true);
		em.persist(user);
		em.flush();
		return user;
	}
}
