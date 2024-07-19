package com.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entites.Product;

public class ProductDao {
	
	private SessionFactory factory;
	
	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public void addProduct(Product product) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(product);
		tx.commit();
		session.close();
	}
	
	public List<Product> getProducts() {
		Session session = factory.openSession();
		Query<Product> q = session.createQuery("from Product");
		List<Product> list =  q.list();
		return list;
	}
	
	public List<Product> getProductById(int cid) {
		Session session = factory.openSession();
		Query<Product> q = session.createQuery("from Product as p where p.category.categoryId = "+cid);
		List<Product> list =  q.list();
		return list;
	}

}