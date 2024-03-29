<div class="row accordion-body accordion-collapse collapse"
						id="editBook" data-bs-parent="#arkCONTENT">
						<div>
							<header>
								<h1 class="fs-1">Edit Book</h1>
							</header>
							<hr class="bg-secondary my-1 opacity-100">
							
							<!-- https://stackoverflow.com/questions/5967564/form-inside-a-table -->
							<!-- table below associated with form -->
							

							<table class="table border col">
								<thead>
									<tr class="row">
										<td class="col">Picture</td>

										<td class="col">Title</td>
										<td class="col">Author</td>
										<td class="col">Price</td>
										<td class="col">Date published</td>
										<td class="col">ISBN</td>
										<td class="col">Genre</td>
										<td class="col">Rating</td>
										<td class="col">Description</td>
										<td class="col">Action</td>
									</tr>
								</thead>
								<tbody>

									<!-- scriplet here -->
									<%
									String output_genres = "";
												// to retrieve all genres from DB
												try {

													// Step1: Load JDBC Driver
													Class.forName("com.mysql.jdbc.Driver");

													// Step 2: Define Connection URL
													// to change password whenever accessing
													String connURL2 = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

													ResultSet rs2;
													String genre2 = "";
													int genre_id2 = 0;

													// to display all
													output = "";

													// Step 3: Establish connection to URL
													Connection conn2 = DriverManager.getConnection(connURL2);
													// Step 4: Create Statement object
													Statement stmt2 = conn2.createStatement();
													// Step 5: Execute SQL Command
													String sqlStr = "SELECT * from genres";
													//
													PreparedStatement pstmt2 = conn2.prepareStatement(sqlStr);

													// execute query
													rs2 = pstmt2.executeQuery();

													while (rs2.next()) {
														genre_id2 = rs2.getInt("genre_id");
														genre2 = rs2.getString("name");

														output_genres += "<option id=\"" + genre_id2 + "\" value=\"" + genre_id2 + "\">" + genre2 + "</option>";

													}
													// Step 7: Close connection
													System.out.println("Genre output - \n" + output_genres);
													conn2.close();
												} catch (Exception e) {
													System.out.println("Error :" + e);
												}
												%>
									<%
									// to retrieve all genres from DB
									try {

										// Step1: Load JDBC Driver
										Class.forName("com.mysql.jdbc.Driver");

										// Step 2: Define Connection URL
										// to change password whenever accessing
										String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

										ResultSet rs;
										String title = "";
										String author = "";
										double price = 0;
										String date = "";
										String isbn = "";
										String genre = "";
										String pictureURI = "";
										double rating = 0;
										String description = "";
										int genre_id = 0;
										int book_id = 0;
										int quantity = 0;

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
											genre_id = rs.getInt("genre_id");
											book_id = rs.getInt("book_id");
											quantity = rs.getInt("quantity");
									%>
									<form class="form form-login" action="<%=request.getContextPath()%>/editBook" method="post" id="editBooks">
										
									<tr class="row">
										
										<td class="col"><img
											src="<%=contextPath%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=pictureURI%>"
											style="max-width: 100px;" /></td>

										<td class="col">
											<input type="text" id="custId"
											name="title" value="<%=title%>">
										</td>
										<td class="col">
											<input type="text" id="custId"
											name="author" value="<%=author%>" >
										</td>
										<td class="col">
											<input type="text" id="custId"
											name="price" value="<%=price%>">
										</td>
										<td class="col">
											<input type="text" id="custId"
											name="date" value="<%=date%>" >
										</td>
										<td class="col">
											<input type="text" id="custId"
											name="isbn" value="<%=isbn%>">
										</td>
										<td class="col">
										
											<select name="genre"
												class="btn btn-danger dropdown-toggle" >
													<option id="<%=genre_id %>" value="<%=genre_id %>" selected="selected" ><%=genre %></option>
													<%=output_genres%>
											</select>
										</td>
											<td class="col">
												<input type="text" id="custId"
												name="rating" value="<%=rating%>" >
											</td>
											<td class="col">
												<textarea id="custId" class="form-control"
												name="description"  placeholder="<%=description%>"></textarea>
											</td>
	
	
											<td class="col">
												<input type="hidden" id="custId" name="default_description" value="<%=description%>" />
												<input type="hidden" id="custId" name="quantity" value="<%=quantity%>" />
												<input type="hidden" id="custId" name="book_id" value="<%=book_id%>" />
												<input type="submit" name="submit" value="Edit book"  />
										
									</tr>
									</form>


									<%
									}
									// Step 7: Close connection
									System.out.println("Genre output - \n" + output_genres);
									conn.close();
									} catch (Exception e) {
									System.out.println("Error :" + e);
									}
									%>



								</tbody>
							</table>
						</div>





					</div>