package dbDAO;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
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
	
	// book directory
	final static String bookImgFolderDir = "D:\\Eclipse\\school work\\CA1\\CA1\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\user-imgs\\";
	

	// added in throws exception to catch database errors
	
	//returns username and role of logged user
	// request map here
	public static Map<String, Integer> VerifyLogin(String INPUT_id, String INPUT_password) throws Exception {

		// declaration of hashmap
		Map<String, Integer> userDetails = new HashMap<>();

		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		String name;
		String password;
		String role;
		String pic;
		int userid = 0 ;
		

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
				userid = rs.getInt("userid");
				name = rs.getString("email");
				password = rs.getString("password");
				role = rs.getString("role");
				pic = rs.getString("pic");

				if (INPUT_id.equals(name) && INPUT_password.equals(password)) {
					// store the values that match into hashmap, later to be returned
					
					// #########################
					// Main login of getting current logged user
					// #########################
//					userDetails.put("username", name);
//					userDetails.put("role", role);
//					userDetails.put("pic", pic);
//					userDetails.put("userid",userid);
					
					
					// CA2
					// store userid instead
					userDetails.put("userid",userid);

					break;
				}

			}
			
			System.out.println("User ID Logged in : " + userid);
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		// return the redirect
		return userDetails;
	}

	//request map here
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
		
	
		// login boolean validation

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
			String sqlStr = "SELECT COUNT(*) AS count FROM users WHERE userid = ? AND password = ?";
			
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

	// request map here
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
	
	private static String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
	
	public static void changePassword(String INPUT_id,String INPUT_old_password, String INPUT_new_password,String INPUT_confirm_password)throws Exception {
		// to be parseint'ed
		int user_id = Integer.parseInt(INPUT_id);
		
		String old_password = INPUT_old_password;
		String new_password = INPUT_new_password;
		String confirm_password = INPUT_confirm_password;
		
		System.out.println("USERDAO - Changing password of user id : " + user_id);
		
		
		boolean doesMatch = false;
		boolean hasVerified = false;
		
		//check if has inputs 
		if(old_password == "" || new_password == "" || confirm_password == "") {
			throw new Exception("Missing Fields!");
		}else {
			// verify if confirm password inputs are the same
			if(new_password.equals(confirm_password)) {
				doesMatch = true;
			}else {
				throw new Exception("New password and confirm password do not match!");
			}
		}
		
		
		// check if input correct password
		hasVerified = ValidateExists(INPUT_id,old_password);
		System.out.println("UserDAO - User has inputted correct password : " + hasVerified);
		
		if(doesMatch == true && hasVerified == true) {
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object

			// Call routine
			String simpleProc = "update users set password = ? where userid = ?";
			PreparedStatement cs = conn.prepareStatement(simpleProc);

			// insert book values
			cs.setString(1,new_password);
			
			cs.setInt(2, user_id);

			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			int affectedRows = cs.executeUpdate();
			System.out.println("USERDAO - " + affectedRows + " row(s) found successfully.");
			
			
			// Step 7: Close connection
			conn.close();
		}else {
			throw new Exception("Incorrect Password!");
		}
		
		
	}
	
	// request map here
	public static void editProfile(String INPUT_id,String INPUT_email, Part user_pic, String user_first_name, String user_last_name, String user_contact, String user_address) throws Exception{
		Part filePart = user_pic;
		//process picture
		 String fileName = getFileName(filePart); 
	        System.out.println("Selected Picture : " + fileName);
	        
			String picture = fileName;
			
			// if has no picture input from user
			if(picture.trim().isBlank()) {
				picture = "default_cover.png";
			}
			
			// Save the file to book-imgs folder
	        File outputFile = new File(bookImgFolderDir + picture);
	        System.out.println("BookDAO - File is being stored at directory : " + outputFile.getAbsolutePath());
	        
		
	        try (InputStream inputStream = filePart.getInputStream()) {
	            Files.copy(inputStream, outputFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
	        }
		
		String i = INPUT_id;
		
		
		
		int USER_ID = Integer.parseInt(i);
		
		
		
		String USER_EMAIL = INPUT_email;

		Part USER_PIC = user_pic;
		String USER_FIRST_NAME = user_first_name;
		String USER_LAST_NAME = user_last_name;
		String USER_CONTACT = user_contact;
		String USER_ADDRESS = user_address;

		

    		Class.forName("com.mysql.jdbc.Driver");

    		// Step 2: Define Connection URL
    		String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

    		// Step 3: Establish connection to URL
    		Connection conn = DriverManager.getConnection(connURL);
    		// Step 4: Create Statement object

    		// Call routine
    		String simpleProc = "{ call editUser(?,?,?,?,?,?,?) }";
    		CallableStatement cs = conn.prepareCall(simpleProc);

    		// insert book values
    		cs.setInt(1, USER_ID);
    		
    		cs.setString(2, USER_EMAIL);

    		cs.setString(3, fileName);
    		cs.setString(4, USER_FIRST_NAME);
    		cs.setString(5, USER_LAST_NAME);
    		cs.setString(6, USER_CONTACT);
    		cs.setString(7, USER_ADDRESS);
    		
    		// Step 5: Execute SQL Command
    		//String sqlStr = "SELECT * FROM member";         
    		
    		
    		
    		int affectedRows = cs.executeUpdate();
    		System.out.println("USERDAO - " + affectedRows + " row(s) deleted successfully.");
    		
    		
    		// Step 7: Close connection
    		conn.close();
    	}
    	
	
	public static void editUser(String INPUT_id,String INPUT_email, String user_first_name, String user_last_name, String user_contact, String user_address,String user_role) throws Exception{

		
		String i = INPUT_id;
		
		
		
		int USER_ID = Integer.parseInt(i);
		
		
		
		String USER_EMAIL = INPUT_email;


		String USER_FIRST_NAME = user_first_name;
		String USER_LAST_NAME = user_last_name;
		String USER_CONTACT = user_contact;
		String USER_ADDRESS = user_address;
		String USER_ROLE = user_role;
		
    
    		Class.forName("com.mysql.jdbc.Driver");

    		// Step 2: Define Connection URL
    		String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

    		// Step 3: Establish connection to URL
    		Connection conn = DriverManager.getConnection(connURL);
    		// Step 4: Create Statement object

    		// Call routine
    		String simpleProc = "{ call editUserWithRole(?,?,?,?,?,?,?,?) }";
    		CallableStatement cs = conn.prepareCall(simpleProc);

    		// insert book values
    		cs.setInt(1, USER_ID);
    		
    		cs.setString(2, USER_EMAIL);

    	
    		cs.setString(3, USER_FIRST_NAME);
    		cs.setString(4, USER_LAST_NAME);
    		cs.setString(5, USER_CONTACT);
    		cs.setString(6, USER_ADDRESS);
    		cs.setString(7, USER_ROLE);
    		// Step 5: Execute SQL Command
    		//String sqlStr = "SELECT * FROM member";         
    		
    		
    		
    		int affectedRows = cs.executeUpdate();
    		System.out.println("USERDAO - " + affectedRows + " row(s) deleted successfully.");
    		
    		
    		// Step 7: Close connection
    		conn.close();
    	}
    	
	
	public static void saveSession(String session_id,int INPUT_userid) throws Exception {
			
			
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
				//pstmt.setString(2, INPUT_username);
				//pstmt.setString(3, INPUT_role);
	
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
	public static Map<String, Integer> loadSession(String session_id) throws Exception {
		
		
		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		
		// SELECT COUNT(*) AS count FROM users WHERE email = ? AND password = ? returns the number of rows that are the same when condition is met.
		int affectedRows = 0;
		String username = "";
		String role = "";
		int userid = 0;
		
		
		Map<String, Integer> userDetails = new HashMap<>();

	
	
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
//				username = rs.getString("username");
//				role = rs.getString("role");
				userid = rs.getInt("userid");
				

			}
			System.out.println("UserDAO: Username - " + username);
			System.out.println("UserDAO: role - " + username);
			System.out.println("UserDAO: ID - " + userid);
			
			// store the values that match into hashmap, later to be returned
//			userDetails.put("username",username);
//			userDetails.put("role", role);
			userDetails.put("userid", userid);


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