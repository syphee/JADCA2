<%	
String user = "";
String role = "";
String pic = "";



try {
			user = session.getAttribute("username").toString();
			role = session.getAttribute("role").toString();
			pic = session.getAttribute("pic").toString();

		} catch (Exception ex) {
			System.out.println("login failed.");
			response.sendRedirect("login.jsp");
		}
%>

<%
//change ur sql password here
	final String SQLpassword = "Minecrafr@09";
	
%>
<%
// init cart function
ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");


%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!--  imports here -->
<%@page import="java.sql.*"%>


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

<link rel="stylesheet" href="animations.css">


<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/styles.css">
<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/animations.css">


<style type="text/css">

h2 {
color:white;
text-decoration: bold;
text-size: 1rem;
}

</style>


</head>

<body class="bg-black">
	<%@include file="assets/header/header.jsp" %>
	<%@include file="assets/messagePopUp.jsp"%>

<h2>Hello There this is to show that it works.</h2>

<%
try{

String book_query = request.getParameter("s");


//step 1 Load jdbc driver
Class.forName("com.mysql.jdbc.Driver");

//step 2 define URL connection
String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

//step 3 Establish connection
Connection conn = DriverManager.getConnection(connURL);

//Call routine
			String simpleProc = "{ call selectBookByTitle(?) }";
			CallableStatement cs = conn.prepareCall(simpleProc);

			// insert book values
			cs.setString(1, book_query);
			
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			

ResultSet rs = cs.executeQuery();

while (rs.next()) {
	int id = rs.getInt("book_id");
	String title = rs.getString("title");
	String author = rs.getString("author");
	String genre = rs.getString("genre_id");
	String desc = rs.getString("description");
%>


<h2>Book ID: <%=id %> <br> 
Book title:  <%=title%> <br>
 Authored by: <%=author %> <br>
 Synopsis: <%= desc %> <br>
Genre: <%=genre %> </h2>

<%
}



}catch (Exception e) {
	out.println("Error : " + e);
}

%>


<%@include file="assets/footer/footer.jsp" %>
</body>
</html>