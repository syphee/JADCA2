

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!--  imports here -->
<%@page import="java.sql.*"%>
<%@page import="dbDAO.sqlPassword"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ include file="../View(FrontEnd)/AdminPanel/scriplets/UserLoginValidation.jsp"%>


<%
//change ur sql password here
	final String SQLpassword = sqlPassword.getSQLPassword();
	
%>

<%
ArrayList<String> shopping_cart = new ArrayList<String>();
int PARSED_viewed_book = 0;


try{
	shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
    
    System.out.println("Shopping cart size : " + shopping_cart.size());

}catch(Exception ex){
    ex.printStackTrace();
}

%>


<%


String viewed_book = request.getParameter("view");
ArrayList<String> recently_viewed = new ArrayList<String>();
ArrayList<String> temp_array_cache = new ArrayList<String>();


try{
	shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
    recently_viewed = (ArrayList<String>) session.getAttribute("recently_viewed");
    
    System.out.println("Shopping cart size : " + shopping_cart.size());

}catch(Exception ex){
    ex.printStackTrace();
}

// max to display is 3, this is adjustable
if(recently_viewed.size() > 2){
	
    // remove last index before pushing
    recently_viewed.remove(recently_viewed.size()-1);

    // shift the 2 items by +1 to make way for the latest viewed

    // store them first into a temp arraylist
    for(int j = 0 ; j < recently_viewed.size() ; j++){
        temp_array_cache.add(recently_viewed.get(j));
    }

    // remove all indexes of recently viewed
    recently_viewed.clear();

    // then add the new book
    recently_viewed.add(viewed_book);

    // then add the stored books
    recently_viewed.addAll(temp_array_cache);
    session.setAttribute("recently_viewed",recently_viewed);
    // clear the cache
    temp_array_cache.clear();

}else{
    recently_viewed.add(viewed_book);
    session.setAttribute("recently_viewed",recently_viewed);
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
String book_query = "";
try{

book_query = request.getParameter("view");

int PARSED_book_query = Integer.parseInt(book_query);

//step 1 Load jdbc driver
Class.forName("com.mysql.jdbc.Driver");

//step 2 define URL connection
String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

//step 3 Establish connection
Connection conn = DriverManager.getConnection(connURL);

//Call routine
			String simpleProc = "SELECT * from books where book_id = ? ";
			PreparedStatement cs = conn.prepareStatement(simpleProc);

			// insert book values
			cs.setInt(1, PARSED_book_query);
			

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
conn.close();



}catch (Exception e) {
	System.out.println(e);
	//response.sendRedirect("home.jsp?c=false&m=Error%20loading%20book%20details.%20Please%20contact%20the%20System%20Administrator.");
}

%>


<%@include file="assets/footer/footer.jsp" %>
</body>
</html>