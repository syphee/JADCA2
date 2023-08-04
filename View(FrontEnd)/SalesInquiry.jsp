<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.UserDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.sqlPassword"%>

<%@ include
	file="../View(FrontEnd)/AdminPanel/scriplets/UserLoginValidation.jsp"%>

<%
// change your SQL password here
final String SQLpassword = sqlPassword.getSQLPassword();

String URI = "";
%>

<%
// init cart function
ArrayList<String> shopping_cart;

shopping_cart = (ArrayList<String>) session.getAttribute("shopping_cart");

// get cart
// to setattribute shopping_cart again
if (shopping_cart == null) {
	response.sendRedirect("login.jsp");
}

if(role.equals("Guest") ){ 
	
	response.sendRedirect("home.jsp?c=false&m=You%20are%20not%20logged%20in!");
}


%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile Page</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
	
	<!--  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }
        h1 {
            color: #333;
            text-align: center;
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #fff;
            padding: 10px 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 60px; /* Adjust as needed */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e0e0e0;
        }
    </style>
	 -->
	
</head>
<body>
<body>
	<%@include file="assets/header/header.jsp"%>
	<%@include file="assets/messagePopUp.jsp"%>
	
	
	<h1>Choose Date Range</h1>

		<!-- wrap in form for Date pick -->
          <form action="<%=request.getContextPath()%>/DatePicker" method="post">
          
  <label for="startDate">Start Date</label>
  
  <input type="date" id="startDate" name="startDate">
  
  <label for="endDate">End date</label>
  <input type="date" id="endDate" name="endDate">
  
  <input type="submit">
  
  
  
  
</form>
	
	
	
	<%@ include file="assets/footer/footer.jsp"%>
	
</body>
	
</body>
</html>
