
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="dbDAO.sqlPassword"%>
<%@ include file="../../scriplets/AdminLoginValidation.jsp"%>
<%@ include file="../../scriplets/validationScriptlet.jsp"%>
<%@ include file="../../wrapper/wrapper1.jsp"%>
<%
String output ="";

%>




<div>
	<header>
		<h1 class="fs-1">Add Book</h1>
	</header>
	<hr class="bg-secondary my-1 opacity-100">
	

	<div class="container col align-items-center">
		<form action="<%= request.getContextPath()%>/addBook" name="form1"
			method="post" enctype="multipart/form-data">
			<!-- Picture -->
			<div class="row my-5">
				<div class="col">Picture</div>
				<div class="col">
					<input type="file" name="file" onChange="previewImage(event)"
						accept="image/*" /> <img
						src="<%= request.getContextPath()%>/assets/<%=URI%>" id="preview"
						style="max-width: 100px;" />
				</div>
			</div>

			<!-- Title -->
			<div class="row my-5">
				<div class="col">Title</div>
				<div class="col">
					<input class="form-control" type="text" name="title"
						placeholder="Title" id="floatingTextarea">
				</div>
			</div>
			<!-- Author -->
			<div class="row my-5">
				<div class="col">Author</div>
				<div class="col">
					<input class="form-control" type="text" name="author"
						placeholder="Author" id="floatingTextarea">
				</div>
			</div>

			<!-- Details -->
			<!-- To show display of number of characters -->
			<div class="row my-5">
				<div class="col">Description</div>
				<div class="col">
					<textarea class="form-control" name="description"
						placeholder="Add a description for the book here"
						id="floatingTextarea2" style="height: 100px" style="resize: none;"
						maxlength="255""></textarea>
					<span class="pull-right label label-default" id="count_message"></span>

				</div>
			</div>

			<div class="row my-5">
				<div class="col">Price</div>
				<div class="col">
					<input class="form-control" type="text" name="price"
						placeholder="$" id="floatingTextarea">
				</div>
			</div>

			<div class="row my-5">
				<div class="col">ISBN Code</div>
				<div class="col">
					<input class="form-control" type="text" name="isbn"
						placeholder="ISBN-13" id="floatingTextarea">
				</div>
			</div>

			<div class="row my-5">
				<div class="col">Publication Date</div>
				<div class="col">
					<input class="form-control" type="text" name="pub-date"
						placeholder="ISBN-13" id="floatingTextarea">
				</div>
			</div>

			<div class="row my-5">
				<div class="col">Quantity</div>
				<div class="col">
					<input class="form-control" type="text" name="quantity"
						placeholder="ISBN-13" id="floatingTextarea">
				</div>
			</div>

			<div class="row  my-5">
				<div class="col">Genre</div>

				<!-- To autofill using JSP -->
				<div class="dropdown col">
					<div class="row mx-1">
						<select name="genre" class="btn btn-danger dropdown-toggle col-3">

							<%
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
									
									output += "<option id=\""+ genre_id + "\" value=\"" + genre_id + "\">" + genre +"</option>";
												
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




						<!-- hidden input to store what is selected in genre -->

						</ul>



					</div>

				</div>

			</div>
			<div>
				<input type="submit" name="btnSubmit" value="AddBook"
					class="btn btn-primary">

			</div>


		</form>

	</div>



</div>
<%@ include file="../../wrapper/wrapper2.jsp"%>

