<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" %>





<nav class=" bg-light ">
	<div class="text-focus-in container">
		<header class="text-center fs-1 ">
			<a
				href="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp"
				class="text-dark px-4 "><text
					class="text-white bg-danger px-1 rounded-1 ">SP</text> <text
					class="border-start border-dark mx-2 "></text> A R K.</text></a>


		</header>

		<div class="row">

			<!-- Buttons -->
			<ul class="nav justify-content-center col ">
				<li class="nav-item mb-0 mx-1 my-0 "><a href="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/genre.jsp"
					class="nav-link text-black fw-semibold hover-underline-animation  "
					href="genre.jsp">Genres</a></li>
				<li class="nav-item mb-0 mx-1  my-0"><a href="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/search.jsp?&s=&genre=Select%20genre&author_query=&sortBy=date_added"
					class="nav-link text-black fw-semibold hover-underline-animation"
					href="my_life.html">What's new</a></li>
				<li class="nav-item mb-0 mx-1  my-0"><a href="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/search.jsp?&s=&genre=Select%20genre&author_query=&sortBy=popularity"
					class="nav-link text-black fw-semibold hover-underline-animation"
					href="my_career.html">Popular</a></li>

			</ul>

			<!-- Search bar -->
			<ul class="nav justify-content-end align-items-center col">


				<li
					class="nav-item mb-0  my-0 d-flex flex-row align-items-end flex-row-reverse ms-1 g-col-6 ">
					<form method="post"
						action="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/search.jsp"
						id="search"></form> <input type="text" class="form-control"
					placeholder="Search" name="s" aria-label="Username"
					aria-describedby="basic-addon1" form="search">
					<button type="submit" form="search" name="submit">
						<ion-icon name="search-outline" class="fs-1"></ion-icon>
					</button>

				</li>
				<li class="nav-item mb-0 mx-1 my-0 ">


					<div class="accordion" id="accordionExample">
						<div class="">

							<a class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">Advanced
								Search </a>


						</div>
					</div>

				</li>

				<li class="nav-item mb-0 mx-1 my-0 ">
					<div class="dropdown">
						<button
							class="btn btn-danger dropdown-toggle d-inline-block text-truncate"
							type="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="max-width: 100px;">
							Hello ,
							<%=user %>
						</button>
						<ul class="dropdown-menu">

							<li><img class="dropdown-item"
							src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/user-imgs/<%=pic%>"
							style="max-width: 100px;" /></img></img></li>
							<li><text class="dropdown-item" href="#"><%=user%></text></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="EditProfile.jsp">My profile</a></li>
							<li><a class="dropdown-item" href="#">My rentals</a></li>
							<li><hr class="dropdown-divider"></li>
							<li>
								<!-- Log out --> 
								<form action="<%=request.getContextPath ()%>/InvalidateSession" method="post">
									<input type="submit" class="dropdown-item" value="Log out">
								</form>
							</li>


							<!-- Variables "role" and "user" are already inherited since header.jsp is called under home.jsp. No need to declare them again. Ignore the errors. -->
							<%

				if(role.equals("admin")){
					%>
							<li><a class="dropdown-item"
								href="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp">Admin
									Panel</a></li>

							<%} %>

						</ul>

					</div>
				</li>
				<div>
					<form
						action="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/checkout.jsp"
						method="post">
						<%
						String items ="";
						int cart_items = shopping_cart.size();
						// init cart function
						// if has items in shopping cart
						if(shopping_cart.size() > 0){
							%>
						<button type="submit" name="submit">
							<ion-icon name="cart-outline" class="nav-item fs-3"></ion-icon>
						</button>

						<span class="translate-middle badge rounded-pill bg-danger">
							<%=cart_items %>
						</span>

						<% 
						}else{
							%>
						<ion-icon name="cart-outline" class="nav-item fs-3"></ion-icon>

						<% 
						}
					%>

					</form>


				</div>




			</ul>
			<hr class="bg-danger my-1 opacity-100">
			<div id="collapseOne" class="accordion-collapse collapse collapsed"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<h1>Advanced search</h1>
				</div>
                <div class="dropdown col">
                    <div class="row">
                        <div class="col mx-1">
                            <h4>Select Genre</h4>
                            <select name="genre" class="btn btn-danger dropdown-toggle col-3" form="search">
								<option id="1" value="Select genre" selected>Select genre</option>
								<%
								String output ="";
                        // to retrieve all genres from DB
                        try {

								// Step1: Load JDBC Driver
								Class.forName("com.mysql.jdbc.Driver");
					
								// Step 2: Define Connection URL
								// to change password whenever accessing
								String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";
								
								ResultSet rs;
								String genre ="";
								int genre_id = 0;
								
								// to display all
								output = "";
					
								// Step 3: Establish connection to URL
								Connection conn = DriverManager.getConnection(connURL);
								// Step 4: Create Statement object
								Statement stmt = conn.createStatement();
								// Step 5: Execute SQL Command
								String sqlStr = "SELECT * from genres";
								//
								PreparedStatement pstmt = conn.prepareStatement(sqlStr);
					
								
								// execute query
								rs = pstmt.executeQuery();
					
								while (rs.next()) {
									genre_id = rs.getInt("genre_id");
									genre = rs.getString("name");
									
									output += "<option id=\""+ genre_id + "\" value=\"" + genre + "\">" + genre +"</option>";
												
								}
								// Step 7: Close connection
								System.out.println("Genre output - \n" + output);
								conn.close();
							} catch (Exception e) {
								System.out.println("Error :" + e);
							}
                        
                        	
                        %>
								<%=output %>
							</select>
                        </div>
                        <div class="col mx-1">
                            <h4>Sort by</h4>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sortBy" value="popularity" id="flexRadioDefault1" form="search" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Popularity
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="sortBy" value="date_added"  id="flexRadioDefault2" form="search" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Date Added
                                </label>
                              </div>
                        </div>
                        
                        <div class="col mx-1">
                            <h4>Author</h4>
                            <input type="text" class="form-control"
					placeholder="Search" name="author_query" aria-label="Username"
					aria-describedby="basic-addon1" form="search">
                        </div>
                        


                    </div>
                    

                </div>
			</div>
		</div>
	</div>




</nav>


