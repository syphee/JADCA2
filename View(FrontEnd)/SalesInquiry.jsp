<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.UserDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.sqlPassword"%>
<%@ page import="model.Sales" %>
<%@ page import="model.SalesDAO" %>


	<%@ include
	file="../View(FrontEnd)/AdminPanel/scriplets/AdminLoginValidation.jsp"%>

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

/* 
if(role.equals("Guest") ){ 
	
	response.sendRedirect("home.jsp?c=false&m=You%20are%20not%20logged%20in!");
} */


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
	
	  <style>
	  
    .table-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 40px; /* Increase the margin to create more separation */
        	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); /* Add a subtle shadow */
        	border-radius: 10px; /* Round the corners */
        	border: 2px solid #f2f2f2; /* Add a border for contrast */
        	}

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            padding: 12px; 
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            background-color: #f8f8f8; /* Slightly different background color for headers */
        	font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
            background-color: #f2f2f2;
        }
        
         .center-fuck {
        text-align: center;
        margin-top: 20px; /* Adjust margin as needed */
    }
    
    .button-49,
.button-49:after {
  width: 150px;
  height: 76px;
  line-height: 78px;
  font-size: 20px;
  font-family: 'Bebas Neue', sans-serif;
  background: linear-gradient(45deg, transparent 5%, #FF013C 5%);
  border: 0;
  color: #fff;
  letter-spacing: 3px;
  box-shadow: 6px 0px 0px #00E6F6;
  outline: transparent;
  position: relative;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-49:after {
  --slice-0: inset(50% 50% 50% 50%);
  --slice-1: inset(80% -6px 0 0);
  --slice-2: inset(50% -6px 30% 0);
  --slice-3: inset(10% -6px 85% 0);
  --slice-4: inset(40% -6px 43% 0);
  --slice-5: inset(80% -6px 5% 0);
  
  content: 'ALTERNATE TEXT';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(45deg, transparent 3%, #00E6F6 3%, #00E6F6 5%, #FF013C 5%);
  text-shadow: -3px -3px 0px #F8F005, 3px 3px 0px #00E6F6;
  clip-path: var(--slice-0);
}

.button-49:hover:after {
  animation: 1s glitch;
  animation-timing-function: steps(2, end);
}

@keyframes glitch {
  0% {
    clip-path: var(--slice-1);
    transform: translate(-20px, -10px);
  }
  10% {
    clip-path: var(--slice-3);
    transform: translate(10px, 10px);
  }
  20% {
    clip-path: var(--slice-1);
    transform: translate(-10px, 10px);
  }
  30% {
    clip-path: var(--slice-3);
    transform: translate(0px, 5px);
  }
  40% {
    clip-path: var(--slice-2);
    transform: translate(-5px, 0px);
  }
  50% {
    clip-path: var(--slice-3);
    transform: translate(5px, 0px);
  }
  60% {
    clip-path: var(--slice-4);
    transform: translate(5px, 10px);
  }
  70% {
    clip-path: var(--slice-2);
    transform: translate(-10px, 10px);
  }
  80% {
    clip-path: var(--slice-5);
    transform: translate(20px, -10px);
  }
  90% {
    clip-path: var(--slice-1);
    transform: translate(-10px, 0px);
  }
  100% {
    clip-path: var(--slice-1);
    transform: translate(0);
  }
}

@media (min-width: 768px) {
  .button-49,
  .button-49:after {
    width: 200px;
    height: 86px;
    line-height: 88px;
  }
}
        
        
    </style>

	
</head>
<body>
<body>
	<%@include file="assets/header/header.jsp"%>
	<%@include file="assets/messagePopUp.jsp"%>
		
	
	<!--  do the date range later -->
	<!--  for now just get the data to display -->
<%-- 	<h1>Choose Date Range</h1>

		<!-- wrap in form for Date pick -->
          <form action="<%=request.getContextPath()%>/DatePicker" method="post">
          
  <label for="startDate">Start Date</label>
  
  <input type="date" id="startDate" name="startDate">
  
  <label for="endDate">End date</label>
  <input type="date" id="endDate" name="endDate">
  
  <input type="submit">
  
  
</form> --%>

<!--  dynamic table display for sales history -->
<div class="table-container">
<table>
    <tr>
        <th>Order ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Order Date</th>
        <th>Total Amount</th>
    </tr>
    	
    <%
   /*     @SuppressWarnings("unchecked")
   	 ArrayList<Sales> salesList = (ArrayList<Sales>) session.getAttribute("salesList"); */
		  
		  try {
		         // Calling the data access object
	            SalesDAO salesDAO = new SalesDAO();
	            ArrayList<Sales> salesList = salesDAO.getSales();
		  
		  
          
        if (salesList != null) {
            for (int i = 0; i < salesList.size(); i++) {
    %>
    <tr>
        <td><%= salesList.get(i).getOrderid() %></td>
        <td><%= salesList.get(i).getFirstname() %></td>
        <td><%= salesList.get(i).getLastname() %></td>
        <td><%= salesList.get(i).getOrderdate() %></td>
        <td><%= salesList.get(i).getTotalamount() %></td>
      
        
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="5">No sales data available.</td>
    </tr>
    <%
    
    	out.println("data no print i am sad for REAL");
        }
        
        
	        } catch (Exception e) {
	            out.println("An error occurred: " + e.getMessage());
	        }
	    %>
    
</table>
</div>

<!-- button click -->
<!-- wrap in div -->

<form action="<%= request.getContextPath()%>/TopSalesServlet" method="post">
<div class="center-fuck">
<button class="button-49" role="button">Press for Top 10</button>
</div>
</form>

<% 
    ArrayList<Sales> topSalesList = (ArrayList<Sales>) session.getAttribute("topSalesList");
    if (topSalesList != null && !topSalesList.isEmpty()) {
%>


<div class="center-fuck">
<h2>Top 10 Sales</h2>
</div>

<div class="center-fuck">
<a href="<%= request.getContextPath() %>/DownloadPDFServlet?filePath=<%= session.getAttribute("topSalesPDFFilePath") %>">
    Download Top Sales PDF
</a>
</div>
<div class="table-container">

<table>
    <tr>
        <th>Order ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Order Date</th>
        <th>Total Amount</th>
    </tr>
    <% 
        for (Sales sale : topSalesList) {
    %>
    <tr>
        <td><%= sale.getOrderid() %></td>
        <td><%= sale.getFirstname() %></td>
        <td><%= sale.getLastname() %></td>
        <td><%= sale.getOrderdate() %></td>
        <td><%= sale.getTotalamount() %></td>
    </tr>
    <% 
        }
    %>
</table>
<% 
    }
%>
</div>


	
	
	
	<%@ include file="assets/footer/footer.jsp"%>
	
</body>
	
</body>
</html>
