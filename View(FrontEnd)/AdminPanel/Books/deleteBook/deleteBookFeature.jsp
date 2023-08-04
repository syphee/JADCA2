
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="dbDAO.sqlPassword"%>
<%@ include file="../../scriplets/AdminLoginValidation.jsp"%>
<%@ include file="../../scriplets/validationScriptlet.jsp"%>

<%
String output ="";

%>



<%
String search = "";
String sort_by = "";
String SQLFilter = "";

try{
	search = request.getParameter("search");
	sort_by = request.getParameter("search_filter");
	
	// set search to blankspace upon page load
	if(search == null){
		search = "";
	}
	if(sort_by == null){
		sort_by = "";
	}else{
		switch(sort_by){
			case("Sort-by"):{
				SQLFilter = "";
				sort_by = "";
				break;
			}
			case("best-selling"):{
				SQLFilter = "";
				sort_by = "Best selling";
				break;
			}
			case("least-selling"):{
				SQLFilter = "";
				sort_by = "Least selling";
				break;
			}
			case("most-stock"):{
				SQLFilter = "order by quantity desc";	
				sort_by = "Most stock";
				break;
			}
			case("least-stock"):{
				SQLFilter = "order by quantity asc";
				sort_by = "Least stock";
				break;
			}
			default:{
				SQLFilter = "";
				break;
			}
		}
	}
	System.out.println("\nSearching for " + search + " and search filter " + sort_by +  " in DELETEBOOK.jsp");
}catch(Exception ex){
	ex.printStackTrace();
}



%>
<%@ include file="../../wrapper/wrapper1.jsp"%>


	<div>
		<header>
			<h1 class="fs-1">Delete Book</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">
		<label>Search Query for : <%=search %> <%if(sort_by.isEmpty() != true){
		%>
		
		and filter : <%=sort_by %>
	
	<%} %>
	</label>
		<form method="post" action="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Books/deleteBook/deleteBookFeature.jsp">
			<input type="text" id="search"
					placeholder="Search for book" name="search" aria-label="Username"
					aria-describedby="basic-addon1">
			
			<select name="search_filter" class="btn btn-danger dropdown-toggle col-3"
			>
			<option id="1" value="Sort-by" selected>Sort By</option>
			<option id="2"  value="best-selling">Best Selling</option>
			<option id="3"  value="least-selling">Least selling</option>
			<option id="4"  value="most-stock">Most Stock</option>
			<option id="4"  value="least-stock">Least Stock</option>

		</select> <input type="submit">
		
		</form>


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

										
										
										String simpleProc = "SELECT books.*, genres.name as genre from books right JOIN genres ON genres.genre_id = books.genre_id where books.book_id is not null and title LIKE CONCAT('%', ? , '%') " + SQLFilter + " ;" ;
										System.out.println("Final SQL Statement : " + simpleProc);
										
										PreparedStatement pstmt = conn.prepareStatement(simpleProc);
										
										pstmt.setString(1,search);
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





