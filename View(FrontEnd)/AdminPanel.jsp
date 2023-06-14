<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
final String SQLpassword = "spJEAL602336";
String path = request.getContextPath();

System.out.println(request.getContextPath());
String output = "";
String role = "";
String user = "";
try {
	user = session.getAttribute("username").toString();
	role = session.getAttribute("role").toString();
	if (role.equals("admin") != true || role == null) {
		System.out.println("No permissions!");
		response.sendRedirect("home.jsp");
	}

} catch (Exception ex) {
	System.out.println("No permissions!");
	response.sendRedirect("/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp");
}
%>

<%
String URI = "";

//constructing bootstrap card
String color = "";
String output2 = "";
String message = "";
color = request.getParameter("c");
output2 = request.getParameter("o");
if (color != null || output2 != null) {
	message = "<div class=\"alert " + color + " role=\"alert\">\r\n" + output2 + "\r\n"
	+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	+ "</div>";
}
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



<style>
html, body {
	height: 100%;
	overflow: auto;
}
</style>
</head>

<body>
	<%=message%>

	<div class="container-fluid accordion">
		<div class="row flex-nowrap ">
			<!-- Sidenav -->
			<div
				class="col-sm-2 col-auto px-0 collapse collapse-horizontal overflow-hidden "
				id="sidebar">
				<div
					class="list-group border-0 text-center text-sm-start min-vh-100 accordion"
					id="sidebar-menu">

					<!-- Sidenav content -->
					<div href="#"
						class="list-group-item border-0 d-inline-block text-truncate"
						data-bs-parent="#sidebar">
						<header class="text-center fs-1 ">
							<a href="#" class="text-dark px-4 "><text
									class="text-white bg-danger px-1 rounded-1 ">SP</text> <text
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
									type="button" data-bs-toggle="collapse"
									data-bs-target="#manageDashboard" aria-expanded="false"
									aria-controls="collapseThree">Dashboard</button>
							</div>



							<div>
								<div class=" border-0 ">


									<hr class="bg-body-secondary my-1 opacity-100">

									<!-- Manage Books -->
									<div>
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#manageBooks"
												aria-expanded="false" aria-controls="collapseThree">
												Manage Books</button>
										</h2>
										<div id="manageBooks" class="accordion-collapse collapse"
											data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<ul
													class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark"
														data-bs-toggle="collapse" data-bs-target="#addBook">Add</a></li>
													<li class="my-4 link-hover" data-bs-toggle="collapse"
														data-bs-target="#editBook"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark">Edit
													</a></li>
													<li class="my-4 link-hover" data-bs-toggle="collapse"
														data-bs-target="#deleteBook"><a href="#"
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
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#manageUser"
												aria-expanded="false" aria-controls="collapseThree">
												Manage User</button>
										</h2>
										<div id="manageUser" class="accordion-collapse collapse"
											data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<ul
													class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark"
														data-bs-toggle="collapse" data-bs-target="#addUser">Add</a></li>
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark"
														data-bs-toggle="collapse" data-bs-target="#editUser">Edit
													</a></li>
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark"
														data-bs-toggle="collapse" data-bs-target="#deleteUser">Delete</a></li>
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
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#manageInventory"
												aria-expanded="false" aria-controls="collapseThree">
												Manage Inventory</button>
										</h2>
										<div id="manageInventory" class="accordion-collapse collapse"
											data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<ul
												
													class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
													<li class="my-4 link-hover"><a href="#"  data-bs-toggle="collapse" data-bs-target="#manageStocks"
														class="link-dark rounded hover-underline-animation text-dark">Manage stocks</a></li>
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark">Order Stocks 
													</a></li>
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark">View Statistics</a></li>
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
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#manageRentals"
												aria-expanded="false" aria-controls="collapseThree">
												Manage Rentals</button>
										</h2>
										<div id="manageRentals" class="accordion-collapse collapse"
											data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<ul
													class="btn-toggle-nav list-unstyled fw-normal pb-1 small ">
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark">Manage User Rentals</a></li>
													<li class="my-4 link-hover"><a href="#"
														class="link-dark rounded hover-underline-animation text-dark">Edit
													</a></li>
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
							<button href="#" data-bs-target="#sidebar"
								data-bs-toggle="collapse"
								class="btn rounded-3 p-1 my-0 fs-3 text-decoration-none">
								<ion-icon name="menu-outline"></ion-icon>
							</button>

						</div>
						<div class="col">
							<div class="dropdown text-end">
								<button class="btn btn-light dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Welcome back ,
									<%=user%>
								</button>
								<ul
									class="dropdown-menu align-items-center justify-content-center">
									<li><img class="dropdown-item" href="#"
										src="https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg"
										style="max-width: 100px;"></img></li>
									<li><text class="dropdown-item" href="#"><%=user%></text></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="#">Manage Account</a></li>
									<li><a class="dropdown-item" href="#">Help</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item"
										href="<%=path%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp">Exit
											Admin Panel</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><form action="<%=path%>/InvalidateSession"
											method="post">
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
					<div
						class="row text-center accordion-body accordion-collapse collapse show"
						id="manageDashboard" data-bs-parent="#arkCONTENT">
						<header>
							<h1>Dashboard</h1>
						</header>
						<div class="col">a</div>
						<div class="col">b</div>
						<div class="col">c</div>
						<div class="col">d</div>
						<div class="col">e</div>
						<div class="col">f</div>
					</div>


					<!-- Manage Books -->

					<!-- https://www.javatpoint.com/java-io -->
					<!-- Link for reference, to upload / get img -->

					<!-- Add Book -->
					<!-- To add form here -->
					<%@ include file="assets/bookPanel/addBook/addBookFeature.jsp"%>
					<!-- Edit Book -->
					<%@ include file="assets/bookPanel/editBook/editBookFeature.jsp"%>
					
					<!-- Delete Book -->

					<%@ include file="assets/bookPanel/deleteBook/deleteBookFeature.jsp"%>
					
					<!-- manage stocks -->
					<%@ include file="assets/inventoryPanel/manageInventory/manageInventoryFeature.jsp"%>
					
					
					
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