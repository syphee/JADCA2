package dbDAO;
import java.time.LocalDate;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;  
import java.util.Date;  

import java.util.regex.*;

public class BookDAO {
	public static void AddBook(String INPUT_title, String INPUT_author, String INPUT_price, String INPUT_quantity,
			String INPUT_pub_date, String INPUT_genre,String INPUT_ISBN, String INPUT_rating, String INPUT_description,
			String INPUT_picture) throws Exception {
		
		//declaration of variables
		String title = sanitizeInput(INPUT_title);
		String author = sanitizeInput(INPUT_author);
		String ISBN = "";
		if(INPUT_ISBN.length() == 13) {
			ISBN = sanitizeInput(INPUT_ISBN);
		}else {
			throw new Exception("ISBN must be of 13 numbers!");
		}
		
		double price = Double.parseDouble(sanitizeInput(INPUT_price));
		double rating = Double.parseDouble(sanitizeInput(INPUT_rating));
		
		int quantity = Integer.parseInt(sanitizeInput(INPUT_quantity));
		
		String date;
		
		// if date is empty, will assign current date of book
		if(INPUT_pub_date.isBlank()) {
			String i = LocalDate.now().toString();
			date = new SimpleDateFormat("dd/MM/yyyy").parse(i).toString();
		}else {
			date = new SimpleDateFormat("dd/MM/yyyy").parse(INPUT_pub_date).toString();
		}
		
		String genre = sanitizeInput(INPUT_genre);
		
		String description = sanitizeInput(INPUT_description);
		
		
		// to sanitize on part 2
		String picture = INPUT_picture;
		
		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=root&password=spJEAL602336&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object

			// Call routine
			String simpleProc = "{ call addBook(?,?,?,?,?,?,?,?,?,?) }";
			CallableStatement cs = conn.prepareCall(simpleProc);

			// insert book values
			cs.setString(1, title);
			cs.setString(2, author);
			cs.setDouble(3, price);
			cs.setInt(4, quantity);
			cs.setDate(5, java.sql.Date.valueOf(date));
			cs.setString(6, ISBN);
			cs.setString(7, genre);
			cs.setDouble(8, rating);
			cs.setString(9, description);
			cs.setString(10, picture);
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			int affectedRows = cs.executeUpdate();
			System.out.println(affectedRows + " row(s) inserted successfully.");
			
			
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
		
		
		

		// To parse values :
		// if no input from pub date, take date today
		
		

	}

	// input is the value taken in,
	// method is the data type of the value, input will be parsed according to type
	public static String sanitizeInput(String UNSANITIZED_input) {
		String output = "";

		Patternx validateStr = Pattern.compile("[a-zA-Z0-9_]*.");
		Pattern validateInt = Pattern.compile("[0-9]+");
		Pattern validateDouble = Pattern.compile("([0-9]+\\.[0-9]+)|(\\.[0-9]+)");
		Pattern validateDate = Pattern.compile("[0-9]{1,2}-[0-9]{1,2}-[0-9]{4}");

		// handle String input

		// will use slicing to remove illegal characters on part2
		if (validateStr.matcher(UNSANITIZED_input).matches()) {
			output = UNSANITIZED_input;
		}

		// handle Int input
		else if (validateInt.matcher(UNSANITIZED_input).matches()) {
			int i = Integer.parseInt(UNSANITIZED_input);
			output = Integer.toString(i);
		}

		// handle double input
		else if (validateDouble.matcher(UNSANITIZED_input).matches()) {

			double p = Double.parseDouble(UNSANITIZED_input);
			output = String.valueOf(p);
		} 
		
		// handle date input
		else if (validateDate.matcher(UNSANITIZED_input).matches()) {

			
			output = UNSANITIZED_input;
		} 
		
		else {
			System.out.println("Illegal input detected!");
		}

		return output;

	}
	
	
}
