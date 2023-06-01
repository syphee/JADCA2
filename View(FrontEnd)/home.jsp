<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%  

    String user = (String)session.getAttribute("username");
    String role = (String)session.getAttribute("role");
    Cookie[] cookies = request.getCookies();
    
    // to determine whether a rememberMe cookie should be created
    boolean hasValidated = true;
	
    // check if user has bypassed login
    
    if(user != null || role != null){
        // set cookie if user has requested to remember user
        if (session.getAttribute("rememberMe") != null) {
    	    String username = user; // Replace with the actual username
    	    
    	    // check if the cookie has already been made
    	    
			if (cookies != null) {
			    for (Cookie cookie : cookies) {
			    	
			    	// to find the rememberMe cookie, and if exists, do not overwrite again
			        if (cookie.getName().equals("rememberMe")) {
			        	
			        	// to check if cookie matches the newly logged in user credentials, then override the cookie
			        	// session.getAttribute("rememberMe") is the username stored in the cookie,
			        	// user is the newly logged in user
			        	
			        	// if the same user has logged in , cookie will not overwrite
			        	if(user.equals(session.getAttribute("rememberMe")) != true){
			        		hasValidated = true;
			        	}else{
							hasValidated = false;
			        	}
			        	

			        }
			    }
			}
    	    
    	    // if rememberMe cookie has expired / has not been created
    	    
    	    if(hasValidated == true){
        	    Cookie rememberMeCookie = new Cookie("rememberMe", username);
        	    rememberMeCookie.setMaxAge(60); // Cookie expires in 30 days - 30 * 24 * 60 * 60 ( 1 minute for now for production purposes)
        	    response.addCookie(rememberMeCookie);
	
    	    }else{
    	    	System.out.println("Cookie has already been made once! Waiting for expiry");
    	    }

    	    		
    	}
    	
    }else{
    	// redirect back to login if bypassed
    	response.sendRedirect("login.jsp");
    }

    
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/library svg/test.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Ionicons -->
  <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
  <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />

  <link rel="stylesheet" href="animations.css">
  
  
  <link rel="stylesheet" href="../View(FrontEnd)/assets/css/animations.css">
  <link rel="stylesheet" href="../View(FrontEnd)/assets/css/styles.css">


  <style>
    html,
    body {
      height: 100%;
      
    }

  </style>
</head>
<body class="bg-black">
<%@ include file = "assets/header/header.jsp" %>
	<div>
		Successfully logged in.
		<%=user %>
		<%=role %>

	</div>
	<%@ include file = "assets/footer/footer.jsp" %>
</body>
</html>