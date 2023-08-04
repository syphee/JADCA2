package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

//	public DBConnection() {
//		// TODO Auto-generated constructor stub
//	}

	public static Connection getConnection() {
		
		String password = sqlPassword.getSQLPassword();
		
		String dbUrl = "jdbc:mysql://localhost/jadca1";
		String dbUser = "root";
		String dbPassword = password;
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
			e.printStackTrace();
		}
		
		return connection;
	}
}
