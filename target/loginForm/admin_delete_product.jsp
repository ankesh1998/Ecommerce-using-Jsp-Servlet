<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%
	int product_id =Integer.parseInt(request.getParameter("prodId"));
	
	//System.out.print(product_id+" "+product_name+" "+product_price);

	Connection con = DataBaseConnection.connect2Db();
	PreparedStatement ps = con
			.prepareStatement("DELETE FROM product where product_id=?");

	ps.setInt(1, product_id);
	
	ps.executeUpdate();
	
	response.sendRedirect("admin_home.jsp");
%>