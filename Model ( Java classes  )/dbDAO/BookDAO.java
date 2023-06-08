package dbDAO;

import java.io.File;
import java.io.InputStream;

import java.nio.file.Files;

import java.nio.file.StandardCopyOption;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.text.SimpleDateFormat;  

import javax.servlet.http.Part;
import java.util.HashMap;
import java.util.Map;


import java.util.regex.*;

public class BookDAO {
	final static String SQLpassword = "spJEAL602336";
	
	// right click the book-imgs folder , show in system explorer and paste it in the bookImgFolderDir variable
	// James directory : D:\\Eclipse\\school work\\CA1\\CA1\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\book-imgs\\
	// Skye's directory :
	final static String bookImgFolderDir = "D:\\Eclipse\\school work\\CA1\\CA1\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\book-imgs\\";
	
	// to verify existence of book
	// throws an exception if book exists
	public static void verifyBook(String INPUT_title, String INPUT_ISBN) throws Exception{

		String title = INPUT_title;
		String isbn = INPUT_ISBN;
		ResultSet rs;
		
		try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object

			// Call routine
			String query = "SELECT * from books WHERE title = ? or ISBN = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);

			// insert book values
			pstmt.setString(1, title);
			pstmt.setString(2, isbn);
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String titleMatch = rs.getString("title");
				String isbnMatch = rs.getString("ISBN");
				

				if (titleMatch.equals(title) || isbnMatch.equals(isbn)) {
					// store the values that match into hashmap, later to be returned
					
					
					System.out.println("BookDAO - Book already exists!");
					conn.close();
					throw new Exception("Book already exists!");
					
				}

			}
			
			
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("BOOKDAO Error :" + e);
			// print stack trace is more accurate - shows where error occured, rather than println, only show exception type
			e.printStackTrace();
		}
		
		
		
	}
	
	public static void verifyFields(String INPUT_title, String INPUT_author, String INPUT_price, String INPUT_quantity,
			String INPUT_genre_id,String INPUT_ISBN, String INPUT_description
			)throws Exception {
		
		
		boolean ifInputBlank = INPUT_title.isBlank() || INPUT_author.isBlank() ||
                INPUT_price.isBlank() || INPUT_quantity.isBlank() ||
                INPUT_genre_id.isBlank() || INPUT_ISBN.isBlank() ||
                INPUT_description.isBlank();
		

		Map<String, Boolean> list = new HashMap<>();
		
		list.put("title", INPUT_title.trim().isBlank());
		list.put("author", INPUT_author.trim().isBlank());
		list.put("price", INPUT_price.trim().isBlank());
		list.put("quantity", INPUT_quantity.trim().isBlank());
		list.put("genre_id", INPUT_genre_id.trim().isBlank());
		list.put("ISBN", INPUT_ISBN.trim().isBlank());
		list.put("description", INPUT_description.isBlank());
		
		// to get name of param passed in
		// used java lang reflect
		
		// reference : https://stackabuse.com/java-how-to-get-keys-and-values-from-a-map/
		String output = "";

			for (Map.Entry<String, Boolean> pair : list.entrySet()) {
			    System.out.println(String.format("Key (name) is: %s, Value is : %s", pair.getKey(), pair.getValue()));   
			    if(pair.getValue() == true) {
			    	output += pair.getKey() + ", ";
			    }else {
			    	System.out.println(pair.getKey() + " : " + pair.getValue());
			    }
			    
			}

			
			
			
		
		
		if(ifInputBlank) {
			throw new Exception("Missing fields! : " + output);
		}
	}
	
	// for part 2 of CA i should probably do a hashmap containing the type of input and the value of input, so i can have a
	// switch case list of values that can be whitelisted - eg pub-dates is an optional input, thus no need to throw error "empty fields", but for other type of inputs, they should throw
	// hashmap<header,value>
	// hashmap<title,myTitle> kinda thing
	// verifyFields will be in the sanitizeInput method for part 2
	// if only json objects can be processed in java it would be so much easier lol
	
	// Helper method to extract the filename from the Part object
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
	
	// should validate for empty pic
	public static void AddBook(String INPUT_title, String INPUT_author, String INPUT_price, String INPUT_quantity,
			String INPUT_pub_date, String INPUT_genre_id,String INPUT_ISBN, String INPUT_description,
			Part filePart) throws Exception {
		
		String ISBN = "";
		// verify required fields if they are null
		verifyFields(INPUT_title,INPUT_author,INPUT_price,INPUT_quantity,INPUT_genre_id,INPUT_ISBN,INPUT_description);
		
        // verify value of isbn
		if(INPUT_ISBN.length() == 13) {
			ISBN = sanitizeInput(INPUT_ISBN);
		}else {
			throw new Exception("ISBN must be of 13 numbers!");
		}
		
		//declaration of variables
		String title = sanitizeInput(INPUT_title);
		String author = sanitizeInput(INPUT_author);
		
		
		double price = Double.parseDouble(sanitizeInput(INPUT_price));
		
		// rating shall be 0 because it is a new book that is added.
		double rating = 0;
		
		int quantity = Integer.parseInt(sanitizeInput(INPUT_quantity));
		
		String date = INPUT_pub_date;
		
		// if date is empty, will assign current date of book
		if(date == null || date.isBlank() ) {
			long millis=System.currentTimeMillis();  
	        java.sql.Date currDate=new java.sql.Date(millis);  
	        date = currDate.toString();
			System.out.println("BOOKDAO - User has no input of date, CURRENT DATE : " + date);
		}else {
			date = new SimpleDateFormat("dd/MM/yyyy").parse(INPUT_pub_date).toString();
		}
		
		int genre_id = Integer.parseInt(sanitizeInput(INPUT_genre_id));
		
		String description = sanitizeInput(INPUT_description);
		
		
		// to sanitize on part 2
		// Get the filename 
        String fileName = getFileName(filePart); 
        System.out.println("Selected Picture : " + fileName);
        
		String picture = fileName;
		
		// Save the file to book-imgs folder
        File outputFile = new File(bookImgFolderDir + picture);
        
		
		
		
		
        try (InputStream inputStream = filePart.getInputStream()) {
            Files.copy(inputStream, outputFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
		
		// to verify if book exists
		System.out.println("BookDAO - Verifying book : " + title  );
		verifyBook(title,ISBN);
		
		
		// No need for try catches cuz addbook has it
		
		//try {

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

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
			cs.setInt(7, genre_id);
			cs.setDouble(8, rating);
			cs.setString(9, description);
			cs.setString(10, picture);
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			int affectedRows = cs.executeUpdate();
			System.out.println("BOOKDAO - " + affectedRows + " row(s) inserted successfully.");
			
			
			// Step 7: Close connection
			conn.close();
		//} catch (Exception e) {
			//System.out.println("BOOKDAO Error :" + e);
			// print stack trace is more accurate - shows where error occured, rather than println, only show exception type
			//e.printStackTrace();
		//}
		
		
		
		

		// To parse values :
		// if no input from pub date, take date today
		
		

	}

	// input is the value taken in,
	// method is the data type of the value, input will be parsed according to type
	public static String sanitizeInput(String UNSANITIZED_input) {
		
		String output = "";

		Pattern validateStr = Pattern.compile("[a-zA-Z0-9_ ]*.");
		Pattern validateInt = Pattern.compile("[0-9]+");
		Pattern validateDouble = Pattern.compile("([0-9]+\\.[0-9]+)|(\\.[0-9]+)");
		Pattern validateDate = Pattern.compile("[0-9]{1,2}-[0-9]{1,2}-[0-9]{4}");

		// handle String input

		// will use slicing to remove illegal characters on part2
		if (validateStr.matcher(UNSANITIZED_input).matches()) {
			System.out.println("\nBookDAO - Handling string input of : " + UNSANITIZED_input );
			output = UNSANITIZED_input;
		}

		// handle Int input
		else if (validateInt.matcher(UNSANITIZED_input).matches()) {
			System.out.println("\nBookDAO - Handling string input of : " + UNSANITIZED_input );
			int i = Integer.parseInt(UNSANITIZED_input);
			output = Integer.toString(i);
		}

		// handle double input
		else if (validateDouble.matcher(UNSANITIZED_input).matches()) {
			System.out.println("\nBookDAO - Handling string input of : " + UNSANITIZED_input );
			double p = Double.parseDouble(UNSANITIZED_input);
			output = String.valueOf(p);
		} 
		
		// handle date input
		else if (validateDate.matcher(UNSANITIZED_input).matches()) {

			System.out.println("\nBookDAO - Handling string input of : " + UNSANITIZED_input );
			output = UNSANITIZED_input;
		} 
		
		else {
			System.out.println("Illegal input detected! : " + UNSANITIZED_input);
		}

		return output;

	}
}
