package com.additem;

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
import com.mysql.cj.Session;

/**
 * Servlet implementation class AdditemServlet
 */
public class AdditemServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);

		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if (session.getAttribute("usersession") == null) {
			response.sendRedirect("login.jsp");
		}

		String name = (String) session.getAttribute("usersession");
		String theItem = request.getParameter("theitem");

		try {
			Connection con =DataBaseConnection.getInstance().connect2Db();
			PreparedStatement ps = con.prepareStatement("Insert into todo (items,name,data_added) values (?,?,now())");
			ps.setString(1, theItem);
			ps.setString(2, name);
			ps.executeUpdate();

			response.sendRedirect("welcome.jsp?msg=Item Added Successfully");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
