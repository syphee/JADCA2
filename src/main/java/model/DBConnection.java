package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

//	public DBConnection() {
//		// TODO Auto-generated constructor stub
//	}

	public static Connection getConnection() {
		
		String dbUrl = "jdbc:mysql://localhost/db1";
		String dbUser = "root";
		String dbPassword = "Minecrafr@09";
		String dbClass = "com.mysql.jdbc.Driver";
		
		Connection connection = null;
		
		try {
			Class.forName(dbClass);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			connection = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		} catch (SQLException e) {
		    System.err.println("Connection failed! Error message: " + e.getMessage());

		}
		
		return connection;
	}
}
