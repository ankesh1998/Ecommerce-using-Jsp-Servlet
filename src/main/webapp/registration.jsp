<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="panel panel-primary">
					<div class="panel-heading" align="center">Register yourself</div>
					<div class="panel-body">
						<form action="RegisterService" method="post">
							<div class="form-group row">
								<label for="name" class="col-xs-4">Name:</label>
								<div class="col-xs-12">
									<input type="text" class="form-control" name="name"  pattern="[a-zA-Z\s]+" required autofocus>
								</div>
							</div>
							<div class="form-group row">
								<label for="password" class="col-xs-4">Password:</label>
								<div class="col-xs-12">
									<input type="password" class="form-control" name="password" onmouseover="this.type='text'" onmousedown="this.type='password'" onmouseout="this.type='password'"
										required autofocus>
								</div>
							</div>
							<div class="form-group row">
								<label for="password" class="col-xs-4">Contact :</label>
								<div class="col-xs-12">
									<input type="text" class="form-control" name="contact" maxlength="10" pattern="[0-9]{10}" title="It should be of ten digits only"
										required autofocus>
								</div>
							</div>
							<div class="form-group row">
								<label for="name" class="col-xs-4">Address:</label>
								<div class="col-xs-12">
									<input type="text" class="form-control" name="address" required
										autofocus>
								</div>
							</div>
							<input type="submit" value="submit" class="btn btn-primary btn-block"> 
							<% if(request.getParameter("error")!=null)
									out.print("<span style='color:red'>"+request.getParameter("error")+"</span>"); %>
						</form>
					</div>
					<div class="panel-footer" align="center"><a href="login.jsp" style="text-decoration: none">Go back to login</a></div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>