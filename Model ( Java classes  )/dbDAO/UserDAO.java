package dbDAO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

	// added in throws exception to catch database errors
	public static Map<String, String> VerifyLogin(String INPUT_id, String INPUT_password) throws Exception {

		// declaration of hashmap
		Map<String, String> userDetails = new HashMap<>();

		// login boolean validation
		// boolean output = false;
		ResultSet rs;
		String name;
		String password;
		String role;

		int id;

		// get users
		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			// to change password whenever accessing
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=spJEAL602336&serverTimezone=UTC";

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

			// exec
			rs = pstmt.executeQuery();

			while (rs.next()) {
				name = rs.getString("email");
				password = rs.getString("password");
				role = rs.getString("role");

				if (INPUT_id.equals(name) && INPUT_password.equals(password)) {
					// store the values that match into hashmap, later to be returned
					userDetails.put("username", name);
					userDetails.put("role", role);

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

	public static boolean RegisterNewUser(String INPUT_email, String INPUT_password) throws Exception {
		boolean output = false;

		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			// to change password whenever accessing
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=spJEAL602336&serverTimezone=UTC";

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

			// exec
			rs = pstmt.executeQuery();

			while (rs.next()) {
				name = rs.getString("email");
				password = rs.getString("password");
				role = rs.getString("role");

				if (INPUT_id.equals(name) && INPUT_password.equals(password)) {
					// store the values that match into hashmap, later to be returned
					userDetails.put("username", name);
					userDetails.put("role", role);

					break;
				}

			}
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		return output;
	}
}
