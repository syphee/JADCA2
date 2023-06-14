<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="java.sql.*"%>

<%
String genreId = request.getParameter("genreId");

//change ur sql password here
	final String SQLpassword = "Minecrafr@09";
%>

<%
// init cart function
ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");


%>
<%
String user = "";
String role = "";
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

			break;

		} else {
			response.sendRedirect("login.jsp");
			break;
		}
	} else {
		try {
			user = session.getAttribute("username").toString();
			role = session.getAttribute("role").toString();

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

	} catch (Exception ex) {
		System.out.println("login failed.");
		response.sendRedirect("login.jsp");
	}
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap -->
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
<body class="bg-black" style="overflow-y; height:100%;">
	<%@include file="assets/messagePopUp.jsp"%>
	
	<%@include file="assets/header/header.jsp"%>
	
<div class="container wrapper">

	
			<section class="container my-5 ">
    <h1 class="text-white fs-1">Select Genre to filter</h1>
		<div class="pull-right">
				<a href="genre.jsp">
				<button class="btn btn-small btn-primary" >
					All
				</button>
				</a>
				
				<a href="genre.jsp?genreId=1">
				<button class="btn btn-small btn-primary" >
					Adventure
				</button>
				</a>
				
				<a href="genre.jsp?genreId=2">
				<button class="btn btn-small btn-primary" >
					Romance
				</button>
				</a>
				
				<a href="genre.jsp?genreId=3">
				<button class="btn btn-small btn-primary" >
					Action
				</button>
				</a>
				
			</div>
    <div class=" rounded-1 px-2 ">
      <ul class="row ">
		<%
		//connecting to database to get the details first

		try {

			//step 1 Load jdbc driver
			Class.forName("com.mysql.jdbc.Driver");

			//step 2 define URL connection
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

			//step 3 Establish connection
			Connection conn = DriverManager.getConnection(connURL);

			//step 4 create prepared statement + ResultSet
			PreparedStatement stmt;
			ResultSet rs;
			
			if (genreId == null) {
				stmt = conn.prepareStatement("Select * from books");
				
			} else {
				stmt = conn.prepareStatement("Select * from books where genre_id = ?");
				stmt.setString(1,genreId);
			}
			
			rs = stmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("book_id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String genre = rs.getString("genre_id");
				String pictureURI = rs.getString("pic");
				String desc = rs.getString("description");
		%>
		<%@include file="assets/bookCard.jsp"%>
		


		<%
		}
			
			rs.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
		out.print("Error : " + e);
		}
		%>




		</ul>

	</div>
	<hr class="bg-danger my-1 opacity-100">
	</section>

</div>

<%@ include file="assets/footer/footer.jsp"%>
</body>
</html>