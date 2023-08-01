package servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dbDAO.BookDAO;

/**
 * Servlet implementation class addBook
 */
@WebServlet("/addBook")
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15, // 15 MB
        location            = "D:\\Eclipse\\school work\\CA1\\CA1\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\book-imgs"
)
public class addBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String role = "";
		String user = "";
		
		
		
		// sends a bootstrap card notif if success or failed
		PrintWriter out = response.getWriter();
		String color = "";
		String output2 = "";
		
		
		
		
        // Get the file part from the request and other params
		//HttpSession session = request.getSession();

        Part filePart = request.getPart("file");
        
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String pub_date = request.getParameter("pub_date");
        String genre_id = request.getParameter("genre");
        String ISBN = request.getParameter("isbn");
        //String rating = request.getParameter("rating");
        String rating = "0";
        String description = request.getParameter("description");
        
        
        System.out.println("Title: " + title);
        System.out.println("Author: " + author);
        System.out.println("Price: " + price);
        System.out.println("Quantity: " + quantity);
        System.out.println("Publication Date: " + pub_date);
        System.out.println("Genre ID: " + genre_id);
        System.out.println("ISBN: " + ISBN);
        System.out.println("Rating: " + rating);
        System.out.println("Description: " + description);
        System.out.println("Picture: " + filePart);

        
        
        
        
        
        
        try {
        	
        	BookDAO.AddBook(title, author, price,quantity,pub_date,genre_id,ISBN,description,filePart);
        	//String output = "Added book successfully!";
        	output2 = "Added book successfully!";
        	color = "alert-success";
        	System.out.println("ADDBOOK - SUCCESS!!");
        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
        	
        	// bootstrap card
        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
    	     		+ output2 + "\r\n"
    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
    	     		+ "</div>";
        	out.print(message);  
            RequestDispatcher rd=request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp");  
            rd.include(request, response);  
            
        }catch(Exception ex) {
        	
        	//String output = "Add book failed!";
        	output2 = "Add book failed! Reason : " + ex;
        	color = "alert-danger";
        	System.out.println("ADDBOOK - FAILED!! : " + ex);
        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
        	
        	// bootstrap card
        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
    	     		+ output2 + "\r\n"
    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
    	     		+ "</div>";
        	
        	out.print(message);  
            RequestDispatcher rd = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp");  
            rd.include(request, response);  
        }
		
        
        
        //response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp");
    }
    
    

}
