<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.entites.Product"%>
<%@page import="com.mycart.entites.Category"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.mycart.entites.User"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart</title>
<%@include file = "components/common_css.jsp" %>
</head>
<body>
	<%@include file = "components/header.jsp" %>
	<%
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> categoryList = cdao.getCategories();
		 ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
		 String cid = request.getParameter("category");
		 List<Product> productList = null;
		 if(cid == null || cid.trim().equals("all")) {
			 productList = pdao.getProducts();
		 }
		 else {
			 productList = pdao.getProductById(Integer.parseInt(cid));
		 }
		 
	%>
		<div class = "row mt-4">
		
			<div class = "col-2 ms-4">
					<ul class="list-group">
					  <li class="list-group-item active" aria-current="true">
					  	<a href="index.jsp?category=all" style = "text-decoration: none; color: white;" >All Categories </a>
					  </li>
					  
					  <%
					  	for(Category c: categoryList) {
					  %>	
					  	<li  name = "category" class="list-group-item" >
					  		<a href="index.jsp?category=<%= c.getCategoryId() %>" style="text-decoration: none;"><%= c.getCategoryTitle() %></a>
					    </li>
					  <% 
					  		} 
					   %>
					</ul>
			</div>
			
			<div class = "col-9 ms-4">
				<div class="row row-cols-1 row-cols-md-3 g-4">
				  <%
			  		for(Product p: productList) {
				  			
				  %>
					  <div class="col">
					    <div class="card">
					    <div class = "container text-center">
					      <img class = "mt-2" src="img/products/<%= p.getpPhoto() %>" class="card-img-top" alt="..." style = "height: 200px; max-width: 100%; width: auto;">
					    </div>
					      <div class="card-body">
					        <h5 class="card-title"><%= Helper.get6words(p.getpTitle()) %></h5>
					        <p class="card-text"><%= Helper.get10words(p.getpDesc()) %></p>
					      </div>
					      <div class = "card-footer">
					      	<button class = "btn btn-primary" onclick = "addToCart('<%= p.getpId() %>' , '<%= p.getpTitle() %>' , '<%= p.getPriceAfterDiscount() %>')" > Add to Cart</button>
					      	<button class = "btn btn-outline-success"> <span> &#8377; <%= p.getPriceAfterDiscount()+"/- " %> </span>  <span class = "price-tag text-secondary disc-label"> &#8377;  <%= p.getpPrice()+" " %> </span> <span class = "text-secondary disc-label"><%= p.getpDiscount()+"% off" %></span></button>
					      </div>
					    </div>
					 </div>
							  
					 <%
						}
				  		if(productList == null) {
				  			out.println("<h1>Their is no Item in this Category</h1>");
				  		}
				  	 %>
				  
				</div>
			</div>
		</div>
		<div id = "toast"></div>
<%@include file = "components/common_js.jsp" %>
</body>
</html>