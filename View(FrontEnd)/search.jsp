

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  imports here -->
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbDAO.sqlPassword"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="dbDAO.sqlPassword"%>

<%@ include file="../View(FrontEnd)/AdminPanel/scriplets/UserLoginValidation.jsp"%>



<%
// init cart function
ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");

int perPage = 16;

%>

<%
//change ur sql password here

	final String SQLpassword = sqlPassword.getSQLPassword();
String book_query = "";
String genre_query ="";
String author_query ="";
String sort_query ="";

String pagination = "" ;
int amtOfResults = 0;


String q1 ="";
String q2 = "";
String q3 = "";
String q4 ="";
try{

pagination = request.getParameter("page");
if(pagination == null){
	pagination = "0";
}



System.out.println("SEARCH.JSP - Current page number : " + pagination);
book_query = request.getParameter("s");
genre_query = request.getParameter("genre");
author_query = request.getParameter("author_query");
sort_query = request.getParameter("sortBy");

System.out.println("--------------");
System.out.println(book_query);
System.out.println(genre_query);
System.out.println(author_query);

if(book_query == null ){
	book_query = "";
	q3 = "and title LIKE CONCAT('%'," +  "\"" + book_query + "\"" +  " , '%')";
}else{
	
	q3 = "and title LIKE CONCAT('%'," +  "\"" + book_query + "\"" +  " , '%')";
	
}



// if default option
if(genre_query.equals("Select genre") || genre_query == "null"){
	genre_query = "";
}
else{
	q1 = "and genres.name = \"" + genre_query + "\"";
}

// else find book with specified genre


if(author_query == "null"  || author_query == ""){
	author_query = "";
}else{
	q2 = "and author LIKE CONCAT('%', " + "\"" + author_query  + "\"" + " , '%')";
}

if(sort_query.equals("popularity")){
	q4 = "ORDER BY rating DESC";
}else if(sort_query.equals("date_added")){
	q4 = "ORDER BY publication_date DESC";
}




//get number of books to determine offset value
// this is related to the pagination feature
try{
	//step 1 Load jdbc driver
	Class.forName("com.mysql.jdbc.Driver");

	//step 2 define URL connection
	String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

	//step 3 Establish connection
	Connection conn = DriverManager.getConnection(connURL);

	//Call routine
				String simpleProc = "SELECT COUNT(*) FROM books right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null " + q1 + " "+ q2 + " "+ q3  + " "+ q4;
				System.out.println("Final SQL Statement : " + simpleProc);
				//SELECT books.*, genres.name as genre
				//FROM books
				//right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null and genres.name = "Non-fiction" and author LIKE "%a";

				PreparedStatement cs = conn.prepareStatement(simpleProc);
				

				
				
				// Step 5: Execute SQL Command
				//String sqlStr = "SELECT * FROM member";         
				
				
				
				

	ResultSet rs = cs.executeQuery();

	while (rs.next()) {
		amtOfResults = rs.getInt("COUNT(*)");

	}
}catch(Exception ex){
	ex.printStackTrace();
}

System.out.println("Number of books found in DB : " + amtOfResults);



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

<link rel="stylesheet" href="animations.css">


<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/styles.css">
<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/animations.css">


<style type="text/css">
h2 {
	color: white;
	text-decoration: bold;
	text-size: 1rem;
}
</style>


</head>

<body class="bg-black" style="overflow-y: auto;">
	<%@include file="assets/messagePopUp.jsp"%>
	<%@include file="assets/header/header.jsp"%>

	<section class="container my-5  ">
		<h2>
		<%=amtOfResults %> books found <br/>
			Search results for :
			<%=book_query %>

			<%if(genre_query.trim().isBlank() != true){%>

			and genre :
			<%=genre_query %>

			<% 
}
%>

			<%if(author_query.trim().isBlank() != true){%>

			and author :
			<%=author_query %>

			<% 
}
%>

		</h2>


		<div class=" rounded-1 px-2 ">
			<ul class="row ">

				<%



//step 1 Load jdbc driver
Class.forName("com.mysql.jdbc.Driver");

//step 2 define URL connection
String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

//step 3 Establish connection
Connection conn = DriverManager.getConnection(connURL);

//Call routine
			String simpleProc = "SELECT books.*, genres.name as genre FROM books right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null " + q1 + " "+ q2 + " "+ q3  + " "+ q4 + " limit " + perPage +  " OFFSET ?";
			System.out.println("Final SQL Statement : " + simpleProc);
			//SELECT books.*, genres.name as genre
			//FROM books
			//right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null and genres.name = "Non-fiction" and author LIKE "%a";

			PreparedStatement cs = conn.prepareStatement(simpleProc);
			
			cs.setInt(1,Integer.parseInt(pagination)*perPage);
		
			
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			

ResultSet rs = cs.executeQuery();

while (rs.next()) {
	int id = rs.getInt("book_id");
	String title = rs.getString("title");
	String author = rs.getString("author");
	String genre = rs.getString("genre_id");
	String desc = rs.getString("description");
	String pictureURI = rs.getString("pic");
	int quantity = rs.getInt("quantity");
%>

				<%@include file="assets/bookCard.jsp"%>







				<%
}



}catch (Exception e) {
	out.println("Error : " + e);
	e.printStackTrace();
}



%>

			</ul>
		</div>
	</section>

	<div class="text-center container">
	<%

    if((Integer.parseInt(pagination)+1)*perPage <= amtOfResults ){
    %>
		<form method="post" action="search.jsp">
			<input type="submit" value="Next page" class="btn btn-danger" /> <input
				type="hidden" value="<%=Integer.parseInt(pagination)+1 %>" name="page" /> <input
				type="hidden" value="<%=request.getParameter("s") %>" name="s" /> <input
				type="hidden" value="<%=request.getParameter("genre") %>" name="genre" /> <input
				type="hidden" value="<%=request.getParameter("author_query") %>" name="author_query" /> <input
				type="hidden" value="<%=request.getParameter("sortBy") %>" name="sortBy" />
		</form>
	<%
    }
    %>
		<%

    if(Integer.parseInt(pagination) != 0){
    %>
		<form method="post" action="search.jsp">
			<input type="submit" value="Previous page" class="btn btn-danger" />
			<input type="hidden" value="<%=Integer.parseInt(pagination)-1 %>" name="page" /> <input
				type="hidden" value="<%=request.getParameter("s") %>" name="s" /> <input
				type="hidden" value="<%=request.getParameter("genre") %>" name="genre" /> <input
				type="hidden" value="<%=request.getParameter("author_query") %>" name="author_query" /> <input
				type="hidden" value="<%=request.getParameter("sortBy") %>" name="sortBy" />

		</form>

		<%
    }
    
	%>
	</div>

	<%@include file="assets/footer/footer.jsp"%>
</body>
</html>