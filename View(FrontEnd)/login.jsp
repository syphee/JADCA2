<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="login.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<section class="forms-section">
		<h1 class="section-title">SP BookStore Rentals</h1>
		<div class="forms">
			<div class="form-wrapper is-active">
				<button type="button" class="switcher switcher-login">
					Login <span class="underline"></span>
				</button>





				<form class="form form-login" action="./../../../VerifyUserLogin" method="post">
					<fieldset>
						<legend>Please, enter your email and password for login.</legend>
						<div class="input-block">
							<label for="login-email">E-mail</label> <input id="login-email"
								type="text" name="loginid" required>
						</div>
						<div class="input-block">
							<label for="login-password">Password</label> <input
								id="login-password" type="password" name="password" required>
						</div>
					</fieldset>
					<input type="submit" class="btn-login" value="Login">

				</form>



			</div>
			<div class="form-wrapper">
				<button type="button" class="switcher switcher-signup">
					Sign Up <span class="underline"></span>
				</button>
				<form class="form form-signup">
					<fieldset>
						<legend>Please, enter your email, password and password
							confirmation for sign up.</legend>
						<div class="input-block">
							<label for="signup-email">E-mail</label> <input id="signup-email"
								type="email" required>
						</div>
						<div class="input-block">
							<label for="signup-password">Password</label> <input
								id="signup-password" type="password" required>
						</div>
						<div class="input-block">
							<label for="signup-password-confirm">Confirm password</label> <input
								id="signup-password-confirm" type="password" required>
						</div>
					</fieldset>
					<button type="submit" class="btn-signup">Register</button>
				</form>
			</div>
		</div>
		
			<div id="notification-box">
		<!-- if there is content in output, display notification box -->
		
<%
    
    String errCode = request.getParameter("errCode");
    String output = "";
    
    // switch case to determine errcode present
    if(errCode != null){
    	if(errCode.equals("invalidLogin")){
    		output = "Invalid Username / Password. Please try again.";
    				System.out.println("Invalid Login");
    	}
    	
    	else if(errCode.equals("ConnectionErr")){
    		output = "Error with connecting to SP Rentals. Please contact the administrator.";
    		System.out.println("Connection Error");
    	}
    	else{
    		output = "";
    		System.out.println("Unknown");
    	}
    	
    }else{
     output = "";
     System.out.println("No error ");
    }
    
    // to display message if there is string in output
    if(output.equals("") != true){
  
%>

<!-- message comes here -->

<div class="alert alert-danger" role="alert">
  <%=output %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
    }
%>


	</div>
		
	</section>







	<script src="login.js"></script>

</body>
</html>