<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.UserDAO"%>
<%@page import="model.sqlPassword"%>
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
			<h1 class="fs-1">Delete User</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">
		<label>Search Query for : <%=search %></label>
		<form method="post" action="<%=request.getContextPath() %>/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/deleteUser/deleteUserFeature.jsp">
			<input type="text" id="search"
					placeholder="Search for User" name="search" aria-label="Username"
					aria-describedby="basic-addon1">
		
			

		</select> <input type="submit">
		
		</form>

		<!-- https://stackoverflow.com/questions/5967564/form-inside-a-table -->
		<!-- table below associated with form -->


		<table class="table border col">
			<thead>
				<tr class="row">
					<td class="col">Picture</td>

					<td class="col">Email</td>
					<td class="col">First Name</td>
					<td class="col">Last Name</td>
					<td class="col">Contact Number</td>
					<td class="col">Address</td>
					<td class="col"></td>
					<!-- to add statistics of book rentals here in the future, will need to rework on SQL table -->
				</tr>
			</thead>
			<tbody>

				<!-- scriplet here -->
				
<%
									// to retrieve all genres from DB
									try {
										
										int user_id = 0;
										 
										 
										 
										 String user_email = "";
										
										 String user_pic = "";
										 String user_first_name = "";
										 String user_last_name = "";
										 String user_contact = "";
										 String user_address = "";

										// Step1: Load JDBC Driver
										Class.forName("com.mysql.jdbc.Driver");

										// Step 2: Define Connection URL
										// to change password whenever accessing
										String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

										

										String contextPath = request.getContextPath();
										
										// to display all
										output = "";
										
										ResultSet rs;

										// Step 3: Establish connection to URL
										Connection conn = DriverManager.getConnection(connURL);
										// Step 4: Create Statement object
										Statement stmt = conn.createStatement();
										// Step 5: Execute SQL Command

										String simpleProc = "select * from users where email like CONCAT('%', ? , '%')";
										PreparedStatement pstmt = conn.prepareStatement(simpleProc);
										
										pstmt.setString(1,search);
										// execute query
										rs = pstmt.executeQuery();

										while (rs.next()) {
											user_id = rs.getInt("userid");
											user_email = rs.getString("email");
											user_pic = rs.getString("pic");
											user_first_name = rs.getString("first_name");
											user_last_name = rs.getString("last_name");
											user_contact = rs.getString("contact_number");
											user_address = rs.getString("address");
									%>

				<form class="form form-login"
					action="<%=request.getContextPath()%>/deleteUser" method="post"
					id="deleteUser">

					<tr class="row">

						<td class="col"><img
							src="<%=contextPath%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/user-imgs/<%=user_pic%>"
							style="max-width: 100px;" /></td>

						<td class="col"><input type="text" id="custId" name="email"
							value="<%=user_email%>" disabled></td>
						<td class="col"><input type="text" id="custId" name="role"
							value="<%=user_first_name%>" disabled></td>
						<td class="col"><input type="text" id="custId" name="role"
							value="<%=user_last_name%>" disabled></td>
						<td class="col"><input type="text" id="custId" name="role"
							value="<%=user_contact%>" disabled></td>
						<td class="col"><input type="text" id="custId" name="role"
							value="<%=user_address%>" disabled></td>
						
						
						<td class="col">
						<input type="hidden" name="user_id" value="<%=user_id %>"/>
						<input type="submit" name="submit"
							value="Delete User" /></td>
					</tr>
				</form>


				<%
				}
				// Step 7: Close connection

				conn.close();
				} catch (Exception e) {
				System.out.println("Error :" + e);
				e.printStackTrace();
				}
				%>



			</tbody>
		</table>
	</div>






<%@ include file="../../wrapper/wrapper2.jsp"%>
