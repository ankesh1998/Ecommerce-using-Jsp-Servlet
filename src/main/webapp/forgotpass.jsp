<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot password</title>
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
					<div class="panel-heading" align="center">Recover Password</div>
					<div class="panel-body">
						<form action="ContactService" method="post">
							<div class="form-group row">
								<label for="name" class="col-sm-12">Contact:</label>
								<div class="col-xs-12">
									<input type="text" class="form-control" placeholder="Enter previous contact" name="contact"
										pattern="[0-9]{10}" title="It should be of ten digits only" required="required">
								</div>
							</div>
						
							<input type="submit" value="submit"
								class="btn btn-primary btn-block">
								
							<%	if(request.getParameter("error")!=null)
								out.print("<span style='color:red'>"+request.getParameter("error")+"</span>"); %>
						</form>
					</div>
					<div class="panel-footer">
					<div class="container-fluid">
						<div class="col-md-12" align="center">
							<a href="login.jsp" style="text-decoration: none">Go back to login</a>
						</div>
						
					</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>