<%@page import="java.sql.*,java.io.PrintWriter"%>
<%@ page import="com.dbconnect.DataBaseConnection" %>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

if(session.getAttribute("usersession")==null)
    response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script language="javascript">

function deleteRecord()
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
      return true;
  else
    return false;
}

</script>
</head>
<body>
<div class="container">
<%
	
//System.out.println(session.getAttribute("usersession"));
String n =(String)session.getAttribute("usersession");
out.print("<h1> Welcome <B style='color:#FF5733'>"+n+"</B></h1>");
%>
<a href="LogOutServlet"><button class="btn btn-default btn-sm">Log-out</button></a>

<br><br>
<form action="AdditemServlet" method="post">
		Add items to do : <input type="text" name="theitem" required="required" pattern=".*[^ ].*"> <input
			type="submit" value="Add" class='btn btn-success btn-sm'>
</form>
</div>
<hr>
<div class="container">
<%	
		if(request.getParameter("msg")!=null)
			out.print("<b style='color:green'>"+request.getParameter("msg")+"</b>");
%>
</div>
<div style="border: solid red 1px;padding: 10px;background-color:#FCFCFC;" class="container">
<b>To do items :</b>

	<ol>
			<%
			Connection con = DataBaseConnection.connect2Db();
			Statement stmt = con.createStatement();
			String sql = ("SELECT items FROM todo where name='"+n+"'"); // your compare clause must be in quote if it is string
		    ResultSet rs = stmt.executeQuery(sql);
			
		    while(rs.next()){
		         //Retrieve by column name
		 
		         String theitem = rs.getString("items");
		        

		         //Display values
		       
		       		out.print("<li>" + theitem +"</li>"+"<a href='DeleteItemServlet?name="+theitem+"' onclick='return deleteRecord();' class='btn btn-sm btn-danger'>"+"Delete</a>");
		         	//out.print("<li>" + theitem +"</li>"+"<a href='DeleteItemServlet?name="+theitem+"'>"+"<button style='margin-left:20px;margin-bottom:5px;background-color:red;font-weight:bold;color:#ffffff;'>delete</button>"+"</a>");
		         	out.print("<a href='editItem.jsp?name="+theitem+"'>"+"<button style='margin-left:20px;' class='btn btn-sm btn-primary'>Edit</button>"+"</a>");
			   
		         
		     
		  			
		      }
	
		%>
	</ol>
</div>
<br>
<div class="container">
<center>
<a href="shopping.jsp"><img alt="Go for Shopping" src="Shop-n-Go.png" height="150" width="200"></a>
</center>

</div>


</body>
</html>