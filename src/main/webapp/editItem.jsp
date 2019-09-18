<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

if(session.getAttribute("usersession")==null)
    response.sendRedirect("login.jsp");

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Item</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="margin-top: 100px">
<div class="row">
<div class="col-xs-4" style="border: solid black 1px;padding: 5px">
<%

out.print("Replace "+"<b><q>"+request.getParameter("name")+"</q></b>");

String preItem = request.getParameter("name");
session.setAttribute("preitem", preItem);

%>
<form action="EditItemServlet" method="post">
<input type="text" name="editedItem" required="required" pattern=".*[^ ].*">
<input type="submit" value="update" class="btn btn-sm btn-success">
</form>

</div>
</div>
</div>
</body>
</html>