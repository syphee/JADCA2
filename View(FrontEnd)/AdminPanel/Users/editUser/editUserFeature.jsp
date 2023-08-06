<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="dbDAO.sqlPassword"%>
<%@ include file="../../scriplets/AdminLoginValidation.jsp"%>
<%@ include file="../../scriplets/validationScriptlet.jsp"%>
<%@ include file="../../wrapper/wrapper1.jsp"%>

<%
String search = "";
try{
	search = request.getParameter("search");
	
	// set search to blankspace upon page load
	if(search == null){
		search = "";
	}
	System.out.println("\nSearching for " + search + " in DELETEUSER.jsp");
}catch(Exception ex){
	ex.printStackTrace();
}



%>
<%
String output = "";
%>
	<div>
		<header>
			<h1 class="fs-1">Edit User</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">
		<label>Search Query for : <%=search %></label>
		<form method="post" action="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/editUser/editUserFeature.jsp">
			<input type="text" id="search"
					placeholder="Search for User" name="search" aria-label="Username"
					aria-describedby="basic-addon1">
			
			 <input type="submit">
		
		</form>

		<!-- https://stackoverflow.com/questions/5967564/form-inside-a-table -->
		<!-- table below associated with form -->


		<table class="table border col">
			<thead>
				<tr class="row">
					<td class="col" >Picture</td>
					<td class="col">User ID</td>

					<td class="col">Email</td>
					<td class="col">Role</td>
					<td class="col">First Name</td>
					<td class="col">Last Name</td>
					<td class="col">Contact Number</td>
					<td class="col">Address</td>
					<td class="col">



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
				String edit_first_name = "";
				String edit_last_name = "";
				String edit_contact_number = "";
				String edit_address = "";
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
					String sqlStr = "SELECT * from users where email like CONCAT('%', ? , '%')";
					//
					PreparedStatement pstmt2 = conn2.prepareStatement(sqlStr);
					
					pstmt2.setString(1, search);
					// execute query
					rs2 = pstmt2.executeQuery();

					while (rs2.next()) {
						edit_user_id = rs2.getInt("userid");
						edit_email = rs2.getString("email");
						edit_user_role = rs2.getString("role");
						edit_user_pic = rs2.getString("pic");
						edit_first_name = rs2.getString("first_name");
						edit_last_name = rs2.getString("last_name");
						edit_contact_number = rs2.getString("contact_number");
						edit_address = rs2.getString("address");
				%>

				<form class="form form-login"
					action="<%=request.getContextPath()%>/editUserInformation" method="post"
					>

					<tr class="row">

						<td class="col"><img
							src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/user-imgs/<%=edit_user_pic%>"
							style="max-width: 100px;" /></td>
							<td class="col"><%=edit_user_id %></td>

						<td class="col"><input type="text" id="custId" name="user_email"
							value="<%=edit_email%>" disabled></td>
						<td class="col">
							  <div class="form-check">
							  
							  <%
							  if(edit_user_role.equals("admin")){
							  %>
                                <input class="form-check-input" type="radio" name="user_role" value="admin" id="flexRadioDefault1" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Admin
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="user_role" value="user"  id="flexRadioDefault2" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  User
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="user_role" value="reseller"  id="flexRadioDefault2" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Reseller
                                </label>
                              </div>
                              <%} %>
                              
                              <%
                              if(edit_user_role.equals("user")){
							  %>
                                <input class="form-check-input" type="radio" name="user_role" value="admin" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Admin
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="user_role" value="user"  id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                  User
                                </label>
                              </div>
                               <div class="form-check">
                                <input class="form-check-input" type="radio" name="user_role" value="reseller"  id="flexRadioDefault2" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Reseller
                                </label>
                              </div>
                              <%} %>
                              
                               <%
                              if(edit_user_role.equals("reseller")){
							  %>
                                <input class="form-check-input" type="radio" name="user_role" value="admin" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Admin
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="user_role" value="user"  id="flexRadioDefault2" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  User
                                </label>
                              </div>
                               <div class="form-check">
                                <input class="form-check-input" type="radio" name="user_role" value="reseller"  id="flexRadioDefault2" checked >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Reseller
                                </label>
                              </div>
                              <%} %>
                              
                              
						</td>
						<td class="col"><input type="text" id="custId" name="user_first_name"
							value="<%=edit_first_name%>" ></td>
						
						<td class="col"><input type="text" id="custId" name="user_last_name"
							value="<%=edit_last_name%>" ></td>
						
						<td class="col"><input type="text" id="custId" name="user_contact"
							value="<%=edit_contact_number%>"></td>
						
						<td class="col"><input type="text" id="custId" name="user_address"
							value="<%=edit_address%>"></td>
						

						<td class="col">
						<input type="hidden" name="user_id" value="<%=edit_user_id %>"/>
						<input type="submit" name="submit"
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






<%@ include file="../../wrapper/wrapper2.jsp"%>
