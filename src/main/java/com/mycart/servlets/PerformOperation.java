package com.mycart.servlets;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.mycart.dao.CategoryDao;
import com.mycart.dao.ProductDao;
import com.mycart.entites.Category;
import com.mycart.entites.Product;
import com.mycart.helper.FactoryProvider;


@MultipartConfig
public class PerformOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PerformOperation() {
        super();
    }
    @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	PrintWriter out = response.getWriter();
    	
		String operation = request.getParameter("operation");
		
		if(operation.trim().equals("addCategory")) {
			String categoryTitle = request.getParameter("category_title");
			String categoryDescription = request.getParameter("category_description");
			
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			categoryDao.addCategory(categoryTitle, categoryDescription);
			HttpSession session = request.getSession();
			session.setAttribute("message", "Category Added successfully!!");
			response.sendRedirect("admin.jsp");
		}
		else if(operation.trim().equals("addProduct")) {
			String productTitle =   request.getParameter("product_title");
			String productDescription =  request.getParameter("product_description");
			int productPrice = Integer.parseInt(request.getParameter("product_price"));
			int productDiscount =   Integer.parseInt(request.getParameter("product_discount"));
			int productQuantity = Integer.parseInt(request.getParameter("product_quantity"));
			int categoryId = Integer.parseInt(request.getParameter("category_id"));
			Part part = request.getPart("pic");
			
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			
			Category category = cdao.getCategory(categoryId);
			
			Product product = new Product(productTitle,productDescription,part.getSubmittedFileName(),productPrice,productDiscount,productQuantity,category);
			
			ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			
			String path = request.getRealPath("img")+"\\products\\"+part.getSubmittedFileName();
			FileOutputStream fos = new FileOutputStream(path);
			
			InputStream is = part.getInputStream();
			
			byte[] data = new byte[is.available()];
			
			is.read(data);
			
			fos.write(data);
			
			fos.close();
			
			is.close();
			
			pdao.addProduct(product);
					
			HttpSession session = request.getSession();
			session.setAttribute("message", "Product Added successfully!!");
			response.sendRedirect("admin.jsp");
		}
	}

    @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
