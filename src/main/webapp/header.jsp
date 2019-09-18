
<%
	String user_type = (String) session.getAttribute("user_type");
%>
<nav class="navbar navbar-expand-sm bg-light navbar-light">


	<%
		if (user_type.equals("admin")) {
	%>

	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link"
			href="admin_home.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link"
			href="admin_add_product.jsp">Add-Product</a></li>
		<li class="nav-item"><a class="nav-link" href="LogOutServlet">
				Logout <span class="glyphicon glyphicon-log-out"></span>
		</a></li>
	</ul>

	<%
		} else {
	%>


	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="welcome.jsp">Home</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="shopping.jsp">Shopping</a></li>
		<li class="nav-item"><a class="nav-link" href="order.jsp">Orders</a></li>
		<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
		<li class="nav-item"><a class="nav-link" href="LogOutServlet">
				Logout <span class="glyphicon glyphicon-log-out"></span>
		</a></li>
	</ul>
	<%
		}
	%>
</nav>