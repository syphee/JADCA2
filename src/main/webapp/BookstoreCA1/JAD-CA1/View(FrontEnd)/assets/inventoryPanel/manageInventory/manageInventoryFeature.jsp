<div class="row accordion-body accordion-collapse collapse"
	id="manageStocks" data-bs-parent="#arkCONTENT">
	<div>
		<header>
			<h1 class="fs-1">Manage Stocks</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">



		<table class="table border col">
			<thead>
				<tr class="row">
					<td class="col">Picture</td>
					<td class="col">Title</td>

					<td class="col">Price</td>
					<td class="col">Quantity</td>
					<td class="col">Date published</td>
					<td class="col">Edit Quantity </td>

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

								double price = 0;
								String date = "";
								String isbn = "";
								String quantity = "";

								String pictureURI = "";

								

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
									
									price = rs.getDouble("price");
									date = rs.getString("publication_date");
									
									isbn = rs.getString("ISBN");
									quantity = rs.getString("quantity");
									
									
									%>

				<tr class="row">
					<td class="col"><img
						src="<%=contextPath %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=pictureURI %>"
						style="max-width: 100px;" /></td>
					<td class="col"><%=title %></td>

					<td class="col"><%=price %></td>
				

					<td class="col"><%=quantity %></td>
						<td class="col"><%=date %></td>

					<td class="col">
						<form class="form form-login"
							action="<%= request.getContextPath()%>/manageStock" method="post">
							<input type="hidden" id="custId" name="bookTitle"
								value="<%=title%>"> 
							<input type="hidden" id="custId"
								name="book_isbn" value="<%=isbn%>"> 
								
							<!-- input quantity -->
							<input type="button" value="+" id="plus<%=isbn%>" />	
							<input type="number" step="1" id="<%=isbn %>"  value="<%=quantity%>" name="book_quantity"/>	
							<input type="button" value="-" id="minus<%=isbn%>" />	
							
							
							<input
								type="submit" name="submit" value="Edit stocks" />
						</form>
					</td>

				</tr>
				<div>
    <script>
        /* make the button call the function */
        // edit quantities by ISBN, then send to server
        const plusButton<%=isbn%> = document.getElementById("plus<%=isbn%>");
        plusButton<%=isbn%>.addEventListener("click", () => {
            stepOnUp("<%=isbn%>");
            updateVal("<%=isbn%>");
        });

        function stepOnUp(isbn) {
            const input = document.getElementById(isbn);
            const val = 1;

            if (val) {
                /* increment with a parameter */
                input.stepUp(val);
            } else {
                /* or without a parameter. Try it with 0 */
                input.stepUp();
            }
        }

        const minusButton<%=isbn%> = document.getElementById("minus<%=isbn%>");
        minusButton<%=isbn%>.addEventListener("click", () => {
            stepOnDown("<%=isbn%>");
            updateVal("<%=isbn%>");
        });

        function stepOnDown(isbn) {
            const input = document.getElementById(isbn);
            const val = -1;

            if (val) {
                /* increment with a parameter */
                input.stepUp(val);
            } else {
                /* or without a parameter. Try it with 0 */
                input.stepUp();
            }
        }
    </script>
</div>
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