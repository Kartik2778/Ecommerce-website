<%@page import="com.mycart.entites.User"%>
<header class="p-3 text-bg-dark" style = "background-color: #0336FF!important;">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <div class="icon-square text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3" style = "border-radius: 5px; padding: 5px; font-size: 20px!important;">
          MyCart
        </div>
          <li><a href="index.jsp" class="nav-link px-2 text-white">Home</a></li>
        </ul>

		<div class = "me-4" data-bs-toggle="modal" data-bs-target="#cart" >
			<a class = "nav-link" href="#"> <i class = "fa fa-cart-plus" style = "font-size: 30px" ></i> <span class = "cart-item ms-2">(0)</span> </a>
		</div>
        
		<%
			User user1 = (User)session.getAttribute("current_user");
			if(user1 == null) {
		%>
		
        <div class="text-end">
          <button type="button" class="btn btn-success btn-outline-light me-2">
         	<a href="login.jsp" style="text-decoration: none; color: white;" >Login</a>
          </button>
          <button type="button" class="btn btn-warning">
          	 <a href="signup.jsp" style="text-decoration: none; color: white;" >Sign-Up</a>
		   </button>
        </div>
        <%
			}
			else {
		%>
		<div class="text-end">
          <img src="img/user_img.jpeg" alt="mdo" width="32" height="32" class="rounded-circle" >
           <a style = "text-decoration: none; color: white;" href = '<%= user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp" %>'><%= user1.getUserName() %></a> 
           <button type="button" class="btn btn-warning" style = "margin-left: 20px">
          	 <a href="logout" style="text-decoration: none; color: white;" >Logout</a>
		   </button>
        </div>
		<%
			}
        %>
      </div>
    </div>
  </header>
 <%@ include file = "common_modal.jsp" %>