
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
			<h1 class="fs-1">Manage Orders</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">



		<table class="table border col">
			<thead>
				<tr class="row">
					<td class="col">Title</td>
					<td class="col">Quantity</td>

					<td class="col">Total price</td>
					<td class="col">Order placed on</td>
					<td class="col">Status</td>
					<td class="col">Order ID </td>
					<td class="col"></td>
					<td class="col"></td>

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
										
										// Step 5: Execute SQL Command

										String simpleProc = "SELECT *, books.title FROM orders RIGHT JOIN order_items ON orders.order_id = order_items.order_id JOIN books ON order_items.book_id = books.book_id;";
										PreparedStatement stmt = conn.prepareStatement(simpleProc);

										// execute query
										rs = stmt.executeQuery();

										while (rs.next()) {
											int order_id = rs.getInt("order_id");
											String order_date = rs.getString("order_date");
											double total_amount = rs.getDouble("total_amount");
											int order_item_id = rs.getInt("order_item_id");
											int order_quantity = rs.getInt("quantity");
											int order_book_id = rs.getInt("book_id");
											String status = rs.getString("status");
											String order_book_title = rs.getString("title");
									%>
				
				<tr class="row">

					<td class="col"><%=order_book_title %></td>

					<td class="col"><%=order_quantity %></td>
					<td class="col"><%=total_amount %></td>
						<td class="col"><%=order_date %></td>

					<td class="col">
						<%=status %>
					</td>
					<td class="col">
						<%=order_id %>
					</td>
					<td class="col">
					<form action="<%=request.getContextPath()%>/manageShipment" method="POST">
					<input type="hidden" name="order_id" value="<%=order_item_id %>">
						<select name="shipment-status" id="cars">
						  <option value="IN_SHIPMENT">In Shipment</option>
						  <option value="IN_TRANSPORT">In transport</option>
						  <option value="IN_DELIVERY">In delivery</option>
						  <option value="COMPLETED">Completed</option>
						</select>
						<input type="submit" value="Edit shipment Status">
					</form>

					</td>
					<td class="col">
						
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







<%@ include file="../../wrapper/wrapper2.jsp"%>
