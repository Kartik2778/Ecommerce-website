
<%@page import="com.mycart.entites.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@page import="com.mycart.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.helper.FactoryProvider"%>

<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entites.User"%>
<%
	User user = (User) session.getAttribute("current_user");
	if(user == null) {
		
		session.setAttribute("message", "Login first !!");
		response.sendRedirect("login.jsp");
		return;
	}
	else if(user.getUserType().equals("Normal")) {
		session.setAttribute("message", "You are not admin do not try to access this page");
		response.sendRedirect("login.jsp");
		return;		
	}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<%@include file = "components/common_css.jsp" %>
</head>
<body>
	<%@include file = "components/header.jsp" %>
	<% 
	UserDao udao = new UserDao(FactoryProvider.getFactory());
	List<User> list = udao.getTotalUsers();
	CategoryDao cdao2 = new CategoryDao(FactoryProvider.getFactory());
	List<Category> list2 = cdao2.getCategories();
	ProductDao pdao2 = new ProductDao(FactoryProvider.getFactory());
	List<Product> list3 = pdao2.getProducts();
	%>
	<div class = "container mt-4 admin"> 
		<%@include file = "warning_message.jsp" %>
		<div class = "row">
			<div class = "col md-4">
				<div class = "card text-center">
					<div class = "card-body">
						<img alt="users_iconn" src="img/team.png" style="width: 150px" class="rounded-circle">
						<h3><%= list.size() %></h3>
						<h1>Users</h1>
					</div>
				</div>
			</div>
			<div class = "col md-4">
				<div class = "card text-center">
					<div class = "card-body">
					<img alt="users_iconn" src="img/categories.png" style="width: 150px" class="rounded-circle">
						<h3><%= list2.size() %></h3>
						<h1>Categories</h1>
					</div>
				</div>
			</div>
			<div class = "col md-4">
				<div class = "card text-center">
					<div class = "card-body">
					<img alt="users_iconn" src="img/products.png" style="width: 150px" class="rounded-circle">
						<h3><%= list3.size() %></h3>
						<h1>Products</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class = "row mt-4">
			<div class = "col md-6"  data-bs-toggle="modal" data-bs-target="#add-category">
				<div  class = "card text-center">
					<div class = "card-body">
					<img alt="users_iconn" src="img/apps.png" style="width: 150px" class="rounded-circle">
						<p class = "mt-3">Click here to add new Category</p>
						<h1>Categories</h1>
					</div>
				</div>
			</div>
			<div class = "col md-6" data-bs-toggle="modal" data-bs-target="#add-product">
				<div class = "card text-center">
					<div class = "card-body">
					<img alt="users_iconn" src="img/add-product.png" style="width: 150px" class="rounded-circle">
						<p class = "mt-3">click here to add new Product</p>
						<h1>Products</h1>
					</div>
				</div>
			</div>
		</div>
	
	</div>

<!-- Modal -->
<div class="modal fade" id="add-category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style = "background-color: #0336FF; color: white;">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
       	<form action = "performOperation" method = "post">
		  <div class="mb-3">
		    <input name = "category_title" type="text" class="form-control" placeholder = "Enter Category Title">
		  </div>
		  <div class="mb-3">
		    <textarea name = "category_description" class="form-control" placeholder = "Enter Category Description"></textarea>
		  </div>
		  <div class = "text-center">
		  <button type="submit" class="btn btn-success">Add Category</button>
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		  </div>
		  <input type = "hidden" name = "operation" value = "addCategory">
		</form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg
  ">
    <div class="modal-content">
      <div class="modal-header" style = "background-color: #0336FF; color: white;">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
       	<form action = "performOperation" method = "post" enctype="multipart/form-data">
		  <div class="mb-3">
		    <input name = "product_title" type="text" class="form-control" placeholder = "Enter title of product">
		  </div>
		  <div class="mb-3">
		    <textarea name = "product_description" class="form-control" placeholder = "Enter description of product"></textarea>
		  </div>
		  <div class="mb-3">
		    <input name = "product_price" type="text" class="form-control" placeholder = "Enter product price">
		  </div>
		  <div class="mb-3">
		    <input name = "product_discount" type="text" class="form-control" placeholder = "Enter discount on product">
		  </div>
		  <div class="mb-3">
		    <input name = "product_quantity" type="text" class="form-control" placeholder = "Enter product Quantity">
		  </div>
		  
		  <div class="mb-3">
		  <select name = "category_id" class = "form-control">
		  
		  <%
			  for(Category c: list2) {
		  %>
		  <option value = "<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
		  <% 
			  }
		  %>
		  </select>
		  </div>
		  <div class = "mb-3">
		  <input type = "file" class = "form-control" name = "pic">
		  </div>
		  <div class = "text-center">
		  <button type="submit" class="btn btn-success">Add Product</button>
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		  </div>
		  <input type = "hidden" name = "operation" value = "addProduct">
		</form>
      </div>
    </div>
  </div>
</div>


	
	
<%@include file = "components/common_js.jsp" %>
</body>
</html>