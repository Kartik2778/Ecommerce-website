package com.mycart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entites.User;
import com.mycart.helper.FactoryProvider;

public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignUp() {
        super();
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	public void processRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = request.getParameter("user_name");
			String userPass = request.getParameter("user_password");
			String userEmail = request.getParameter("user_email");
			String phoneNo = request.getParameter("user_phoneNo");
			String userAddress = request.getParameter("user_address");
			User user = new User(userName,userEmail,userPass,phoneNo,"Default.png",userAddress,"Normal");
			
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			
			Transaction tx = session.beginTransaction();
			session.persist(user);
			tx.commit();
			session.close();
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registered Successfully!!");
			response.sendRedirect("success_message.jsp");
			return;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
