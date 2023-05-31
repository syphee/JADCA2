<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/library svg/test.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Ionicons -->
  <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
  <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />

  <link rel="stylesheet" href="animations.css">
  <link rel="stylesheet" href="styles.css">

  <style>
    html,
    body {
      height: 100%;
    }

  </style>
</head>

<body>

  <nav class=" text-focus-in container">
    <header class="text-center fs-1 ">
      <a href="#" class="text-dark px-4 "><text class="text-white bg-danger px-1 rounded-1 ">SP</text> <text class="border-start border-dark mx-2 "></text> A R K.</text></a>
      
    </header>

    <div class="row">

      <!-- Buttons -->
      <ul class="nav justify-content-center col ">
        <li class="nav-item mb-0 mx-1 my-0 ">
          <a class="nav-link text-black fw-semibold hover-underline-animation  " href="index.html">Genres</a>
        </li>
        <li class="nav-item mb-0 mx-1  my-0">
          <a class="nav-link text-black fw-semibold hover-underline-animation" href="my_life.html">Whats new</a>
        </li>
        <li class="nav-item mb-0 mx-1  my-0">
          <a class="nav-link text-black fw-semibold hover-underline-animation" href="my_career.html">Popular</a>
        </li>

      </ul>

      <!-- Search bar -->
      <ul class="nav justify-content-end col">
        <li class="nav-item mb-0  my-0 d-flex flex-row align-items-end flex-row-reverse ms-1 g-col-6 ">
          <ion-icon name="search-outline" class="fs-1"></ion-icon>
          <input type="text" class="form-control" placeholder="Search" aria-label="Username"aria-describedby="basic-addon1">
        </li>

        <li class="ms-5">
          <div class="dropdown">
            <button class="btn btn-danger dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              Hello , <%=user %>
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">My profile</a></li>
              <li><a class="dropdown-item" href="#">My rentals</a></li>
              <li><hr class="dropdown-divider"></li>
              <li>
              		<!-- Log out -->
	              <form action="./../../../InvalidateSession" method="post">
	              	<input type="submit" class="dropdown-item" value="Log out">
	              </form>
              </li>
              
              
              <!-- Variables "role" and "user" are already inherited since header.jsp is called under home.jsp. No need to declare them again. Ignore the errors. -->
			    <%

				if(role.equals("admin")){
					%>
				<li><a class="dropdown-item" href="#">Admin Panel</a></li>
				
				<%} %>
				
            </ul>
          </div>
        </li>


      </ul>
    </div>



  </nav>
  <hr class="border border-danger border-2 opacity-100">



</body>

</html>