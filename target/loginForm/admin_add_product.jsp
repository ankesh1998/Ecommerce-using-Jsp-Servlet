<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
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

	<div class="col-xs-4 col-sm-4 col-xs-offset-4 col-sm-offset-4">
		<form action="processAddProduct.jsp" method="post">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center">
							Product Details
						</th>
					</tr>
				</thead>
				
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="prodName" size="20"/></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="prodPrice" size="20"/></td>
				</tr>
			</table>
			<button class="btn btn-success">Add</button>
		</form>
	</div>
</body>
</html>