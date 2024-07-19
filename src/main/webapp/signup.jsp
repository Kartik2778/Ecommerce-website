<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file = "components/common_css.jsp" %>
</head>
<body>
<%@include file = "components/header.jsp" %>


	<div class = "container" style="width: 35rem; margin-top: 20px;">
	<div class = "card">
		<div class = "card-body" style = " padding: 20px; 	background-color: #81D4FA;">
			<h3 class = "text-center">Sign Up here !!</h3>
			<form action = "SignUp" method = "post">
				  <div class="mb-3">
				    <label for="user_name" class="form-label">Name</label>
				    <input type="text" class="form-control" id="user_name" name = "user_name" aria-describedby="emailHelp">
				  </div>
				  <div class="mb-3">
				    <label for="user_email" class="form-label">Email</label>
				    <input type="email" class="form-control" id="user_email" name = "user_email">
				  </div>
				  <div class="mb-3">
				    <label for="user_password" class="form-label">Password</label>
				    <input type="password" class="form-control" id="user_password" name = "user_password" aria-describedby="emailHelp">
				  </div>
				  <div class="mb-3">
				    <label for="user_phoneNo" class="form-label">Phone Number</label>
				    <input type="number" class="form-control" id="user_phoneNo" name = "user_phoneNo" aria-describedby="emailHelp">
				  </div>
				  <div class="mb-3">
				    <label for="user_address" class="form-label">Address</label>
				   	<textarea style = "height: 100px" id = "user_address" class = "form-control" name = "user_address"></textarea>
				  </div>
				  <div class = "text-center">
				  	<button type="submit" class="btn btn-primary">Submit</button>
				  </div>
				</form>
		</div>
	</div>
	</div>
	
</body>
</html>