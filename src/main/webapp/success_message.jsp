<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registerd Successfully</title>
<%@include file = "components/common_css.jsp" %>
</head>
<body>
	<%@include file = "components/header.jsp" %>
	<%
		String message = (String)session.getAttribute("message");
		if(message != null) {	
	%>
	<div class = "container d-flex" style = "width: 400px; margin-top: 50px;">
		<div class="text-center" >
			<img src="img/succesfully_img.png" alt="registerd successfully image" width="50">
		  	 <h4><%= message %></h4>
	    </div>
	</div>
	<%
		}
		session.removeAttribute("message");
	%>

<%@include file = "components/common_js.jsp" %>
</body>
</html>