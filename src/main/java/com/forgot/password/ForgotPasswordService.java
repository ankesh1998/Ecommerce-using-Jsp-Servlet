package com.forgot.password;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
import com.login.LoginValidate;

/**
 * Servlet implementation class ForgotPasswordService
 */
public class ForgotPasswordService extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		String username = null;
		
		
		HttpSession session = request.getSession(false);
		
		String contact = (String) session.getAttribute("contact");
	
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		
		password = EncryptPassword.encrypt(password);
		confirm_password = EncryptPassword.encrypt(confirm_password);
		
		PrintWriter out = response.getWriter();
		
		try {
			
			
			Connection con=DataBaseConnection.getInstance().connect2Db();
			
			PreparedStatement ps = con.prepareStatement("select name,contact from user where contact=?");
			ps.setString(1, contact);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
			username = rs.getString(1);
		
			}
			
			
			if(!password.equals(confirm_password)) {
				
				
				RequestDispatcher rd = request.getRequestDispatcher("forgotpass2.jsp?error=Sorry! Both password doesn't match.");
				rd.include(request, response);
				
			}
			else  {
				ps = con.prepareStatement("update user set password=? where contact=?");
				ps.setString(1, password);
				ps.setString(2, contact);
				ps.executeUpdate();
				
				session.removeAttribute("contact");
				
				//out.print("<center style='color:green'>Hello <q style='color:red'>"+username+"</q>, your password is updated Successfully.</center>");
				//RequestDispatcher rd = request.getRequestDispatcher("login.jsp?error=your password is updated Successfully");
				
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('your password is updated Successfully');");
				   out.println("location='login.jsp';");
				   out.println("</script>");
				
				//rd.include(request, response);
			} 
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
