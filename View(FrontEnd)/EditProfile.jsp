<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="java.sql.*"%>
<%@page import="dbDAO.sqlPassword"%>


<%
//change ur sql password here
	final String SQLpassword = sqlPassword.getSQLPassword();
	
%>

<%
// init cart function
ArrayList<String> shopping_cart;

shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
// get cart

// to setattribute shopping_cart again
if(shopping_cart == null){
	response.sendRedirect("login.jsp");
}


%>

<%
String user = "";
String role = "";
String pic = "";

boolean rememberMe = false;

Cookie[] cookies = request.getCookies();

for (Cookie cookie : cookies) {

	if (cookie.getName().equals("rememberMe")) {
		if (cookie.getValue().equals("true")) {
	rememberMe = true;
		}

	}

}

// if user has enabled remmeber me
// login and save session id

if (cookies != null && rememberMe == true) {
	System.out.println("HOME.JSP - User has selected to remember me");
	System.out.println("HOME.JSP - Finding session ID");
	for (Cookie cookie : cookies) {

		if (cookie.getName().equals("session_id")) {
	// check if has value in session id
	if (cookie.getValue().isEmpty() != true) {
		String session_id = cookie.getValue();
		Map<String, String> userDetails = UserDAO.loadSession(session_id);

		// to query db about sesh id and link values

		user = userDetails.get("username");
		role = userDetails.get("role");
		if (user.isEmpty() != true || role.isEmpty() != true) {
			// check if has input from params

			System.out.println("Current logged by cookie : " + user);

			session.setAttribute("username", user);
			session.setAttribute("role", role);
			session.setAttribute("pic",pic);

			break;

		} else {
			response.sendRedirect("login.jsp");
			break;
		}
	} else {
		try {
			user = session.getAttribute("username").toString();
			role = session.getAttribute("role").toString();
			pic = session.getAttribute("pic").toString();

		} catch (Exception ex) {
			System.out.println("login failed.");
			response.sendRedirect("login.jsp");
		}

	}

		}

	}

	// if user decides not to use the rememberMe functionality
} else {
	System.out.println("HOME.JSP - User normal login");
	try {
		user = session.getAttribute("username").toString();
		role = session.getAttribute("role").toString();
		pic = session.getAttribute("pic").toString();

	} catch (Exception ex) {
		System.out.println("login failed.");
		response.sendRedirect("login.jsp");
	}
}
%>




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Page</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/library svg/test.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Ionicons -->
<script type="module"
	src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
<script nomodule
	src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />


<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/styles.css">
<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/animations.css">
</head>
<body">
<%@include file="assets/header/header.jsp"%>


   <div class="container">
    <h1>Profile Page</h1>
    <form onsubmit="event.preventDefault(); validateForm();">
      <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" class="form-control" id="InputFName" placeholder="Enter your first name" required>
      </div>
      <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" class="form-control" id="InputLName" placeholder="Enter your last name" required>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="InputEmail" placeholder="Enter your email" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" class="form-control" id="InputPassword" placeholder="Enter your password" required>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
  <%
  String Fname = request.getParameter("InputFName");
  String Lname = request.getParameter("InputLName");
  String NewEmail = request.getParameter("InputEmail");  
  String NewPassword = request.getParameter("InputPassword");
	//connecting to database to get the details first
	

try {
	
	//step 1 Load jdbc driver
	Class.forName("com.mysql.jdbc.Driver");

	//step 2 define URL connection
	String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

	//step 3 Establish connection
	Connection conn = DriverManager.getConnection(connURL);
	
	//step 4 create prepared statement + ResultSet
	PreparedStatement stmt = conn.prepareStatement("UPDATE users SET password = ? , first_name = ?, last_name = ? WHERE userid = ?;");
 
	ResultSet rs = stmt.executeQuery();
	
	 stmt.setString(1, NewPassword);
	 stmt.setString(2, Fname);
	 stmt.setString(3, Lname);
	
	int rowsUpdated = stmt.executeUpdate();
	
	 if (rowsUpdated > 0) {
	        // Profile updated successfully
	        // You can display a success message or redirect the user to another page
	        response.sendRedirect("profile.jsp");
	    } else {
	        // Failed to update profile
	        // You can display an error message or redirect the user to another page
	        response.sendRedirect("error.jsp");
	    }
	
	

	
} catch (Exception e) {
	out.println("Error : " + e);
}
  
  
  %>
  
  
  
  
  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
  
 <%@ include file="assets/footer/footer.jsp"%>
  
  
</body>
</html>





 