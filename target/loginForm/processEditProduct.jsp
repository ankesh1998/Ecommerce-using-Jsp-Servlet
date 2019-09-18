<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%
	int product_id =Integer.parseInt(request.getParameter("prodId"));
	String product_name = request.getParameter("prodName");
	String product_price = request.getParameter("prodPrice");

	//System.out.print(product_id+" "+product_name+" "+product_price);

	Connection con = DataBaseConnection.connect2Db();
	PreparedStatement ps = con
			.prepareStatement("Update product set product_name=?,product_price=? where product_id=?");
	ps.setString(1,product_name);
	ps.setString(2, product_price);
	ps.setInt(3, product_id);
	
	ps.executeUpdate();
	
	response.sendRedirect("admin_home.jsp");
%>