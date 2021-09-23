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
		// TODO Auto-generated method stub
		return null;
	}

}
