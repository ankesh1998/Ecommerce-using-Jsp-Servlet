package com.edit.item;

import java.io.IOException;
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
 * Servlet implementation class EditItemServlet
 */
public class EditItemServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession(false);
		
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if (session.getAttribute("usersession") == null) {
			response.sendRedirect("login.jsp");
		}
		
		String preItem =(String) session.getAttribute("preitem");
		String editedItem = request.getParameter("editedItem");
		String name =(String)session.getAttribute("usersession");
	//	System.out.print(preItem);
	//	System.out.print(request.getParameter("editedItem"));
		
		
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if(session.getAttribute("usersession")==null)
		    response.sendRedirect("login.jsp");

	
		
		
		
		try {
			
			Connection con = DataBaseConnection.getInstance().connect2Db();
			PreparedStatement ps = con.prepareStatement("update todo set items=? where items=? and name=?");
			ps.setString(1, editedItem);
			ps.setString(2, preItem);
			ps.setString(3, name);
			ps.executeUpdate();
			
			session.removeAttribute("preitem");
		//	System.out.print(preItem);
			response.sendRedirect("welcome.jsp?msg=Item Updated Successfully");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		}

}
