package com.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entites.Category;

public class CategoryDao {
	
	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public void addCategory(String categoryTitle,String categoryDescription) {
		Session session = factory.openSession();
		Category category = new Category(categoryTitle,categoryDescription);
		Transaction tx = session.beginTransaction();
		session.persist(category);
		tx.commit();
		session.close();
	}
	
	public List<Category> getCategories() {
		Session session = factory.openSession();
		Query<Category> q = session.createQuery("from Category");
		List<Category> list = q.list();
		return list;
	}
	
	public Category getCategory(int cid) {
		Category category = null;
		try {
		Session session = factory.openSession();
		category = session.get(Category.class, cid);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return category;
	}

}
