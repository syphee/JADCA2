<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@
page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%!
// validation of login

public boolean VerifyLogin(String INPUT_id,String INPUT_password){
	
	// login boolean validation
	//boolean output = false;
	ResultSet rs;
	String name;
	String password;
	int id;
	boolean output = false;
	
	
	// get users
	try {
    	
        // Step1: Load JDBC Driver
         Class.forName("com.mysql.jdbc.Driver");  

        // Step 2: Define Connection URL
        String connURL = "jdbc:mysql://localhost/db1?user=root&password=spJEAL602336&serverTimezone=UTC";

        // Step 3: Establish connection to URL
        Connection conn = DriverManager.getConnection(connURL); 
       // Step 4: Create Statement object
        Statement stmt = conn.createStatement();
        // Step 5: Execute SQL Command
        String sqlStr = "SELECT * FROM member WHERE name=? AND password=?";         
        //
        PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    
	    // store query
	    // 1 stands for the name,2 for id
	    pstmt.setString(1,INPUT_id);
	    pstmt.setString(2,INPUT_password);
	    
	 
	    // exec
	    rs = pstmt.executeQuery();
	    
	    while (rs.next()) {                                
	    	 name = rs.getString("name");     
	    	 password = rs.getString("password");
        
        
        
        // Old Method, not used preparedstatement---------------
        
        //ResultSet rs = stmt.executeQuery(sqlStr);

        // Step 6: Process Result - validation of login
        //boolean hasValidated = false;
        
        // search for user in DB
        
        //while (hasValidated == false) {
        //	while(rs.next()){
        //   int id = rs.getInt("id");
        //    String user = rs.getString("name");
        //    String password = rs.getString("password");
            
	    //    System.out.println ("ID:" + id + ", Name:" + user );
	        
	       if(INPUT_id.equals(name) && INPUT_password.equals(password) ){

			output = true ;
			break;
	        }

	    }
        // Step 7: Close connection
        conn.close();
   } catch (Exception e) {
      System.out.println("Error :" + e);
   }
	
	// return the redirect
	return output;
}
%>

<%
String loginid = request.getParameter("loginid");
String password = request.getParameter("password");

String output = "";



//to redirect user if tries to bypass login by entering http://localhost:8080/Practical_2/Practical%202/VerifyUser.jsp without logging in
if(loginid == null || password == null){
	response.sendRedirect("login.jsp");
}else{
	
	// for loop to check here
	if (VerifyLogin(loginid,password)) {
	
		
		// to store session id
		
		
		
		
		System.out.println("Logged in!");
		response.sendRedirect("./../View(FrontEnd)/home.jsp");
	}else{
		response.sendRedirect("login.jsp?errCode=invalidLogin");
		output = "You have entered an invalid ID/Password";
		System.out.println(output);
	}
}



// Table section
String table_out = "";

// count from 1  to 5
for (int i = 1; i <= 5; i++) {

	// opening schematic for tr
	table_out += "<tr>";
	// for each row, output <td>

	table_out += "<td>" + i + " x 5" + "</td>";

	table_out += "<td>" + (i*5) + "</td>";
	
	
	
	// close schematic for tr
	table_out += "</tr>";
}

output = table_out;

%>





<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, td {
	border: 1px solid black;
}
</style>

</head>

<body>


	<label>Your Login ID is :<%=loginid%>
	</label>
	<br>
	<label>Your Password is : <%=password%></label>

	<div id="output">
		<table>
			<%=output%>
		</table>

	</div>

	<a href="customMTable.jsp"> Part 5 : Do it yourself </a>

	<a href="Part6.jsp"> Part 6 : Challenge </a>


</body>
</html>