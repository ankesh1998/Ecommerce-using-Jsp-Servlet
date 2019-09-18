package com.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {

	private static DataBaseConnection jdbc;
	private static Connection con = null;

	// private constructor which prevents the instantiation from any other class.
	private DataBaseConnection() {
	}

	// Now we are providing global point of access.
	public static DataBaseConnection getInstance() {
		if (jdbc == null) {
			jdbc = new DataBaseConnection();
		}
		return jdbc;
	}

	public static Connection connect2Db() throws SQLException, ClassNotFoundException {
		if (con == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");

			System.out.println("******************Establish DB Connection**********************");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servletproject", "root", "2015");
			
		}
		return con;
	}
}
