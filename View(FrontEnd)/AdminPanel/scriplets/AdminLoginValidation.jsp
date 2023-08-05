<%

// to store logged user info
Map<String, String> LoggedUserInformation = new HashMap<>();

String user = "";
String role = "";
String pic = "";
String first_name = "";
String last_name = "";
String contactNumber = "";

int userid = 0;

boolean rememberMe = false;

Cookie[] cookies = request.getCookies();

for (Cookie cookie : cookies) {

	if (cookie.getName().equals("rememberMe")) {
		if (cookie.getValue().equals("true")) {
	rememberMe = true;
		}

	}

}

// if user has enabled remmeber me
// login and save session id

if (cookies != null && rememberMe == true) {
	System.out.println("HOME.JSP - User has selected to remember me");
	System.out.println("HOME.JSP - Finding session ID");
	for (Cookie cookie : cookies) {

		if (cookie.getName().equals("session_id")) {
	// check if has value in session id

	if (cookie.getValue().isEmpty() != true) {
		String session_id = cookie.getValue();

		// CA2 - Changed from String, string to String,Integer
		Map<String, Integer> userDetails = UserDAO.loadSession(session_id);

		// to query db about sesh id and link values

		userid = userDetails.get("userid");
		if (user.isEmpty() != true || role.isEmpty() != true) {
			// check if has input from params

			System.out.println("Current logged by cookie : " + user);

			//session.setAttribute("username", user);
			//session.setAttribute("role", role);
			//session.setAttribute("pic",pic);

			// CA2
			// Get user by userid instead
			session.setAttribute("userid", user);
			getUserDetails(userid);
			// then query db for userid details
			
			
			
			break;

		} else {
			response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp");
			break;
		}

		// has no cookies
	} else {
		try {
			userid = (Integer) session.getAttribute("userid");
			System.out.println("home.jsp - UserID Logged in :" + userid);
			
			LoggedUserInformation = getUserDetails(userid);
			
			user = LoggedUserInformation.get("user");
			System.out.println("AdminPanel.jsp - Logged in user : " + user);
			role = LoggedUserInformation.get("role");
			pic = LoggedUserInformation.get("pic");
			first_name = LoggedUserInformation.get("first_name");
			last_name = LoggedUserInformation.get("last_name");
			contactNumber = LoggedUserInformation.get("contact_number");
			
			if (role.equals("admin") != true || role == null) {
				System.out.println("No permissions!");
				response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp");
			}
		} catch (Exception ex) {
			System.out.println("login failed.");
			response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp");
		}

	}

		}

	}

	// if user decides not to use the rememberMe functionality
} else {
	System.out.println("AdminPanel.JSP - User normal login");
	try {
		//user = session.getAttribute("username").toString();
		//role = session.getAttribute("role").toString();
		//pic = session.getAttribute("pic").toString();
		userid = (Integer) session.getAttribute("userid");
		getUserDetails(userid);
		
		System.out.println("home.jsp - UserID Logged in :" + userid);
		
		LoggedUserInformation = getUserDetails(userid);
		
		user = LoggedUserInformation.get("user");
		System.out.println("home.jsp - Logged in user : " + user);
		role = LoggedUserInformation.get("role");
		pic = LoggedUserInformation.get("pic");
		first_name = LoggedUserInformation.get("first_name");
		last_name = LoggedUserInformation.get("last_name");
		contactNumber = LoggedUserInformation.get("contact_number");
		
		if (role.equals("admin") != true || role == null) {
			System.out.println("No permissions!");
			response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp");
		}
		
	} catch (Exception ex) {
		System.out.println("login failed.");
		response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp");
	}
}
%>

<%!// get user by ID function
	public Map<String, String> getUserDetails(int userid) {
		final String SQLpassword = sqlPassword.getSQLPassword();
		
		Map<String, String> userDetails = new HashMap<>();
		
		
		ResultSet rs;

		String user = "";
		String role = "";
		String pic = "";
		String first_name = "";
		String last_name = "";
		String contactNumber = "";

		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			// to change password whenever accessing

			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command
			String sqlStr = "SELECT * from users WHERE userid = ? ";
			//
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// store query
			// 1 stands for the name,2 for id
			pstmt.setInt(1, userid);

			// exec
			rs = pstmt.executeQuery();

			while (rs.next()) {
				user = rs.getString("email");
				role = rs.getString("role");
				userid = rs.getInt("userid");
				pic = rs.getString("pic");
				first_name = rs.getString("first_name");
				last_name = rs.getString("last_name");
				contactNumber = rs.getString("contact_number");

			}
			System.out.println("Username - " + user);
			System.out.println("role - " + role);
			System.out.println("ID - " + userid);
			
			userDetails.put("user",user);
			userDetails.put("role",role);
			userDetails.put("pic",pic);
			userDetails.put("first_name",first_name);
			userDetails.put("last_name",last_name);
			userDetails.put("contact_number",contactNumber);
			
			// Step 7: Close connection
			conn.close();
			return userDetails;
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
		return userDetails;
	}%>
