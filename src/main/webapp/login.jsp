<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<%@include file = "components/common_css.jsp" %>
</head>
<body>
	<%@include file = "components/header.jsp" %>
	<div class = "container mt-4" style = "width: 35rem;"> 
		<div class = "card">
			<div class = "card-header" style = "background-color: #0336FF!important; color: white">
				<h2>Login here</h2>
			</div>
			<div class = "card-body">
				<%@include file = "warning_message.jsp" %>
				<form action = "Login" method = "post">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Email address</label>
				    <input type="email" name = "user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input name = "user_password" type="password" class="form-control" id="exampleInputPassword1">
				  </div>
				  <div class = "text-center">
				  <button type="submit" class="btn btn-primary" style = "background-color: #0336FF!important;">Submit</button>
				  </div>
				</form>
			</div>
		</div>
	</div>
	
	<%@include file = "components/common_js.jsp" %>
</body>
</html>