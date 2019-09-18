

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>

<%
	String productName = request.getParameter("prodName");
	String productPrice = request.getParameter("prodPrice");
	Connection conn = DataBaseConnection.connect2Db();
	PreparedStatement ps = conn.prepareStatement("INSERT INTO product(product_name,product_price) VALUES(?,?)");
	ps.setString(1, productName);
	ps.setString(2, productPrice);
	ps.executeUpdate();

	response.sendRedirect("admin_home.jsp");
%>