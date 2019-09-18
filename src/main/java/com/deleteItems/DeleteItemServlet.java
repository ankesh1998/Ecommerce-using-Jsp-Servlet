package com.deleteItems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnect.DataBaseConnection;

/**
 * Servlet implementation class DeleteItemServlet
 */
public class DeleteItemServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	//	System.out.println(request.getParameter("name"));
		HttpSession session = request.getSession(false);
		
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if(session.getAttribute("usersession")==null)
		    response.sendRedirect("login.jsp");

	
		String name =(String)session.getAttribute("usersession");
		String theItem = request.getParameter("name");
		
		try {
		
			Connection con =DataBaseConnection.getInstance().connect2Db();
			PreparedStatement ps = con.prepareStatement("Delete from todo where name=? and items=?");
			ps.setString(1, name);
			ps.setString(2, theItem);
			ps.executeUpdate();
			
			response.sendRedirect("welcome.jsp?msg=Item deleted Successfully");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
