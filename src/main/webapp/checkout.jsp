<%
	User user = (User) session.getAttribute("current_user");
	if(user == null) {
		
		session.setAttribute("message", "Login first !! to access Checkout page");
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
<title>Chekout Page</title>
<%@include file = "components/common_css.jsp" %>
</head>
<body>
<%@include file = "components/header.jsp" %>

<div class = "container">
	<div class = "row">
		<div class = "col-6">
			<div class = "card mt-4">
				<div class = "card-header"><h2>Your Selected Items</h2></div>
					<div class = "card-body">
						<div class = "cart-body"></div>
					</div>
			</div>
		</div>
		
		<div class = "col-6">
			<div class = "card mt-4">
				<div class = "card-header"><h2>Your Details for order</h2></div>
					<div class = "card-body">
						<form>
						  <div class="mb-3">
						    <label for="exampleInputEmail1" class="form-label">Email</label>
						    <input value = "<%= user.getUserEmail() %>" placeholder = "Enter Email" name = "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"> 
						  </div>
						  <div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input value = "<%= user.getUserPassword() %>" placeholder = "Enter password" name = "password" type="password" class="form-control" id="exampleInputPassword1">
						  </div>
						  <div class="mb-3">
						    <label for="phone_no" class="form-label">Phone no</label>
						    <input value = "<%= user.getUserPhone() %>" placeholder = "Enter Phone no" name = "phone_no" type="number" class="form-control" id="phone_no">
						  </div>
						   <div class="mb-3">
						    <label for="address" class="form-label">Shipping Address</label>
						    <textarea value = "<%= user.getUserAdress() %>" placeholder = "Enter address" name = "shipping_address" class = "form-control" style="height: 100px" id = "address"></textarea>
						  </div>
						  <div class = "container text-center">
						  	<button type="submit" class="btn btn-outline-success">Order</button>
						  </div>
						</form>
					</div>
			</div>
		</div>
	</div>

</div>
	
<div id = "toast"></div>
<%@include file = "components/common_js.jsp" %>
</body>
</html>