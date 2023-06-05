<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.Map"%>
<%@page import="dbDAO.UserDAO"%>

<%  
	String user = "";
	String role = "";
	
<<<<<<< HEAD
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
=======
	
	
	boolean rememberMe = false;
	
	Cookie[] cookies = request.getCookies();
	
	for(Cookie cookie: cookies){
		
		if(cookie.getName().equals("rememberMe")){
			if(cookie.getValue().equals("true")){
				rememberMe = true;
>>>>>>> ec2d21af04ef25932ee1c2d139ae4c0ec1affeaa
			}
            
		}
		
	}
	
	// if user has enabled remmeber me
	
	if (cookies != null && rememberMe == true) {
		System.out.println("Finding session ID");
    	for(Cookie cookie: cookies){
    		
    		if(cookie.getName().equals("session_id")){
    			// check if has value in session id
    			if(cookie.getValue().isEmpty() != true){
    				String session_id = cookie.getValue();
        			Map<String, String> userDetails = UserDAO.loadSession(session_id);
        			
        			// to query db about sesh id and link values
        			
        				user = userDetails.get("username");
                        role = userDetails.get("role");
                    if (user.isEmpty() != true || role.isEmpty() != true) {
                    	// check if has input from params
                    	
                    		System.out.println("Current logged by cookie : " + user);
                            
                            session.setAttribute("username",user);
                            session.setAttribute("role",role);

                            break;
                    		
                    	
                        
        			}
        			else{
        				response.sendRedirect("login.jsp");
        				break;
        			}
    			}else{
    				try{
    					user = session.getAttribute("username").toString();
        				role = session.getAttribute("role").toString();
    					
    				}catch(Exception ex){
    					System.out.println("login failed.");
    					response.sendRedirect("login.jsp");
    				}
    				
    				
    				
    				
    			}
    			
                
    		}
    		
    	}
	}


    
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<<<<<<< HEAD
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/library svg/test.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
=======
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/library svg/test.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
>>>>>>> ec2d21af04ef25932ee1c2d139ae4c0ec1affeaa

<!-- Ionicons -->
<script type="module"
	src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
<script nomodule
	src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />

<link rel="stylesheet" href="animations.css">


<<<<<<< HEAD
  <style>
    html,
    body {
      height: 100%;
      overflow-y: auto;
      
    }
=======
<link rel="stylesheet"
	href="../View(FrontEnd)/assets/css/animations.css">
<link rel="stylesheet" href="../View(FrontEnd)/assets/css/styles.css">
>>>>>>> ec2d21af04ef25932ee1c2d139ae4c0ec1affeaa


<style>
html, body {
	height: 100%;
}
</style>
</head>
<<<<<<< HEAD
<body class="bg-white">
<%@ include file = "assets/header/header.jsp" %>
=======
<body class="bg-black">
	<%@include file="assets/header/header.jsp"%>
>>>>>>> ec2d21af04ef25932ee1c2d139ae4c0ec1affeaa
	<div>
		Successfully logged in.
		<%=user %>
		<%=role %>

	</div>
<<<<<<< HEAD
	
	<!--  Book content starts here -->

<!--  
<div class="card-deck">
  <div class="card" style="width: 14rem;">
    <img class="card-img-top" src="..." alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card" style="width: 14rem;">
    <img class="card-img-top" src="..." alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card" style="width: 14rem;">
    <img class="card-img-top" src="..." alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>

-->


<div id="bookContainer" style="display:grid;">
<%@page import="java.sql.*" %>
<% 
try {
  // Establish a connection to the MySQL database
  Class.forName("com.mysql.jdbc.Driver");
	
  String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=Minecrafr@09&serverTimezone=UTC";
  
  Connection conn = DriverManager.getConnection(connURL);


  // Execute a SQL query to fetch book data from the MySQL database
  String query = "SELECT * FROM books";
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(query);
  
  // Iterate over the result set and display book data
  while (rs.next()) {
    String title = rs.getString("title");
    String author = rs.getString("author");
    String description = rs.getString("description");
    %>
    
   
    
<div class="card-deck">
  <div class="card" style="width: 14rem;">
    <img class="card-img-top" src="..." alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title"><%=title %></h5>
      <p class="card-text"><%=description %></p>
      <p class="card-text"><small class="text-muted"><%=author %></small></p>
    </div>
   </div>
    </div>
    <% 
  }
  
  // Close the database connection
  rs.close();
  stmt.close();
  conn.close();
} catch (ClassNotFoundException | SQLException e) {
  e.printStackTrace();
}
%>


</div>

%>


<!--  footer here -->
<div>
	<%@ include file = "assets/footer/footer.jsp" %>

</div>

=======
	<%@ include file="assets/footer/footer.jsp"%>
>>>>>>> ec2d21af04ef25932ee1c2d139ae4c0ec1affeaa
</body>
</html>