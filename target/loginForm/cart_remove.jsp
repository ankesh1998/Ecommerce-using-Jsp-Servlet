<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%
	int product_id = Integer.parseInt(request.getParameter("prodId"));
	String user_name = (String) session.getAttribute("usersession");

	Connection con = DataBaseConnection.connect2Db();
	PreparedStatement ps = con.prepareStatement("DELETE FROM users_items WHERE product_id=? AND user_name=? AND status='Added to cart'");
	ps.setInt(1,product_id);
	ps.setString(2, user_name);
	
	ps.executeUpdate();
	
	response.sendRedirect("cart.jsp");
%>