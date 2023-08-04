<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="dbDAO.sqlPassword"%>
<%@page import="java.sql.*"%>

<%
//change ur sql password here
final String SQLpassword = sqlPassword.getSQLPassword();
%>

<%@ include file="../View(FrontEnd)/AdminPanel/scriplets/UserLoginValidation.jsp"%>


<%
// init cart function
ArrayList<String> shopping_cart =  new ArrayList<String>();
ArrayList<String> recently_viewed = new ArrayList<String>();

try{
	shopping_cart = (ArrayList) session.getAttribute("shopping_cart");
	recently_viewed = (ArrayList) session.getAttribute("recently_viewed");
	
}catch(Exception ex){
	ex.printStackTrace();
}

// get cart

// to setattribute shopping_cart again
if (shopping_cart == null ) {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>

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
	href="/jadca2_jadca2/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/styles.css">
<link rel="stylesheet"
	href="/jadca2_jadca2/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/animations.css">

</head>
<body class="bg-black" style="overflow-y: auto;">
	<%@include file="assets/messagePopUp.jsp"%>

	<%@include file="assets/header/header.jsp"%>


	<section class="container my-5  ">
		<h1 class="text-white fs-1">Whats new</h1>

		<div class=" rounded-1 px-2 ">
			<ul class="row ">
				<%
				//connecting to database to get the details first

				try {

					//step 1 Load jdbc driver
					Class.forName("com.mysql.jdbc.Driver");

					//step 2 define URL connection
					String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

					//step 3 Establish connection
					Connection conn = DriverManager.getConnection(connURL);

					//step 4 create prepared statement + ResultSet
					PreparedStatement stmt = conn.prepareStatement("select * from books  ORDER BY publication_date DESC LIMIT 3");

					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						int id = rs.getInt("book_id");
						String title = rs.getString("title");
						String author = rs.getString("author");
						String genre = rs.getString("genre_id");
						String pictureURI = rs.getString("pic");
						String desc = rs.getString("description");
						int quantity = rs.getInt("quantity");
				%>

				<%@include file="assets/bookCard.jsp"%>




				<%
				}
					conn.close();

				} catch (Exception e) {
				out.print("Error : " + e);
				}
				%>




			</ul>

		</div>
		<hr class="bg-danger my-1 opacity-100">
		<h1 class="text-white fs-1">Whats popular</h1>
		<div class=" rounded-1 px-2 ">
			<ul class="row ">
				<%
				//connecting to database to get the details first

				try {

					//step 1 Load jdbc driver
					Class.forName("com.mysql.jdbc.Driver");

					//step 2 define URL connection
					String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

					//step 3 Establish connection
					Connection conn = DriverManager.getConnection(connURL);

					//step 4 create prepared statement + ResultSet
					PreparedStatement stmt = conn.prepareStatement("select * from books  ORDER BY rating DESC LIMIT 3");

					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {

						int id = rs.getInt("book_id");
						String title = rs.getString("title");
						String author = rs.getString("author");
						String genre = rs.getString("genre_id");
						String pictureURI = rs.getString("pic");
						String desc = rs.getString("description");
						int quantity = rs.getInt("quantity");
				%>
				<%@include file="assets/bookCard.jsp"%>



				<%
				}
					conn.close();

				} catch (Exception e) {
				out.print("Error : " + e);
				}
				%>




			</ul>

		</div>
		<hr class="bg-danger my-1 opacity-100">
		<h1 class="text-white fs-1">Recently viewed</h1>
		<div class=" rounded-1 px-2 ">
			<ul class="row ">
			<!-- go thru shopping cart, then query -->
				<%
				//connecting to database to get the details first
				
				try{
					for (String a : recently_viewed) {
						System.out.println("recently viewed : " + recently_viewed.indexOf(a));
					//step 1 Load jdbc driver
					Class.forName("com.mysql.jdbc.Driver");

					//step 2 define URL connection
					String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

					//step 3 Establish connection
					Connection conn = DriverManager.getConnection(connURL);

					//step 4 create prepared statement + ResultSet
					PreparedStatement stmt = conn.prepareStatement("select * from books where book_id = ?");
					
					stmt.setInt(1, Integer.parseInt(a));
					
					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						int id = rs.getInt("book_id");
						String title = rs.getString("title");
						String author = rs.getString("author");
						String genre = rs.getString("genre_id");
						String pictureURI = rs.getString("pic");
						String desc = rs.getString("description");
						int quantity = rs.getInt("quantity");
				%>
				<%@include file="assets/bookCard.jsp"%>



				<%
				
				}
					
					conn.close();}
					
				
				} catch (Exception e) {
				out.print("Error : " + e);
				}
				%>




			</ul>

		</div>
	</section>




	<%@ include file="assets/footer/footer.jsp"%>

</body>
</html>
