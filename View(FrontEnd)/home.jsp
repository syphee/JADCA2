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
						hasValidated = false;
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
<title>Insert title here</title>
</head>
<body>
	<div>
		Successfully logged in.
		<%=user %>
		<%=role %>

	</div>
</body>
</html>