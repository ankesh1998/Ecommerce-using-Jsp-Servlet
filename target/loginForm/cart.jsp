<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
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
						int sum = 0;
						String username = (String) session.getAttribute("usersession");
						Connection con = DataBaseConnection.connect2Db();
						PreparedStatement ps = con.prepareStatement(
								"SELECT product.product_price AS Price, product.product_id AS Id, product.product_name AS Name FROM users_items JOIN product ON users_items.product_id = product.product_id WHERE users_items.user_name=? and status='Added to cart'");
						ps.setString(1, username);
						ResultSet rs = ps.executeQuery();
						flag = rs.next();
						rs.beforeFirst();
						if (flag) {
					%>
					<thead>
						<tr>
							<th>Product Number</th>
							<th>Product Name</th>
							<th>Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Integer> products_id = new ArrayList<Integer>();
								while (rs.next()) {
									sum += rs.getInt("Price");
									int id = rs.getInt("Id");

									products_id.add(id);

									out.print("<tr><td>" + '#' + rs.getInt("Id") + "</td><td>" + rs.getString("Name") + "</td><td>Rs."
											+ rs.getInt("Price") + "</td><td><a href='cart_remove.jsp?prodId=" + id
											+ "' class='btn btn-sm btn-danger'> Remove</a></td></tr>");
								}
								session.setAttribute("products_id", products_id);
								out.print("<tr><td></td><td><b>Total</b></td><td><b>Rs. " + sum
										+ "</b></td><td><a href='order_success.jsp' class='btn btn-sm btn-success'> Confirm Order</a></td></tr>");
						%>
					</tbody>
					<%
						} else {
							out.print("Your Cart is Empty !");
							out.print("<br><br><a href='shopping.jsp' class='btn btn-sm btn-default'>"+"Want to add product ?"+"</a>");
						}
					%>
				</table>
				<% if(flag) { %>
				<a href="shopping.jsp" style="text-decoration: none">Want to add
					more product ?</a>
				<% } %>
			</div>
		</div>
	</div>



</body>
</html>