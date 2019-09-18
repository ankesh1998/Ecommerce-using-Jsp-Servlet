<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnect.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

	if (session.getAttribute("usersession") == null)
		response.sendRedirect("login.jsp");
%>
<%
	String user_name = (String) session.getAttribute("usersession");
	Connection con = DataBaseConnection.connect2Db();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

	<div class="container-fluid">

		<div class="row decor_bg">
			<div class="col-md-6 col-md-offset-3">
				<table class="table table-striped">

					<%
						boolean flag = false;
						PreparedStatement ps = con.prepareStatement(
								"SELECT users_items.date AS date,users_items.id AS order_id,product.product_price AS Price,product.product_name AS Name FROM users_items JOIN product ON users_items.product_id = product.product_id WHERE users_items.user_name=? AND status='confirmed'");
						ps.setString(1, user_name);
						ResultSet rs = ps.executeQuery();
						flag = rs.next();
						rs.beforeFirst();
						if (flag) {
					%>
					<thead>
						<tr>
							<th>Order Number</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (rs.next()) {

									out.print("<tr><td>" + '#' + rs.getInt("order_id") + "</td><td>" + rs.getString("Name")
											+ "</td><td>Rs." + rs.getInt("Price") + "</td><td>" + rs.getString("date") + "</td></tr>");
								}
						%>
					</tbody>
					<%
						} else {
							out.print("Your haven't ordered anything yet !");
							out.print("<br><br><a href='shopping.jsp' class='btn btn-sm btn-default'>" + "Want to add product ?"
									+ "</a>");
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>