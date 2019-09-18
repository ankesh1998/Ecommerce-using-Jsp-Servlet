<%@page import="com.product.Product,com.product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit product</title>
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
	<%
		String productId = request.getParameter("prodId");
		Product product = ProductDAO.getProductById(productId);
		
	%>
	<div class="col-xs-4 col-sm-4 col-xs-offset-4 col-sm-offset-4">
		<form action="processEditProduct.jsp" method="post">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center">
							Product Details
						</th>
					</tr>
				</thead>
				<tr>
					<td>Product ID</td>
					<td><input type="text" name="prodId" size="20"
						value="<%=productId%>"  readonly/></td>
				</tr>
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="prodName" size="20"
						value="<%=product.getProduct_name()%>" /></td>
				</tr>
				
				<tr>
					<td>Price</td>
					<td><input type="text" name="prodPrice" size="20"
						value="<%=product.getProduct_price()%>"/></td>
				</tr>
			</table>
			<button class="btn btn-primary">Update</button>
		</form>
	</div>
</body>
</html>