<%@page import="java.util.List,com.product.Product,com.product.ProductDAO"%>
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
<title>Home</title>
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
	<%@ include file="header.jsp" %>
<div class="row">
		<div class='col-xs-8 col-sm-6 col-xs-offset-2 col-sm-offset-3'><br>
			<table class="table table-striped">
				<thead>
					<tr style="background-color: #FF5733;color: white">
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Price</th>
						<th colspan="2">Action</th>
					</tr>
				</thead>
				<%
					List<Product> productList = ProductDAO.getAllProducts();
					for (Product p : productList) {
				%>
				<tr>
					<td><%=p.getProduct_id()%></td>
					<td><%=p.getProduct_name()%></td>
					<td><%=p.getProduct_price()%></td>
					<td><button class="btn btn-primary"
							onclick="location.href = 'admin_edit_product.jsp?prodId=<%=p.getProduct_id()%>';">Edit</button>
						<button class="btn btn-primary"
							onclick="location.href = 'admin_delete_product.jsp?prodId=<%=p.getProduct_id()%>';">Delete</button></td>

				</tr>

				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>