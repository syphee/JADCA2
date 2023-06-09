
 <nav class=" bg-light ">
	 <div class="text-focus-in container">
	 	  <header class="text-center fs-1 ">
      <a href="home.jsp" class="text-dark px-4 "><text class="text-white bg-danger px-1 rounded-1 ">SP</text> <text class="border-start border-dark mx-2 "></text> A R K.</text></a>
      
    </header>

    <div class="row">

      <!-- Buttons -->
      <ul class="nav justify-content-center col ">
        <li class="nav-item mb-0 mx-1 my-0 ">
          <a class="nav-link text-black fw-semibold hover-underline-animation  " href="index.html">Genres</a>
        </li>
        <li class="nav-item mb-0 mx-1  my-0">
          <a class="nav-link text-black fw-semibold hover-underline-animation" href="my_life.html">What's new</a>
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
        <li class="nav-item mb-0 mx-1 my-0 ">
            <a class="nav-link text-black fw-semibold hover-underline-animation  " href="index.html">Advanced Search</a>
          </li>

        <li class="nav-item mb-0 mx-1 my-0 ">
          <div class="dropdown">
            <button class="btn btn-danger dropdown-toggle d-inline-block text-truncate" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="max-width: 200px;">
              Hello , <%=user %>
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">My profile</a></li>
              <li><a class="dropdown-item" href="#">My rentals</a></li>
              <li><hr class="dropdown-divider"></li>
              <li>
              		<!-- Log out -->
	              <form action="<%= request.getContextPath()%>/InvalidateSession" method="post">
	              	<input type="submit" class="dropdown-item" value="Log out">
	              </form>
              </li>
              
              
              <!-- Variables "role" and "user" are already inherited since header.jsp is called under home.jsp. No need to declare them again. Ignore the errors. -->
			    <%

				if(role.equals("admin")){
					%>
				<li><a class="dropdown-item" href="AdminPanel.jsp">Admin Panel</a>
				</li>
				
				<%} %>
				
            </ul>
            
          </div>
        </li>


      </ul>
      <hr class="bg-danger my-1 opacity-100">
    </div>
	 </div>
  



  </nav>


