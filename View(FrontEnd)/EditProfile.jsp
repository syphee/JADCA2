<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dbDAO.UserDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbDAO.sqlPassword"%>

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

if (role.equals("Guest")) {

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
<body class="bg-black">
	<%@include file="assets/header/header.jsp"%>
	<%@include file="assets/messagePopUp.jsp"%>
	<div class="container-md">
		<h1 class="text-light">
			My Profile
			<button type="button" class="btn btn-light  text-black"
				data-bs-toggle="modal" data-bs-target="#exampleModal">
				<ion-icon name="create-outline"></ion-icon>
			</button>
		</h1>


		<!-- Modal -->
		<form action="<%=request.getContextPath()%>/editUser" method="post"
			class="row" enctype="multipart/form-data" id="editProfile">
			<input type="hidden" name="user_id"
				value="<%=(Integer) session.getAttribute("userid")%>"
				form="editProfile">
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Edit
								Profile</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">






							<div class="col">

								<div class="row my-5">
									<div class="col">Picture</div>
									<div class="col">
										<input type="file" name="user_pic"
											onChange="previewImage(event)" value="<%=pic%>"
											accept="image/*" form="editProfile" /> <img
											src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/user-imgs/<%=pic%>"
											id="preview" style="max-width: 100px;" />
									</div>
								</div>

							</div>

							<div class="col justify-content-end ">

								<div class="row">
									<div class="form-group">
										<label for="firstName">First name</label> <input type="text"
											class="form-control" id="InputFName"
											placeholder="Enter your first name" name="user_first_name"
											value="<%=first_name%>" form="editProfile">
									</div>

								</div>
								<div class="row">
									<div class="form-group">
										<label for="firstName">Last Name</label> <input type="text"
											class="form-control" id="InputFName"
											placeholder="Enter your first name" name="user_last_name"
											value="<%=last_name%>" form="editProfile">
									</div>

								</div>



								<div class="row">
									<div class="form-group">
										<label for="firstName">Contact Number</label> <input
											type="text" class="form-control" id="InputFName"
											placeholder="Enter your first name" name="user_contact"
											form="editProfile" value="<%=contactNumber%>">
									</div>

								</div>

								<div class="row">
									<div class="form-group">
										<label for="firstName">Email</label> <input type="text"
											class="form-control" id="InputFName" name="user_email"
											value="<%=user%>" form="editProfile">
									</div>

								</div>

								<div class="row">
									<div class="form-group">
										<label for="firstName">Address 1</label> <input type="text"
											class="form-control" id="InputFName" name="user_address"
											value="<%=address%>" form="editProfile">
									</div>

								</div>

							</div>



						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="Edit Profile">
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- End of modal for edit profile -->

		<form action="<%=request.getContextPath()%>/changePassword"
			method="post" class="row">
			<input type="hidden" name="user_id"
				value="<%=(Integer) session.getAttribute("userid")%>">
			<div class="modal fade" id="changePassword" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Edit
								password</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">


							<div class="col justify-content-end ">

								<div class="row">
									<div class="form-group">
										<label for="firstName">Enter old Password</label> <input
											type="text" class="form-control" id="InputFName"
											placeholder="Enter old Password" name="old-password" value="">
									</div>

								</div>
								<div class="row">
									<div class="form-group">
										<label for="firstName">Enter New Password</label> <input
											type="text" class="form-control" id="InputFName"
											placeholder="Enter New Password" name="new-password" value="">
									</div>

								</div>



								<div class="row">
									<div class="form-group">
										<label for="firstName">Confirm Password</label> <input
											type="text" class="form-control" id="InputFName"
											placeholder="Confirm Password" value=""
											name="confirm-password">
									</div>

								</div>



							</div>



						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<input type="Submit" class="btn btn-primary"
								value="Change Password">
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- End of modal for change password -->


		<div class="col">
			<img class="dropdown-item"
				src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/user-imgs/<%=pic%>"
				style="max-width: 100px;" /></img>



		</div>

		<div class="col justify-content-end ">

			<div class="row">
				<div class="form-group">
					<label for="firstName" class="text-light">First name</label> <input
						type="text" class="form-control" id="InputFName"
						placeholder="Enter your first name" value="<%=first_name%>"
						disabled>
				</div>

			</div>
			<div class="row">
				<div class="form-group">
					<label for="firstName" class="text-light">Last Name</label> <input
						type="text" class="form-control" id="InputFName"
						placeholder="Enter your first name" value="<%=last_name%>"
						disabled>
				</div>

			</div>



			<div class="row">
				<div class="form-group">
					<label for="firstName" class="text-light">Contact Number</label> <input
						type="text" class="form-control" id="InputFName"
						placeholder="Enter your first name" value="<%=contactNumber%>"
						disabled>
				</div>

			</div>

			<div class="row">
				<div class="form-group">
					<label for="firstName" class="text-light">Email</label> <input
						type="text" class="form-control" id="InputFName" value="<%=user%>"
						disabled>
				</div>

			</div>

			<div class="row">
				<div class="form-group">
					<label for="firstName" class="text-light">Address</label> <input
						type="text" class="form-control" id="InputFName"
						value="<%=address%>" disabled>
				</div>

			</div>
			<div class="row">
				<div class="form-group">
					<button type="button" class="btn btn-light  text-black"
						data-bs-toggle="modal" data-bs-target="#changePassword">
						<ion-icon name="build-outline"></ion-icon>
						<label>Change Password</label>
					</button>
				</div>

			</div>



		</div>


		<!-- End of modal -->

		<div class="row container">



			<!-- View history transactions -->
			<div class="container">
				<div class="row">


					<div class="col">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="home-tab"
									data-bs-toggle="tab" data-bs-target="#home-tab-pane"
									type="button" role="tab" aria-controls="home-tab-pane"
									aria-selected="true">Order History</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link text-light" id="profile-tab"
									data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
									type="button" role="tab" aria-controls="profile-tab-pane"
									aria-selected="false">Checkout Codes</button>
							</li>

						</ul>
						<div class="tab-content" id="myTabContent">

							<!-- Order History -->
							<div class="tab-pane fade show active" id="home-tab-pane"
								role="tabpanel" aria-labelledby="home-tab" tabindex="0">
								<div >
									<div class="tab-content" id="myTabContent">
										<div class="tab-pane fade show active" id="home-tab-pane"
											role="tabpanel" aria-labelledby="home-tab" tabindex="0">
											

								<%
								ArrayList<Integer> order_ids = new ArrayList<Integer>();

								// store distinct order id's for group retrieval of orders
								try {
									int order_id_number = 0;
									// for every item in shopping cart

									//step 1 Load jdbc driver
									Class.forName("com.mysql.jdbc.Driver");

									//step 2 define URL connection
									String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

									//step 3 Establish connection
									Connection conn = DriverManager.getConnection(connURL);

									//Call routine
									String simpleProc = "select distinct order_items.order_id from order_items,orders where order_items.order_id = orders.order_id and orders.userid = ?";
									PreparedStatement cs = conn.prepareStatement(simpleProc);

									// insert book values
									cs.setInt(1, (Integer) session.getAttribute("userid"));

									// Step 5: Execute SQL Command
									//String sqlStr = "SELECT * FROM member";         

									ResultSet rs = cs.executeQuery();

									while (rs.next()) {
										order_id_number = rs.getInt("order_id");

										order_ids.add(order_id_number);
									}
									conn.close();
								} catch (Exception ex) {
									ex.printStackTrace();
								}

								// for each loop to go through order id's. rs.next() will do all the work for grouping
								// query for user's bought books, grouping according to order id
								for (Integer a : order_ids) {
									%>
									<div class="row">
									<hr class="bg-danger my-1 opacity-100">
																					<div class="col">
													<h1 class="text-light">Order #<%=order_ids.indexOf(a)+1 %></h1>
												</div>
																							</div>
												<% 
												
									try {
										int order_id_number = 0;
										int book_id = 0;
										// for every item in shopping cart
										
										// for current order
										String order_date = "";
										int quantity = 0;
										double total_price = 0;
												
										//step 1 Load jdbc driver
										Class.forName("com.mysql.jdbc.Driver");

										//step 2 define URL connection
										String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

										//step 3 Establish connection
										Connection conn = DriverManager.getConnection(connURL);

										//Call routine
										String simpleProc = "SELECT * FROM orders,order_items where userid = ? and orders.order_id = order_items.order_id and order_items.order_id = ?";
										PreparedStatement cs = conn.prepareStatement(simpleProc);

										// insert book values
										cs.setInt(1, (Integer) session.getAttribute("userid"));
										cs.setInt(2, a);
										// Step 5: Execute SQL Command
										//String sqlStr = "SELECT * FROM member";         

										ResultSet rs = cs.executeQuery();

										// generate html here
										while (rs.next()) {
											book_id = rs.getInt("book_id");
											String status = rs.getString("status");
											String date_of_purchase = rs.getString("order_date");
											int purchased_quantity = rs.getInt("quantity");
											double purchase_total = rs.getDouble("total_amount");
											%>

												<div
													class="col text-end d-flex align-items-center justify-content-end text-light">
													Status : <%=status %>
													</div>
											<% 
											// query for book id 
											String simpleProc2 = "SELECT * FROM books where book_id = ?";
											Connection conn2 = DriverManager.getConnection(connURL);

											PreparedStatement cs2 = conn2.prepareStatement(simpleProc2);
	
											// insert book values
											cs2.setInt(1, book_id);
										
											// Step 5: Execute SQL Command
											//String sqlStr = "SELECT * FROM member";         
	
											ResultSet rs2 = cs2.executeQuery();
											while(rs2.next()){
												String title = rs2.getString("title");
												String book_pic = rs2.getString("pic");
												int id = rs2.getInt("book_id");
												double book_price = rs2.getDouble("price");
												
												%>


											

											
											<div class="row">
												<div class="col">

													<form action="details.jsp" method="get">
										            			<input type="hidden" name="view" value="<%=id%>"/>
											                	
										             			<input type="image" alt="Details" src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=book_pic%>" class="card-img-top book-img hover-underline-animation" style="max-width: 200px;" />
										             </form>

												</div>
												<div class="col">
													<div class="row text-secondary-emphasis">
														Title
														<div>
															<p class=" text-light"><%=title %></p>

														</div>

													</div>

													<div class="row text-secondary-emphasis">
														Date of purchase
														<div>
															<p class=" text-light"><%=date_of_purchase %></p>

														</div>

													</div>

													<div class="row text-secondary-emphasis">
														Quantity
														<div>
															<p class=" text-light"><%=purchased_quantity %></p>

														</div>

													</div>
													
													<div class="row text-secondary-emphasis">
														Book Price
														<div>
															<p class=" text-light">$<%=book_price %></p>

														</div>

													</div>

													<div class="row text-secondary-emphasis">
														Total Price
														<div>
															<p class=" text-light">$<%=book_price*purchased_quantity %></p>

														</div>

													</div>


												</div>


											</div>






										






									

								
												<%} 
											conn2.close();
											}

											
								%>


								<%
								
								conn.close();
								} catch (Exception ex) {
								ex.printStackTrace();
								}
									
								}
								%>
								</div>
								</div>
								</div>
								<div class="tab-pane fade" id="profile-tab-pane"
											role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>



							</div>



							<!-- Checkout codes -->
							<div class="tab-pane fade " id="profile-tab-pane" role="tabpanel"
								aria-labelledby="profile-tab" tabindex="0">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>

						</div>

					</div>

				</div>

			</div>




		</div>

	</div>






	<%@ include file="assets/footer/footer.jsp"%>
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
