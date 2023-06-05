<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

// the automatic login feature

// to check for cookies
Cookie[] cookies = request.getCookies();
if (cookies != 	null) {
    for (Cookie cookie : cookies) {
    	
    	// to find the rememberMe cookie
        if (cookie.getName().equals("rememberMe")) {
            String username = cookie.getValue();
            
            session.setAttribute("username",username);
            
            // then redirect
            response.sendRedirect("home.jsp");
            break;
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  css link  -->
<link rel="stylesheet" type="text/css" href="login.css" />

<!--  bootstrap link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/library svg/test.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	
	
	
	

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
				<section class="forms-section">
		<h1 class="section-title">SP BookStore Rentals</h1>
		<div class="forms">
			<div class="form-wrapper is-active">
				<button type="button" class="switcher switcher-login">
					Login <span class="underline"></span>
				</button>




				<!-- Login section -->
				<form class="form form-login" action="./../../../VerifyUserLogin" method="post">
					<fieldset>
						<legend>Please, enter your email and password for login.</legend>
						<div class="input-block">
							<label for="login-email">E-mail</label> <input id="login-email"
								type="email" name="loginid" required>
						</div>
						<div class="input-block">
							<label for="login-password">Password</label> <input
								id="login-password" type="password" name="password" required>
						</div>
						<div class="remember-me">
							<label>Remember me</label>
							<input type = "checkbox" name = "rememberMe" value="true"/>
						</div>
					</fieldset>
					<input type="submit" class="btn-login" value="Login">

				</form>
				
				<form class="form form-login" action="./../../../VerifyUserLogin" method="post">
					<label>Login as Guest</label>
					<input type="submit" class="btn-login" name="GuestLogin" value="Guest">
				</form>



			</div>
			<div class="form-wrapper">
				<button type="button" class="switcher switcher-signup">
					Sign Up <span class="underline"></span>
				</button>
				
				<!-- Sign up section -->
				<form class="form form-signup" action="./../../../RegisterUser" method="post">
					<fieldset>
						<legend>Please, enter your email, password and password
							confirmation for sign up.</legend>
						<div class="input-block">
							<label for="signup-email">E-mail</label> <input id="login-email"
								type="email" name="loginid" required>
						</div>
						<div class="input-block">
							<label for="signup-password">Password</label> <input
								id="login-password" type="password" name="password" required>
						</div>
						<div class="input-block">
							<label for="signup-password-confirm">Confirm password</label> <input
								id="login-password" type="confirmPassword" name="confirmPassword" required>
						</div>
					</fieldset>
					<button type="submit" class="btn-signup">Register</button>
				</form>
			</div>
		</div>
		
			<div id="notification-box">
		<!-- if there is content in output, display notification box -->
		
<%
    // code params to determine err code / code
    String Code = request.getParameter("c");
    String output = "";
									
	// to determine color of alert box
	String color = "";
    
    // switch case to determine errcode present
    if(Code != null){
    	if(Code.equals("invalidLogin")){
    		output = "Invalid Username / Password. Please try again.";
    		color = "alert-danger";
    		System.out.println("Invalid Login");
    	}
    	
    	else if(Code.equals("ConnectionErr")){
    		output = "Error with connecting to SP Rentals. Please contact the administrator.";
    		color = "alert-danger";
    		System.out.println("Connection Error");
    	}
    	else if(Code.equals("invalidPassword")){
    		output = "Passwords do not match! Please try again.";
    		color = "alert-danger";
			System.out.println("Password no match");
    	}
    	else if(Code.equals("successful_registration")){
    		output = "User has successfully been registered. Please login.";
    		color = "alert-success";
			System.out.println("Successful registration");
    	}
    	else if(Code.equals("UserExists")){
    		output = "Username has already been taken! Please try again.";
    		color = "alert-warning";
			System.out.println("Username has already been taken");
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

<div class="alert <%=color %>" role="alert">
  <%=output %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
    }
%>


	</div>
		
	</section>
		</div>
		
		<div class="col">
			<%@ include file = "assets/library svg/artsvg.html" %>
		</div>
	</div>
	
</div>









	<script src="login.js"></script>

</body>
</html>