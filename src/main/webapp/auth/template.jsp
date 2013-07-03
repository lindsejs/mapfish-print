<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>CSOTL autentifikacija</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=request.getContextPath()%>/auth/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; 
      }
      .container {
        width: 350px;
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; 
        -webkit-border-radius: 10px 10px 10px 10px;
           -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

	  .login-form {
		margin-left: 65px;
	  }
	
	  legend {
		margin-right: -50px;
		font-weight: bold;
	  	color: #404040;
	  }

    </style>

</head>
<body>
	<div class="container">
		<div class="content">
			<div class="row">
			
				<div class="login-form">
				<% if (request.getAttribute("msg") != null) {%>
				<%= request.getAttribute("msg") %>
				<%} %>
					<h3>PieslÄgÅ¡anÄs CSOTL</h3>
					
					<form method="POST" action="j_security_check" >
						<fieldset>
							<div class="clearfix">
								<input type="text" placeholder="LietotÄjvÄrds" name="j_username">
							</div>
							<div class="clearfix">
								<input type="password" placeholder="Parole" name="j_password">
							</div>
							<button class="btn btn-primary" type="submit">PieslÄgties</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div> <!-- /container -->
</body>
</html>
