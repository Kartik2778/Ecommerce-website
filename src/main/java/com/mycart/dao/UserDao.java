package com.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.mycart.entites.User;

public class UserDao {
	private SessionFactory factory;
	
	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public User getEmailPassword(String email,String password) {
		User user = null;
		
		try {
			String query = "from User where userEmail =: e and userPassword =: p";
			Session  session = factory.openSession();
			Query<User> q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user = q.uniqueResult();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User> getTotalUsers() {
		Session session = factory.openSession();
		Query<User> q = session.createQuery("from User");
		List<User> list = q.list();
		session.close();
		return list;
	}
}
