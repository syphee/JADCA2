
<%
String user = "";
String role = "";
String pic = "";
int id = 0;

boolean rememberMe = false;

Cookie[] cookies = request.getCookies();

for (Cookie cookie : cookies) {
	if (cookie.getName().equals("rememberMe")) {
		if (cookie.getValue().equals("true")) {
	rememberMe = true;
		}
	}
}

// if user has enabled remember me
// login and save session id
if (cookies != null && rememberMe) {
	System.out.println("HOME.JSP - User has selected to remember me");
	System.out.println("HOME.JSP - Finding session ID");
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("session_id")) {
	// check if has value in session id
	if (!cookie.getValue().isEmpty()) {
		String session_id = cookie.getValue();
		Map<String, String> userDetails = UserDAO.loadSession(session_id);

		// to query db about sesh id and link values
		user = userDetails.get("username");
		role = userDetails.get("role");
		if (!user.isEmpty() || !role.isEmpty()) {
			// check if has input from params
			System.out.println("Current logged by cookie: " + user);

			session.setAttribute("username", user);
			session.setAttribute("role", role);
			session.setAttribute("pic", pic);

			break;
		} else {
			response.sendRedirect("login.jsp");
			break;
		}
	} else {
		try {
			user = session.getAttribute("username").toString();
			role = session.getAttribute("role").toString();
			pic = session.getAttribute("pic").toString();

		} catch (Exception ex) {
			System.out.println("Login failed.");
			response.sendRedirect("login.jsp");
		}
	}
		}
	}
} else {
	System.out.println("HOME.JSP - User normal login");
	try {
		user = session.getAttribute("username").toString();
		role = session.getAttribute("role").toString();
		pic = session.getAttribute("pic").toString();

	} catch (Exception ex) {
		System.out.println("Login failed.");
		response.sendRedirect("login.jsp");
	}
}
%>