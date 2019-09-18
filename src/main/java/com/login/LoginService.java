package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.encrypt.password.EncryptPassword;

/**
 * Servlet implementation class LoginService
 */
public class LoginService extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		PrintWriter out = response.getWriter();

		String c = request.getParameter("contact");
		String p = request.getParameter("password");
		
		p = EncryptPassword.encrypt(p);
		
		HttpSession session = request.getSession();
		
		if (LoginValidate.validate(c, p)) {
			String name = LoginValidate.getName();
			String user_type = LoginValidate.getUserType();
			
			session.setAttribute("usersession", name);
			session.setAttribute("user_type", user_type);
			
			if(user_type.equals("customer"))
				response.sendRedirect("welcome.jsp");
			else
				response.sendRedirect("admin_home.jsp");
			
			
		}else{
			//out.print("<center style='color:red'>"+"Sorry, username or password Incorrect.<br><h1>:(</h1></center>");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp?error=Sorry, contact or password Incorrect.");
			rd.include(request, response);
		}
		out.close();
	}
}