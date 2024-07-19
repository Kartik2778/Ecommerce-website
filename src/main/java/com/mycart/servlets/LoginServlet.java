package com.mycart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.entites.User;
import com.mycart.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }
    @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccedRequest(request,response);
	}
    @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccedRequest(request,response);
	}

	private void proccedRequest(HttpServletRequest request, HttpServletResponse response) {
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		
		UserDao dao = new UserDao(FactoryProvider.getFactory());
		User user = dao.getEmailPassword(userEmail, userPassword);
		
		try {
			
			if(user == null) {
				HttpSession session = request.getSession();
				session.setAttribute("message", "Email id and Password is Invalid");
				response.sendRedirect("login.jsp");
			}
			else {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("current_user",user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				else {
					response.sendRedirect("index.jsp");
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
