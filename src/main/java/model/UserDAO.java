package model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

// used hashmap as it is similar to how json stores values based on key values.
//Object logindetails = {
//		name:"",
//		password:"",
//		role:""
//}

// to store , do <hashmap var name>.put(<key name here>,value)
// to get , <hashmap var name>.get(<key name here>)


import java.sql.*;

public class UserDAO {
	
	// change ur sql password here
	final static String SQLpassword = sqlPassword.getSQLPassword();
	

	// added in throws exception to catch database errors
	
	//returns username and role of logged user
	public static Map<String, String> VerifyLogin(String INPUT_id, String INPUT_password) throws Exception {

		// declaration of hashmap
		Map<String, String> userDetails = new HashMap<>();

		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		String name;
		String password;
		String role;
		String pic;
		String id;

		// get users
		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			// to change password whenever accessing
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";


			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command
			String sqlStr = "SELECT * from users WHERE email = ? AND password = ?";
			//
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// store query
			// 1 stands for the name,2 for id
			pstmt.setString(1, INPUT_id);
			pstmt.setString(2, INPUT_password);

			// execute query
			rs = pstmt.executeQuery();

			while (rs.next()) {
				name = rs.getString("email");
				password = rs.getString("password");
				role = rs.getString("role");
				pic = rs.getString("pic");
				id= rs.getString("userid");

				if (INPUT_id.equals(name) && INPUT_password.equals(password)) {
					// store the values that match into hashmap, later to be returned
					userDetails.put("username", name);
					userDetails.put("role", role);
					userDetails.put("pic", pic);
					//convert to Int when (parseInt)session.getAttribute(userid);
					userDetails.put("userid", id);

					break;
				}

			}
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		// return the redirect
		return userDetails;
	}

