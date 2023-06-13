<%@page import="java.util.ArrayList"%>






<nav class=" bg-light ">
	<div class="text-focus-in container">
		<header class="text-center fs-1 ">
			<a href="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp" class="text-dark px-4 "><text
					class="text-white bg-danger px-1 rounded-1 ">SP</text> <text
					class="border-start border-dark mx-2 "></text> A R K.</text></a>
		
		
		</header>

		<div class="row">

			<!-- Buttons -->
			<ul class="nav justify-content-center col ">
				<li class="nav-item mb-0 mx-1 my-0 "><a
					class="nav-link text-black fw-semibold hover-underline-animation  "
					href="index.html">Genres</a></li>
				<li class="nav-item mb-0 mx-1  my-0"><a
					class="nav-link text-black fw-semibold hover-underline-animation"
					href="my_life.html">What's new</a></li>
				<li class="nav-item mb-0 mx-1  my-0"><a
					class="nav-link text-black fw-semibold hover-underline-animation"
					href="my_career.html">Popular</a></li>

			</ul>

			<!-- Search bar -->
			<ul class="nav justify-content-end align-items-center col">


				<li
					class="nav-item mb-0  my-0 d-flex flex-row align-items-end flex-row-reverse ms-1 g-col-6 ">
					<form method="post" action="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/search.jsp" id="search"></form> <input
					type="text" class="form-control" placeholder="Search" name="s"
					aria-label="Username" aria-describedby="basic-addon1" form="search">
					<button type="submit" form="search" name="submit">
						<ion-icon name="search-outline" class="fs-1"></ion-icon>
					</button>

				</li>
				<li class="nav-item mb-0 mx-1 my-0 "><a
					class="nav-link text-black fw-semibold hover-underline-animation  "
					href="index.html">Advanced Search</a></li>

				<li class="nav-item mb-0 mx-1 my-0 ">
					<div class="dropdown">
						<button
							class="btn btn-danger dropdown-toggle d-inline-block text-truncate"
							type="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="max-width: 200px;">
							Hello ,
							<%=user %>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">My profile</a></li>
							<li><a class="dropdown-item" href="#">My rentals</a></li>
							<li><hr class="dropdown-divider"></li>
							<li>
								<!-- Log out -->
								<form action="<%= request.getContextPath()%>/InvalidateSession"
									method="post">
									<input type="submit" class="dropdown-item" value="Log out">
								</form>
							</li>


							<!-- Variables "role" and "user" are already inherited since header.jsp is called under home.jsp. No need to declare them again. Ignore the errors. -->
							<%

				if(role.equals("admin")){
					%>
							<li><a class="dropdown-item" href="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp">Admin
									Panel</a></li>

							<%} %>

						</ul>

					</div>
				</li>
				<div>
				<form action="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/checkout.jsp" method="post">
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
		</div>
	</div>




</nav>


