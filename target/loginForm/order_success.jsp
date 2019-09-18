<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

	if (session.getAttribute("usersession") == null)
		response.sendRedirect("login.jsp");
%>
<%
	Connection con = DataBaseConnection.connect2Db();
	PreparedStatement ps;
	String user_name = (String) session.getAttribute("usersession");

	List<Integer> products_id = new ArrayList<Integer>();
	products_id = (List) session.getAttribute("products_id");

	int product_id;
	Iterator itr = products_id.iterator();
	while (itr.hasNext()) {

		product_id = (Integer) itr.next();
		ps = con.prepareStatement(
				"UPDATE users_items SET status='Confirmed' WHERE user_name=? AND product_id=? AND status='Added to cart'");
		ps.setString(1, user_name);
		ps.setInt(2, product_id);
		ps.executeUpdate();

	}
	session.removeAttribute("products_id");
%>
<!DOCTYPE html>
<html>
<head>
<title>success</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<center>
		<img src="order_success.jpg" alt="confirm" height="200" width="150">
		<P
			style="font-size: 50px; margin-top: 50px; color: green; font-style: bold;">Your
			order is confirmed.</P>
		<br>
		<br>
		<p style="font-size: 20px">Thank you for shopping with us!</p>
		<a href="shopping.jsp">Click Here</a> to purchase any other item.
	</center>
</body>
</html>
