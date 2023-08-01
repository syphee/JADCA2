<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dbDAO.UserDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbDAO.sqlPassword"%>

<%@ include file="../View(FrontEnd)/AdminPanel/scriplets/UserLoginValidation.jsp"%>

<%
// change your SQL password here
final String SQLpassword = sqlPassword.getSQLPassword();
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
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/styles.css">
<link rel="stylesheet"
	href="/CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/animations.css">
</head>
<body>
	<%@include file="assets/header/header.jsp"%>

	<div class="container ">
		<h1>My Profile        <ion-icon name="create-outline"></ion-icon>
     </h1>

     
		<form action="" method="post" class="row">

      <div class="col">
        <img class="dropdown-item"
        src="https://fastly.picsum.photos/id/875/536/354.jpg?hmac=5Jw472IJZn33I1eCcoJmhuUarHTXorHqkxdKx8iShQI"
        style="max-width: 500px;" /></img>



      </div>
      
      <div class="col justify-content-end ">

        <div class="row">
          <div class="form-group">
            <label for="firstName">First name</label> <input type="text"
              class="form-control" id="InputFName"
              placeholder="Enter your first name" value="<%=user%>"required>
          </div>
  
        </div>
        <div class="row">
          <div class="form-group">
            <label for="firstName">Last Name</label> <input type="text"
              class="form-control" id="InputFName"
              placeholder="Enter your first name" value="<%=user%>"required>
          </div>
  
        </div>



        <div class="row">
          <div class="form-group">
            <label for="firstName">Contact Number</label> <input type="text"
              class="form-control" id="InputFName"
              placeholder="Enter your first name" value="<%=user%>"required>
          </div>
  
        </div>

        <div class="row">
          <div class="form-group">
            <label for="firstName">Email</label> <input type="text"
              class="form-control" id="InputFName"
              placeholder="Enter your first name" value="<%=user%>"required>
          </div>
  
        </div>

      </div>

		</form>

    <div class="row">

      <!-- View favourites -->

      <div class="accordion-item col">
        <h2 class="accordion-header">
          <button class="accordion-button" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          View Favourites
        </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse "
          data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <strong>This is the first item's accordion body.</strong> It is shown by default,
            until the collapse plugin adds the appropriate classes that we use to style each
            element. These classes control the overall appearance, as well as the showing and
            hiding via CSS transitions. You can modify any of this with custom CSS or overriding
            our default variables. It's also worth noting that just about any HTML can go within
            the <code>.accordion-body</code>, though the transition does limit overflow.
          </div>
        </div>
      </div>


    <!-- View history transactions -->
    <div class="accordion-item col">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          View Transactions
        </button>
      </h2>
      <div id="collapseTwo" class="accordion-collapse collapse"
        data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>This is the second item's accordion body.</strong> It is hidden by default,
          until the collapse plugin adds the appropriate classes that we use to style each
          element. These classes control the overall appearance, as well as the showing and
          hiding via CSS transitions. You can modify any of this with custom CSS or overriding
          our default variables. It's also worth noting that just about any HTML can go within
          the <code>.accordion-body</code>, though the transition does limit overflow.
        </div>
      </div>
    </div>

    <!-- View available checkout codes -->
    <div class="accordion-item col">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          View checkout Codes
        </button>
      </h2>
      <div id="collapseThree" class="accordion-collapse collapse"
        data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>This is the third item's accordion body.</strong> It is hidden by default,
          until the collapse plugin adds the appropriate classes that we use to style each
          element. These classes control the overall appearance, as well as the showing and
          hiding via CSS transitions. You can modify any of this with custom CSS or overriding
          our default variables. It's also worth noting that just about any HTML can go within
          the <code>.accordion-body</code>, though the transition does limit overflow.
        </div>
      </div>
    </div>




  </div>

</div>


 

    </div>

	</div>


	<%@ include file="assets/footer/footer.jsp"%>
</body>
</html>