	public static String RegisterNewUser(String INPUT_email, String INPUT_password) throws Exception {

		
		// To return username upon successful registration
		String output = "";
		
		int AffectedRows = 0;
		
		// validate if it is really an email
		if(INPUT_email.contains("@")) {
			try {

				// Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver");

				// Step 2: Define Connection URL
				// to change password whenever accessing

				String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);
				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();
				// Step 5: Execute SQL Command
				
				//customers should have the role "users" only. 
				String sqlStr = "insert into users(email,password,role) values(?,?,\"user\")";
				//
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);

				// store query
				// 1 stands for the name,2 for id
				pstmt.setString(1, INPUT_email);
				pstmt.setString(2, INPUT_password);

				// execute query
				AffectedRows = pstmt.executeUpdate();

				System.out.println(AffectedRows + " row(s) inserted successfully.");
		
			    
				// Step 7: Close connection
				conn.close();
			} catch (Exception e) {
				System.out.println("Error :" + e);
			}

		}else {
			System.out.println("Not an email!");
		}
		
		
		// if has successfully inserted rows
		if(AffectedRows > 0) {
			output = INPUT_email;
		}
		

		return output;
	}
	
	public static boolean ValidateExists(String INPUT_id, String INPUT_password) throws Exception {
		
		
		// validate if does exists , reject creation of new user
		boolean doesExist = false;
		
		// declaration of hashmap
		Map<String, String> userDetails = new HashMap<>();

		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		
		// SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ? returns the number of rows that are the same when condition is met.
		int affectedRows = 0;



		// get users
		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			// to change password whenever accessing

			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";


			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command
			String sqlStr = "SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ?";
			
			//
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// store query
			// 1 stands for the name,2 for id
			pstmt.setString(1, INPUT_id);
			pstmt.setString(2, INPUT_password);

			// exec
			rs = pstmt.executeQuery();

			while (rs.next()) {
				affectedRows = rs.getInt("count");
				
				
			}
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		// if count is more than 0, means that users with the same name already exists
		if(affectedRows > 0) {
			doesExist = true;
		}
		System.out.println("Matching users : " + affectedRows);
		
		return doesExist;
	}

	
	public static void deleteUser(String INPUT_id) throws Exception {
		String i = INPUT_id;
		
		int USER_ID = Integer.parseInt(i);
    	
    	Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		// Step 4: Create Statement object

		// Call routine
		String simpleProc = "{ call deleteUser(?) }";
		CallableStatement cs = conn.prepareCall(simpleProc);

		// insert book values
		cs.setInt(1, USER_ID);
		
		
		// Step 5: Execute SQL Command
		//String sqlStr = "SELECT * FROM member";         
		
		
		
		int affectedRows = cs.executeUpdate();
		System.out.println("USERDAO - " + affectedRows + " row(s) deleted successfully.");
		
		
		// Step 7: Close connection
		conn.close();
	}
	
	public static void editUser(String INPUT_id,String INPUT_role) throws Exception{
		String i = INPUT_id;
		String USER_ROLE = "";
		
		int USER_ID = Integer.parseInt(i);
		
		if(INPUT_role.equals("admin") || INPUT_role.equals("user")){
			USER_ROLE = INPUT_role;
		}else {
			throw new Exception("Input was not admin / user!");
		}
    	
    	Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		// Step 4: Create Statement object

		// Call routine
		String simpleProc = "{ call editUser(?,?) }";
		CallableStatement cs = conn.prepareCall(simpleProc);

		// insert book values
		cs.setInt(1, USER_ID);
		cs.setString(2, USER_ROLE);
		
		
		// Step 5: Execute SQL Command
		//String sqlStr = "SELECT * FROM member";         
		
		
		
		int affectedRows = cs.executeUpdate();
		System.out.println("USERDAO - " + affectedRows + " row(s) deleted successfully.");
		
		
		// Step 7: Close connection
		conn.close();
	}
	public static void saveSession(String session_id,String INPUT_username, String INPUT_role) throws Exception {
			
			
			// login boolean validation
			// boolean output = false;
			ResultSet rs;
			
			// SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ? returns the number of rows that are the same when condition is met.
			int affectedRows = 0;
	
	
	
			// get users
			try {
	
				// Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver");
	
				// Step 2: Define Connection URL
				// to change password whenever accessing

				String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

	
				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);
				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();
				// Step 5: Execute SQL Command
				String sqlStr = "insert into remember_me (session_id,username,role) values(?,?,?)";
				
				//
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	
				// store query
				// 1 stands for the name,2 for id
				pstmt.setString(1, session_id);
				pstmt.setString(2, INPUT_username);
				pstmt.setString(3, INPUT_role);
	
				// exec
				affectedRows = pstmt.executeUpdate();
	
			
				// Step 7: Close connection
				conn.close();
			} catch (Exception e) {
				System.out.println("Error :" + e);
			}
	
			
		}
	public static void deleteSession(String session_id) throws Exception {
		
		
		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		
		// SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ? returns the number of rows that are the same when condition is met.
		int affectedRows = 0;

	
	
	
		// get users
		try {
	
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
	
			// Step 2: Define Connection URL
			// to change password whenever accessing

			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

	
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command

			String sqlStr = "delete from remember_me where session_id = ?";
			
			//
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	
			// store query
			// 1 stands for the name,2 for id
			pstmt.setString(1, session_id);
			
	
			// exec
			affectedRows = pstmt.executeUpdate();
	
			System.out.println("Affected rows deletion : " + affectedRows);
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

	
		
	}
	public static Map<String, String> loadSession(String session_id) throws Exception {
		
		
		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		
		// SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ? returns the number of rows that are the same when condition is met.
		int affectedRows = 0;
		String username = "";
		String role = "";
		
		
		Map<String, String> userDetails = new HashMap<>();

	
	
		// get users
		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			// to change password whenever accessing

			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";


			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command
			String sqlStr = "SELECT * from remember_me WHERE session_id = ? ";
			//
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// store query
			// 1 stands for the name,2 for id
			pstmt.setString(1, session_id);


			// exec
			rs = pstmt.executeQuery();

			while (rs.next()) {
				username = rs.getString("username");
				role = rs.getString("role");


			}
			System.out.println("UserDAO: Username - " + username);
			System.out.println("UserDAO: role - " + username);
			
			// store the values that match into hashmap, later to be returned
			userDetails.put("username",username);
			userDetails.put("role", role);



			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return userDetails;
	
		
	}


	    // Other methods in the UserDAO class
	    
	    public static int getUserId(HttpSession session) {
	    	
	        int userid = 0; // Default value if no matching user found

	        // Retrieve the username or email from the session
	        String username = (String) session.getAttribute("username");
	        String email = (String) session.getAttribute("email");
	        
	        // Create a database connection

	        
	        
	        
	        
	        try {
	            // Load the JDBC driver
	            Class.forName("com.mysql.jdbc.Driver");

	            
				String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

				
				
	            // Establish the database connection
				Connection conn = DriverManager.getConnection(connURL);

				
	            // Prepare the SQL statement
	            String sqlstr = "SELECT userid FROM users WHERE username = ? OR email = ?";
	            PreparedStatement statement = conn.prepareStatement(sqlstr);
	            statement.setString(1, username);
	            statement.setString(2, email);

	            // Execute the query
	            ResultSet resultSet = statement.executeQuery();

	            // Retrieve the userid from the result set
	            if (resultSet.next()) {
	                userid = resultSet.getInt("userid");
	                
	            }
	            
	            // Close the resources
	            resultSet.close();
	            statement.close();
	            conn.close();
	            
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	        return userid;
	    }
	

	
}