<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String role = "";
String user = "";
try{
	user = session.getAttribute("username").toString();
	role = session.getAttribute("role").toString();
	if(role.equals("admin") != true || role == null){
		System.out.println("No permissions!");
		response.sendRedirect("home.jsp");
	}
	
}catch(Exception ex){
	System.out.println("No permissions!");
	response.sendRedirect("home.jsp");
}

%>

<%
String URI = "";
%>
<!DOCTYPE html>
<html lang="en">
<!-- To add cookie / role scriptlet validation here -->

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

  <link rel="stylesheet" href="../View(FrontEnd)/assets/css/styles.css">
  <link rel="stylesheet" href="../View(FrontEnd)/assets/css/animations.css">

  <style>
    html,
    body {
      height: 100%;
      overflow: auto;

    }
  </style>
</head>

<body>
  <div class="container-fluid accordion">
    <div class="row flex-nowrap ">
      <!-- Sidenav -->
      <div class="col-sm-2 col-auto px-0 collapse collapse-horizontal overflow-hidden " id="sidebar">
        <div class="list-group border-0 text-center text-sm-start min-vh-100 accordion" id="sidebar-menu">

          <!-- Sidenav content -->
          <div href="#" class="list-group-item border-0 d-inline-block text-truncate" data-bs-parent="#sidebar">
            <header class="text-center fs-1 ">
              <a href="#" class="text-dark px-4 "><text class="text-white bg-danger px-1 rounded-1 ">SP</text> <text
                  class="border-start border-dark mx-2 "></text class="fw-bold"> A R K.</text></a>
              <h1>Admin Panel</h1>
            </header>
          </div>

          <div class="container">
            <hr class="bg-body-secondary my-1 opacity-100">

            <!-- Panel buttons -->
            <div class="text-center " id="accordionExample">


              <!-- Dashboard -->
              <div class="accordion-body">
                <button
                  class="btn btn-toggle align-items-center rounded hover-underline-animation text-black collapsed text-center"
                  type="button" data-bs-toggle="collapse" data-bs-target="#manageDashboard" aria-expanded="false"
                  aria-controls="collapseThree">
                  Dashboard
                </button>
              </div>



              <div>
                <div class=" border-0 ">


                  <hr class="bg-body-secondary my-1 opacity-100">

                  <!-- Manage Books -->
                  <div>
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#manageBooks" aria-expanded="false" aria-controls="collapseThree">
                        Manage Books
                      </button>
                    </h2>
                    <div id="manageBooks" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark" data-bs-toggle="collapse"
                              data-bs-target="#addBook">Add</a></li>
                          <li class="my-4 link-hover" data-bs-toggle="collapse" data-bs-target="#editBook"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Edit </a></li>
                          <li class="my-4 link-hover" data-bs-toggle="collapse" data-bs-target="#deleteBook"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Delete</a></li>
                          <hr class="bg-dark my-1 opacity-100">

                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>


              <!-- Manage User -->
              <div>
                <div class="accordion border-0 " id="accordionExample">

                  <div class="">
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#manageUser" aria-expanded="false" aria-controls="collapseThree">
                        Manage User
                      </button>
                    </h2>
                    <div id="manageUser" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark" data-bs-toggle="collapse"
                              data-bs-target="#addUser">Add</a></li>
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark" data-bs-toggle="collapse"
                              data-bs-target="#editUser">Edit </a></li>
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark" data-bs-toggle="collapse"
                              data-bs-target="#deleteUser">Delete</a></li>
                          <hr class="bg-dark my-1 opacity-100">

                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Manage Inventory -->
              <div>
                <div class="accordion border-0 " id="accordionExample">

                  <div class="">
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#manageInventory" aria-expanded="false" aria-controls="collapseThree">
                        Manage Inventory
                      </button>
                    </h2>
                    <div id="manageInventory" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Add</a></li>
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Edit </a></li>
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Delete</a></li>
                          <hr class="bg-dark my-1 opacity-100">

                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Manage rentals -->
              <div>
                <div class="accordion border-0 " id="accordionExample">

                  <div class="">
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#manageRentals" aria-expanded="false" aria-controls="collapseThree">
                        Manage Rentals
                      </button>
                    </h2>
                    <div id="manageRentals" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                      <div class="accordion-body">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Add</a></li>
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Edit </a></li>
                          <li class="my-4 link-hover"><a href="#"
                              class="link-dark rounded hover-underline-animation text-dark">Delete</a></li>
                          <hr class="bg-dark my-1 opacity-100">

                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>



            </div>

          </div>


        </div>

      </div>


      <main class="col-sm col border-start ps-md-2 pt-2">
        <div class=" mx-0">
          <div class="row">
            <div class="col">

              <!-- hamburger icon -->
              <button href="#" data-bs-target="#sidebar" data-bs-toggle="collapse"
                class="btn rounded-3 p-1 my-0 fs-3 text-decoration-none">
                <ion-icon name="menu-outline"></ion-icon>
              </button>

            </div>
            <div class="col">
              <div class="dropdown text-end">
                <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  Welcome back , <%=user %>
                </button>
                <ul class="dropdown-menu align-items-center justify-content-center">
                  <li><img class="dropdown-item" href="#"
                      src="https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg"
                      style="max-width: 100px;"></img></li>
                  <li><text class="dropdown-item" href="#"><%=user %></text></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li><a class="dropdown-item" href="#">Manage Account</a></li>
                  <li><a class="dropdown-item" href="#">Help</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li><a class="dropdown-item" href="home.jsp">Exit Admin Panel</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li><form action="./../../../InvalidateSession" method="post">
	              	<input type="submit" class="dropdown-item" value="Log out">
	              </form></li>
                </ul>
              </div>

            </div>
          </div>
        </div>

        <!-- Content Main Panel -->
        <hr class="bg-secondary my-1 opacity-100">
        <div id="arkCONTENT" class="accordion">
          <!-- Dashboard -->
          <div class="row text-center accordion-body accordion-collapse collapse show" id="manageDashboard"
            data-bs-parent="#arkCONTENT">
            <header>
              <h1>Dashboard</h1>
            </header>
            <div class="col">
              a
            </div>
            <div class="col">
              b
            </div>
            <div class="col">
              c
            </div>
            <div class="col">
              d
            </div>
            <div class="col">
              e
            </div>
            <div class="col">
              f
            </div>
          </div>


          <!-- Manage Books -->

          <!-- https://www.javatpoint.com/java-io -->
          <!-- Link for reference, to upload / get img -->

          <!-- Add Book -->
          <!-- To add form here -->
          <div class="accordion-body accordion-collapse collapse border" id="addBook" data-bs-parent="#arkCONTENT">
            <div>
              <header>
                <h1 class="fs-1">Add Book</h1>
              </header>
                <hr class="bg-secondary my-1 opacity-100">
    
                <div class="container col align-items-center">
                <form action="<%= request.getContextPath()%>/addBook" name="form1" method="post" enctype="multipart/form-data">
                <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Picture
                    </div>
                    <div class="col">
                      <input type="file" name="file" onChange="previewImage(event)" accept="image/*"/>
                      <img src="<%= request.getContextPath()%>/assets/<%=URI%>" id="preview" style="max-width:100px;"/>
                    </div>
                  </div>
                  
                  <!-- Title -->
                  <div class="row my-5">
                    <div class="col">
                      Title
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Title" id="floatingTextarea">
                    </div>
                  </div>
                  <!-- Author -->
                  <div class="row my-5">
                    <div class="col">
                      Author
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Author" id="floatingTextarea">
                    </div>
                  </div>
    
                  <!-- Details -->
                  <!-- To show display of number of characters -->
                  <div class="row my-5">
                    <div class="col">
                      Description
                    </div>
                    <div class="col">
                      <textarea class="form-control" placeholder="Add a description for the book here"
                        id="floatingTextarea2" style="height: 100px" style="resize: none;" maxlength="255" onchange="countText()"></textarea>
                      <span class="pull-right label label-default" id="count_message"></span>
                      
                    </div>
                  </div>
    
                  <div class="row my-5">
                    <div class="col">
                      Price
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="$" id="floatingTextarea">
                    </div>
                  </div>
    
                  <div class="row my-5">
                    <div class="col">
                      ISBN Code
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="ISBN-13" id="floatingTextarea">
                    </div>
                  </div>
    
                  <div class="row  my-5">
                    <div class="col">
                      Genre
                    </div>
                   
                    <!-- To autofill using JSP -->
                    <div class="dropdown col">
                      <div class="row mx-1">
                        <a class="btn btn-danger dropdown-toggle col-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Select genre
                        </a>
                      
                        <ul class="dropdown-menu ">
                          <li><a class="dropdown-item" href="#">Action</a></li>
                          <li><a class="dropdown-item" href="#">Another action</a></li>
                          <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
      
                        <div class="col-6">
                          test
                        </div>
    
                      </div>
                      
                    </div>
                    
                  </div>
                  <div>
                  <input type="submit" name="btnSubmit" value="AddBook" class="btn btn-primary">
    
                </div>
                  
					
				</form>
              
                </div>
                
                

            </div>     
          </div>
          <!-- Edit Book -->
          <div class="row accordion-body accordion-collapse collapse" id="editBook"
            data-bs-parent="#arkCONTENT">
            <div>
              <header>
                <h1 class="fs-1">Edit Book</h1>
              </header>
                <hr class="bg-secondary my-1 opacity-100">


    
                <div class="container col align-items-center">

                  <!-- Search -->
                  <div class="row my-5">
                    <div class="col">
                      Search Book
                    </div>
                    <div class="col">
                      <!-- Input search box -->
                      <!-- Will autofill -->
                      <input id="login-password" type="input" name="password" placeholder="Search Book"
                        class="btn border border-secondary-subtle" required>

                        <input id="login-password" type="button" name="password" value="Select Picture"
                        class="btn border border-secondary-subtle" required>
                      
                    </div>
                  </div>

                  
    
                  <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Picture
                    </div>
                    <div class="col">
                      <input id="login-password" type="button" name="password" value="Change Picture"
                        class="btn border border-secondary-subtle" required>
                    </div>
                  </div>
    
                  <!-- Title -->
                  <div class="row my-5">
                    <div class="col">
                      Title
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Title" id="floatingTextarea">
                    </div>
                  </div>
    
                  <!-- Author -->
                  <div class="row my-5">
                    <div class="col">
                      Author
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Author" id="floatingTextarea">
                    </div>
                  </div>
    
                  <!-- Details -->
                  <!-- To show display of number of characters -->
                  <div class="row my-5">
                    <div class="col">
                      Description
                    </div>
                    <div class="col">
                      <textarea class="form-control" placeholder="Add a description for the book here"
                        id="floatingTextarea2" style="height: 100px" style="resize: none;" maxlength="255" onchange="countText()"></textarea>
                      <span class="pull-right label label-default" id="count_message"></span>
                      
                    </div>
                  </div>
    
                  <div class="row my-5">
                    <div class="col">
                      Price
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="$" id="floatingTextarea">
                    </div>
                  </div>
    
                  <div class="row my-5">
                    <div class="col">
                      ISBN Code
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="ISBN-13" id="floatingTextarea">
                    </div>
                  </div>
    
                  <div class="row  my-5">
                    <div class="col">
                      Genre
                    </div>
                   
                    <!-- To autofill using JSP -->
                    <div class="dropdown col">
                      <div class="row mx-1">
                        <a class="btn btn-danger dropdown-toggle col-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Select genre
                        </a>
                      
                        <ul class="dropdown-menu ">
                          <li><a class="dropdown-item" href="#">Action</a></li>
                          <li><a class="dropdown-item" href="#">Another action</a></li>
                          <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
      
                        <div class="col-6">
                          test
                        </div>
    
                      </div>
                      
                    </div>
                    
                  </div>
                  
                </div>
                <div>
                  <input type="submit" value="Add book" class="btn btn-primary">
    
                </div>

            </div>
          
          </div>
          <!-- Delete Book -->
          <div class="row accordion-body accordion-collapse collapse" id="deleteBook"
            data-bs-parent="#arkCONTENT">
            <div>
              <header>
                <h1 class="fs-1">Delete Book</h1>
              </header>
                <hr class="bg-secondary my-1 opacity-100">


    
                <div class="container col align-items-center">

                  <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Search Book
                    </div>
                    <div class="col">
                      <!-- Input search box -->
                      <!-- Will autofill -->
                      <input id="login-password" type="input" name="password" placeholder="Search Book"
                        class="btn border border-secondary-subtle" required>

                        <input id="login-password" type="button" name="password" value="Select Picture"
                        class="btn border border-secondary-subtle" required>
                      
                    </div>
                  </div>

                  
    
                  <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Picture
                    </div>
                    <div class="col">
                      <input id="login-password" type="button" name="password" value="Change Picture"
                        class="btn border border-secondary-subtle" disabled>
                    </div>
                  </div>
    
                  <!-- Title -->
                  <div class="row my-5">
                    <div class="col">
                      Title
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Title" id="floatingTextarea"  disabled>
                    </div>
                  </div>
    
                  <!-- Author -->
                  <div class="row my-5">
                    <div class="col">
                      Author
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Author" id="floatingTextarea"  disabled>
                    </div>
                  </div>
    
                  <!-- Details -->
                  <!-- To show display of number of characters -->
                  <div class="row my-5">
                    <div class="col">
                      Description
                    </div>
                    <div class="col">
                      <textarea class="form-control" placeholder="Add a description for the book here"
                        id="floatingTextarea2" style="height: 100px" style="resize: none;" maxlength="255" onchange="countText()" disabled></textarea>
                      <span class="pull-right label label-default" id="count_message"></span>
                      
                    </div>
                  </div>
    
                  <div class="row my-5">
                    <div class="col">
                      Price
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="$" id="floatingTextarea" disabled>
                    </div>
                  </div>
    
                  <div class="row my-5">
                    <div class="col">
                      ISBN Code
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="ISBN-13" id="floatingTextarea" disabled>
                    </div>
                  </div>
    
                  <div class="row  my-5">
                    <div class="col">
                      Genre
                    </div>
                   
                    <!-- To autofill using JSP -->
                    <div class="dropdown col">
                      <div class="row mx-1">
                        
      
                        <div class="col-6">
                          test
                        </div>
    
                      </div>
                      
                    </div>
                    
                  </div>
                  
                </div>
                <div>
                  <input type="submit" value="Add book" class="btn btn-primary">
    
                </div>

            </div>
          </div>



          <!-- Manage Users -->
          <!-- Add User -->
          <div class="row  accordion-body accordion-collapse collapse" id="addUser"
            data-bs-parent="#arkCONTENT">
            <div>
              <header>
                <h1 class="fs-1">Add User</h1>
              </header>
                <hr class="bg-secondary my-1 opacity-100">


    
                <div class="container col align-items-center">

    
                  <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Picture
                    </div>
                    <div class="col">
                      <input id="login-password" type="button" name="password" value="Change Picture"
                        class="btn border border-secondary-subtle" >
                    </div>
                  </div>
    
                  <!-- Email -->
                  <div class="row my-5">
                    <div class="col">
                      Email
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Email" id="floatingTextarea"  >
                    </div>
                  </div>
    
                  <!-- Password -->
                  <div class="row my-5">
                    <div class="col">
                      Password
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Password" id="floatingTextarea" >
                    </div>
                  </div>
    
              
    
                  <div class="row my-5">
                    <div class="col">
                      Price
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="$" id="floatingTextarea">
                    </div>
                  </div>
    
                  
    
                  <div class="row  my-5">
                    <div class="col">
                      Role
                    </div>
                   
                    <!-- To autofill using JSP -->
                    <div class="dropdown col">
                      <div class="row mx-1">
                        <a class="btn btn-danger dropdown-toggle col-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Select Role
                        </a>
                      
                        <ul class="dropdown-menu ">
                          <li><a class="dropdown-item" href="#" >User</a></li>
                          <li><a class="dropdown-item" href="#">Admin</a></li>

                        </ul>
      
                        <div class="col-6">
                          test
                        </div>
    
                      </div>
                      
                    </div>
                    
                  </div>
                  
                  
                </div>
                <div>
                  <input type="submit" value="Add User" class="btn btn-primary">
    
                </div>

            </div>
          </div>

          <!-- Info to be autofilled with scriplets. -->  
          <!-- Edit User -->
          <div class="row accordion-body accordion-collapse collapse" id="editUser"
            data-bs-parent="#arkCONTENT">
            <div>
              <header>
                <h1 class="fs-1">Edit User</h1>
              </header>
                <hr class="bg-secondary my-1 opacity-100">


    
                <div class="container col align-items-center">

                  <div class="row my-5">
                    <div class="col">
                      Search User
                    </div>
                    <div class="col">
                      <!-- Input search box -->
                      <!-- Will autofill -->
                      <input id="login-password" type="input" name="password" placeholder="Search User"
                        class="btn border border-secondary-subtle" required>

                        <input id="login-password" type="button" name="password" value="Select User"
                        class="btn border border-secondary-subtle" required>
                      
                    </div>
                  </div>

    
                  <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Picture
                    </div>
                    <div class="col">
                      <input id="login-password" type="button" name="password" value="Change Picture"
                        class="btn border border-secondary-subtle" >
                    </div>
                  </div>
    
                  <!-- Email -->
                  <div class="row my-5">
                    <div class="col">
                      Email
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Email" id="floatingTextarea"  >
                    </div>
                  </div>
    
                  <!-- Password -->
                  <div class="row my-5">
                    <div class="col">
                      Password
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Password" id="floatingTextarea" >
                    </div>
                  </div>
    
                 
    
            
    
                  <div class="row  my-5">
                    <div class="col">
                      Role
                    </div>
                   
                    <!-- To autofill using JSP -->
                    <div class="dropdown col">
                      <div class="row mx-1">
                        <a class="btn btn-danger dropdown-toggle col-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Select Role
                        </a>
                      
                        <ul class="dropdown-menu ">
                          <li><a class="dropdown-item" href="#" >User</a></li>
                          <li><a class="dropdown-item" href="#">Admin</a></li>

                        </ul>
      
                        <div class="col-6">
                          test
                        </div>
    
                      </div>
                      
                    </div>
                    
                  </div>
                  
                  
                </div>
                <div>
                  <input type="submit" value="Edit User" class="btn btn-primary">
    
                </div>

            </div>
          </div>
          <!-- Delete User -->
          <div class="row accordion-body accordion-collapse collapse" id="deleteUser"
            data-bs-parent="#arkCONTENT">
            <div>
              <header>
                <h1 class="fs-1">Delete User</h1>
              </header>
                <hr class="bg-secondary my-1 opacity-100">


    
                <div class="container col align-items-center">

                  <div class="row my-5">
                    <div class="col">
                      Search User
                    </div>
                    <div class="col">
                      <!-- Input search box -->
                      <!-- Will autofill -->
                      <input id="login-password" type="input" name="password" placeholder="Search User"
                        class="btn border border-secondary-subtle" required>

                        <input id="login-password" type="button" name="password" value="Select User"
                        class="btn border border-secondary-subtle" required>
                      
                    </div>
                  </div>

    
                  <!-- Picture -->
                  <div class="row my-5">
                    <div class="col">
                      Picture
                    </div>
                    <div class="col">
                      <input id="login-password" type="button" name="password" value="Change Picture"
                        class="btn border border-secondary-subtle" disabled>
                    </div>
                  </div>
    
                  <!-- Email -->
                  <div class="row my-5">
                    <div class="col">
                      Email
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Email" id="floatingTextarea"   disabled>
                    </div>
                  </div>
    
                  <!-- Password -->
                  <div class="row my-5">
                    <div class="col">
                      Password
                    </div>
                    <div class="col">
                      <input class="form-control" placeholder="Password" id="floatingTextarea"  disabled >
                    </div>
                  </div>
    
                 
    
            
    
                  <div class="row  my-5">
                    <div class="col">
                      Role
                    </div>
                   
                    <!-- To autofill using JSP -->
                    <div class="dropdown col">
                      <div class="row mx-1">

                        <ul class="dropdown-menu " >
                          <li><a class="dropdown-item" href="#" >User</a></li>
                          <li><a class="dropdown-item" href="#">Admin</a></li>

                        </ul>
      
                        <div class="col-6">
                          test
                        </div>
    
                      </div>
                      
                    </div>
                    
                  </div>
                  
                  
                </div>
                <div>
                  <input type="submit" value="Edit User" class="btn btn-primary">
    
                </div>

            </div>
          </div>




        </div>



      </main>

      <!-- Main content -->

    </div>
  </div>




<script>
function previewImage(event) {
	  var input = event.target;
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      var preview = document.getElementById('preview');
	      preview.src = e.target.result;
	      preview.style.display = 'block';
	    };
	    reader.readAsDataURL(input.files[0]);
	  }
	}
</script>
</body>

</html>