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
import java.util.ArrayList;  

public class BookDAO {
	
	// james sql pass : spJEAL602336
	// skye's sql pass : Minecrafr@09
	final static String SQLpassword = "Minecrafr@09";
	
	// right click the book-imgs folder , show in system explorer and paste it in the bookImgFolderDir variable
	// James directory : D:\\Eclipse\\school work\\CA1\\CA1\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\book-imgs\\
	// Skye's directory : C:\Users\skyen\eclipse-workspace\skye.zip_expanded\CA1\src\main\webapp\BookstoreCA1\JAD-CA1\View(FrontEnd)\assets\book-imgs
	final static String bookImgFolderDir = "D:\\Eclipse\\school work\\CA1\\CA1\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\book-imgs\\";
	//final static String bookImgFolderDir = "/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/";
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
                INPUT_genre_id.isBlank() || INPUT_ISBN.isBlank() ;
		

		Map<String, Boolean> list = new HashMap<>();
		
		list.put("title", INPUT_title.trim().isBlank());
		list.put("author", INPUT_author.trim().isBlank());
		list.put("price", INPUT_price.trim().isBlank());
		list.put("quantity", INPUT_quantity.trim().isBlank());
		list.put("genre_id", INPUT_genre_id.trim().isBlank());
		list.put("ISBN", INPUT_ISBN.trim().isBlank());
		list.put("description", INPUT_description.trim().isBlank() != false);
		
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
	
    
    public static void deleteBook(String INPUT_ISBN) throws Exception{
    	String ISBN = INPUT_ISBN;
    	
    	Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		// Step 4: Create Statement object

		// Call routine
		String simpleProc = "{ call deleteBook(?) }";
		CallableStatement cs = conn.prepareCall(simpleProc);

		// insert book values
		cs.setString(1, ISBN);
		
		
		// Step 5: Execute SQL Command
		//String sqlStr = "SELECT * FROM member";         
		
		
		
		int affectedRows = cs.executeUpdate();
		System.out.println("BOOKDAO - " + affectedRows + " row(s) deleted successfully.");
		
		
		// Step 7: Close connection
		conn.close();
    	
    	
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
	
	public static String constructSQL(String INPUT_title, String INPUT_author, String INPUT_price, 
			String INPUT_pub_date, String INPUT_genre_id,String INPUT_ISBN, String INPUT_description
			) throws Exception {
		String output = "";
		
		// check if null values, if null values then dont update column
		// store all params aka columns into array, then for loop switch, check for null, then if not null concat with values(?,?),
		// at the end have a count to count the required question marks, then make the sql statement
		String title = INPUT_title;
		String author = INPUT_author;
		String price = INPUT_price;
		
		String pub_date = INPUT_pub_date;
		String genre_id = INPUT_genre_id;
		String ISBN = INPUT_ISBN;
		String description = INPUT_description;
		
			
		
		Map<String, Boolean> queryList = new HashMap<>();

		queryList.put("title", title.trim().isBlank());
		queryList.put("author", author.trim().isBlank());
		queryList.put("price", price.trim().isBlank());
		
		queryList.put("genre_id", genre_id.trim().isBlank());
		queryList.put("pub_date", pub_date.trim().isBlank());
		queryList.put("ISBN", ISBN.trim().isBlank());
		queryList.put("description", description.trim().isBlank());
		
		
		Map<String, String> valueList = new HashMap<>();
		
		valueList.put("title", title);
		valueList.put("author", author);
		valueList.put("price", price);
		
		valueList.put("genre_id", genre_id);
		valueList.put("publication_date", pub_date);
		valueList.put("ISBN", ISBN);
		valueList.put("description", description);
		
		
		
		
		
		// Validate non - null inputs
		// store the non null values into another hashmap
		ArrayList<String> validInputs = new ArrayList<String>() ;
		
		
		for (Map.Entry<String, Boolean> pair : queryList.entrySet()) {
		    System.out.println(String.format("Key (name) is: %s, Value is : %s", pair.getKey(), pair.getValue()));
		    
		    //	if queryList item is not empty  
		    if (pair.getValue() == false) {
		        validInputs.add(pair.getKey());
		        
		    }
		}
		
		int count = 0;
		String SQL_UPDATE_QUERY = "";
		for (Map.Entry<String, String> pair : valueList.entrySet()) {
		    System.out.println(String.format("Key (name) is: %s, Value is : %s", pair.getKey(), pair.getValue()));
		     
		    //	if queryList item is not empty  
		    if (pair.getKey().equals(validInputs.get(count))) {
		       //SQLQuery.put(pair.getKey(),validInputs.get(count));
		    	
		    	SQL_UPDATE_QUERY += (  pair.getKey()  + "=" + "\"" + pair.getValue() +"\"" + ",");
		        
		        
		    }
		    count++;
		}
		
		System.out.println(SQL_UPDATE_QUERY);
		
		
		
		// then slice final sql query
		String FINAL_QUERY = reconstruct(SQL_UPDATE_QUERY);
		
		
		String sqlStr = "UPDATE books SET " + FINAL_QUERY + " WHERE book_id = ?";
		
		// log final query
		System.out.println("BookDAO ( Construct SQL ) - FINAL QUERY : " + sqlStr);
		
		output = sqlStr;
	
		return output;
	}
	
	public static String reconstruct(String str) {
		
		    if (str != null && str.length() > 0 && str.charAt(str.length() - 1) == ',') {
		        str = str.substring(0, str.length() - 1);
		    }
		    System.out.println("Reconstructed query : " + str);
		    return str;
		
	}
	public static void manageBookQuantity(String INPUT_ISBN,String INPUT_quantity)throws Exception {
		
		// init variables
		String ISBN = "";
		int quantity = 0 ;
		
		try {
			System.out.println("BookDAO - Sanitizing inputs : " + ISBN + " and " + quantity + " for function : manageBookQuantity() !");
			ISBN = sanitizeInput(INPUT_ISBN);
			
			quantity = Integer.parseInt(sanitizeInput(INPUT_quantity));
			
		}catch(Exception ex ) {
			ex.printStackTrace();
		}
		
		// execute SQL
		
		// Step1: Load JDBC Driver
					Class.forName("com.mysql.jdbc.Driver");

					// Step 2: Define Connection URL
					String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

					// Step 3: Establish connection to URL
					Connection conn = DriverManager.getConnection(connURL);
					// Step 4: Create Statement object

					// Call routine
					String simpleProc = "UPDATE books SET quantity = ? where ISBN = ?";
					
					PreparedStatement pstmt = conn.prepareStatement(simpleProc);
					pstmt.setInt(1, quantity);
					pstmt.setString(2, ISBN);
					// insert book values
					
					
					
					
					// Step 5: Execute SQL Command
					//String sqlStr = "SELECT * FROM member";         
					
					
					
					int affectedRows = pstmt.executeUpdate();
					System.out.println("BOOKDAO - " + affectedRows + " row(s) inserted successfully.");
					
					
					// Step 7: Close connection
					conn.close();
		
		
		
	}
	
	public static void editBook(String INPUT_title, String INPUT_author, String INPUT_price, 
			String INPUT_quantity,String INPUT_pub_date, String INPUT_genre_id,String INPUT_ISBN,String INPUT_rating, String INPUT_description,String default_description,int book_id
			) throws Exception {
		

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
		
		// fill in desc if no user input for description
		if(description.trim().isBlank() ) {
			description = default_description;
		}
		
		
		//
		
		
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
			String simpleProc = constructSQL(title,author,Double.toString(price),date,Integer.toString(genre_id),ISBN,description);
			
			PreparedStatement pstmt = conn.prepareStatement(simpleProc);
			pstmt.setInt(1, book_id);
			// insert book values
			
			
			
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			int affectedRows = pstmt.executeUpdate();
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
}
