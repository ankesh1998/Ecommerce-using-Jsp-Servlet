package com.login;

import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.dbconnect.DataBaseConnection;

public class LoginValidate {
	static String name = null;
	static String user_type = null;
	public static boolean validate(String contact, String pass) {
		boolean status = false;
		
		try {
			
			Connection con = DataBaseConnection.connect2Db();
			PreparedStatement ps = con.prepareStatement("select name,user_type from user where contact=? and password=?");
			ps.setString(1, contact);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user_type = rs.getString("user_type");
				name = rs.getString("name");
			//	System.out.println(name+" "+user_type);
			status = rs.first();
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static String getName() {
		return name;
	}
	
	public static String getUserType() {
		return user_type;
	}
}
