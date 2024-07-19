package com.mycart.entites;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;


@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pTitle;
	@Column(length = 2000)
	private String pDesc;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	
	@ManyToOne
	private Category category;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String pTitle, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		super();
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpPhoto() {
		return pPhoto;
	}

	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public int getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public int getPriceAfterDiscount() {
		int d = (int) ((this.pDiscount/100.0)*this.pPrice);
		d = this.pPrice - d;
		return d;
	}
}
