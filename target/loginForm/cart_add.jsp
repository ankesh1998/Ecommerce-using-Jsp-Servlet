<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%
	int product_id = Integer.parseInt(request.getParameter("prodId"));
	String user_name = (String) session.getAttribute("usersession");
	Connection con = DataBaseConnection.connect2Db();
	PreparedStatement ps = con.prepareStatement(
			"INSERT INTO users_items(user_name,product_id,status,date) VALUES (?,?,'Added to cart',now())");

	ps.setString(1, user_name);
	ps.setInt(2, product_id);

	ps.executeUpdate();
	
	response.sendRedirect("cart.jsp");
%>