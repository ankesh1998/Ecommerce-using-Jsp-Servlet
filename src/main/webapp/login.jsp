
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
html { 
  background: url(background.jpg) no-repeat center fixed;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;

}
#overlay{
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
background: rgba(0,0,0,0.2);
</style>
</head>
<body id="overlay">
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-xs-8 col-sm-4 col-xs-offset-2 col-sm-offset-4">
				<div class="panel panel-primary">
					<div class="panel-heading" align="center">Login yourself</div>
					<div class="panel-body">
						<form action="LoginService" method="post">
							<div class="form-group row">
								<label for="name" class="col-xs-4">Contact:</label>
								<div class="col-xs-12">
									<input type="text" class="form-control" name="contact" placeholder="Enter your contact" pattern="[0-9]{10}" title="It should be of ten digits only" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="password" class="col-xs-4">Password:</label>
								<div class="col-xs-12">
									<input type="password" class="form-control" name="password" placeholder="Enter your password" onmouseover="this.type='text'" onmousedown="this.type='password'" onmouseout="this.type='password'"
										required autofocus>
								</div>
							</div>
							<input type="submit" value="submit"
								class="btn btn-primary btn-block">
							<% if(request.getParameter("error")!=null)
									out.print("<span style='color:red'>"+request.getParameter("error")+"</span>"); %>
						</form>
					</div>
					<div class="panel-footer">
						<div class="container-fluid">
							<div class="col-md-6">
								<a href="registration.jsp" style="text-decoration: none;">Not
									registered?</a>
							</div>
							<div class="col-md-6">
								<a href="forgotpass.jsp" style="text-decoration: none">Forgot
									password? </a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>