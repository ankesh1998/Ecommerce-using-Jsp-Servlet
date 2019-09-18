package com.forgot.password;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnect.DataBaseConnection;
import com.encrypt.password.EncryptPassword;

/**
 * Servlet implementation class ContactService
 */
public class ContactService extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean status = false;
		
	
		String contact = request.getParameter("contact");
		HttpSession session = request.getSession(true);
		
			
		
		
		try {
			
			
			Connection con=DataBaseConnection.getInstance().connect2Db();
			
			PreparedStatement ps = con.prepareStatement("select contact from user where contact=?");
			ps.setString(1, contact);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
					
			
			if (status) {
				session.setAttribute("contact",contact);
				RequestDispatcher rd = request.getRequestDispatcher("forgotpass2.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("forgotpass.jsp?error=Sorry! your contact is incorrect.");
				rd.include(request, response);
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
