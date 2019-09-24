package com.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnect.DataBaseConnection;
import com.encrypt.password.EncryptPassword;

/**
 * Servlet implementation class RegisterService
 */
public class RegisterService extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean status;
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");

		password = EncryptPassword.encrypt(password);

		HttpSession session = request.getSession();
		
		session.setAttribute("usersession", name);

		Connection con = null;
		PrintWriter out = response.getWriter();
		try {
			con = DataBaseConnection.getInstance().connect2Db();
			PreparedStatement ps = con.prepareStatement("select contact from user where contact=?");
			
			ps.setString(1, contact);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			

			if (status){

				
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp?error=Sorry! contact already exists.");
				rd.include(request, response);
			}else {
				ps = con.prepareStatement("Insert into user (name,password,contact,address,user_type) values (?,?,?,?,'customer')");
				ps.setString(1, name);
				ps.setString(2, password);
				ps.setString(3, contact);
				ps.setString(4, address);

				ps.executeUpdate();
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp?error=You registered successfully.");
				rd.forward(request, response);
			}

		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

}
