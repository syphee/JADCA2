<div class="row accordion-body accordion-collapse collapse"
	id="editUser" data-bs-parent="#arkCONTENT">
	<div>
		<header>
			<h1 class="fs-1">Edit User</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">

		<!-- https://stackoverflow.com/questions/5967564/form-inside-a-table -->
		<!-- table below associated with form -->


		<table class="table border col">
			<thead>
				<tr class="row">
					<td class="col">Picture</td>

					<td class="col">Email</td>
					<td class="col">Role</td>
					<td class="col"></td>

					<!-- to add statistics of book rentals here in the future, will need to rework on SQL table -->
				</tr>
			</thead>
			<tbody>

				<!-- scriplet here -->
				<%
				
				int edit_user_id = 0;
				String edit_email = "";
				String edit_user_role = "";
				String edit_user_pic = "";
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
					String sqlStr = "SELECT * from users";
					//
					PreparedStatement pstmt2 = conn2.prepareStatement(sqlStr);

					// execute query
					rs2 = pstmt2.executeQuery();

					while (rs2.next()) {
						edit_user_id = rs2.getInt("userid");
						edit_email = rs2.getString("email");
						edit_user_role = rs2.getString("role");
						edit_user_pic = rs2.getString("pic");
				%>

				<form class="form form-login"
					action="<%=request.getContextPath()%>/editUser" method="post"
					>

					<tr class="row">

						<td class="col"><img
							src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/user-imgs/<%=edit_user_pic%>"
							style="max-width: 100px;" /></td>

						<td class="col"><input type="text" id="custId" name="email"
							value="<%=edit_email%>" disabled></td>
						<td class="col">
							  <div class="form-check">
							  
							  <%
							  if(edit_user_role.equals("admin")){
							  %>
                                <input class="form-check-input" type="radio" name="userRole" value="admin" id="flexRadioDefault1" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Admin
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="userRole" value="user"  id="flexRadioDefault2" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  User
                                </label>
                              </div>
                              <%} %>
                              
                              <%
                              if(edit_user_role.equals("user")){
							  %>
                                <input class="form-check-input" type="radio" name="userRole" value="admin" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Admin
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="userRole" value="user"  id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                  User
                                </label>
                              </div>
                              <%} %>
                              
                              
						</td>
						

						<td class="col"><input type="submit" name="submit"
							value="Edit User" /></td>
					</tr>
				</form>


				<%
				}
				// Step 7: Close connection

				conn2.close();
				} catch (Exception e) {
				System.out.println("Error :" + e);
				e.printStackTrace();
				}
				%>



			</tbody>
		</table>
	</div>





</div>