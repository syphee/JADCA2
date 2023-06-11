<div class="row accordion-body accordion-collapse collapse"
	id="deleteBook" data-bs-parent="#arkCONTENT">
	<div>
		<header>
			<h1 class="fs-1">Delete Book</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">



		<table class="table border col">
			<thead>
				<tr class="row">
					<td class="col">Picture</td>
					<td class="col">Title</td>
					<td class="col">Author</td>
					<td class="col">Price</td>
					<td class="col">Quantity</td>
					<td class="col">Date published</td>
					<td class="col">Isbn</td>
					<td class="col">Genre</td>
					<td class="col">Rating</td>
					<td class="col">Description</td>
				</tr>
			</thead>
			<tbody>

				<!-- scriplet here -->
				<%
                        // to retrieve all genres from DB
                        try {

								// Step1: Load JDBC Driver
								Class.forName("com.mysql.jdbc.Driver");
					
								// Step 2: Define Connection URL
								// to change password whenever accessing
								String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";
								
								ResultSet rs;
								String title ="";
								String author = "";
								double price = 0;
								String date = "";
								String isbn = "";
								String genre = "";
								String pictureURI = "";
								double rating = 0;
								String description = "";
								
								String contextPath = request.getContextPath();
												
								
								// to display all
								output = "";
					
								// Step 3: Establish connection to URL
								Connection conn = DriverManager.getConnection(connURL);
								// Step 4: Create Statement object
								Statement stmt = conn.createStatement();
								// Step 5: Execute SQL Command
								
								String simpleProc = "SELECT * FROM jadca1.showallbooks;";
								PreparedStatement pstmt = conn.prepareStatement(simpleProc);
								
								
								// execute query
								rs = pstmt.executeQuery();
					
								while (rs.next()) {
									
									
									pictureURI = rs.getString("pic");
									title = rs.getString("title");
									author = rs.getString("author");
									price = rs.getDouble("price");
									date = rs.getString("publication_date");
									genre = rs.getString("genre");
									isbn = rs.getString("ISBN");
									rating = rs.getDouble("rating");
									description = rs.getString("description");
									
									
									%>

				<tr class="row">
					<td class="col"><img
						src="<%=contextPath %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=pictureURI %>"
						style="max-width: 100px;" /></td>
					<td class="col"><%=title %></td>
					<td class="col"><%=author %></td>
					<td class="col"><%=price %></td>
					<td class="col"><%=date %></td>
					<td class="col"><%=isbn %></td>
					<td class="col"><%=genre %></td>
					<td class="col"><%=rating %></td>
					<td class="col"><%=description %></td>
					<td class="col">
						<form class="form form-login"
							action="<%= request.getContextPath()%>/deleteBook" method="post">
							<input type="hidden" id="custId" name="bookTitle"
								value="<%=title%>"> 
							<input type="hidden" id="custId"
								name="deleteBook" value="<%=isbn%>"> 
							<input
								type="submit" name="submit" value="Delete book" />
						</form>
					</td>

				</tr>
				<% 		
								}
								// Step 7: Close connection
								System.out.println("Genre output - \n" + output);
								conn.close();
							} catch (Exception e) {
								System.out.println("Error :" + e);
							}
                        
                        	
                        %>
			</tbody>
		</table>
	</div>





</div>