package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;

/**
 * Servlet implementation class deleteBook
 */
@WebServlet("/deleteBook")
public class deleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteBook() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			String isbn = request.getParameter("deleteBook");
			String title = request.getParameter("bookTitle");
			
			System.out.println("deleting book with title : " + title + ", and ISBN : " + isbn);
			PrintWriter out = response.getWriter();
			String color = "";
			String output2 = "";
			
			try {
	        	
	        	BookDAO.deleteBook(isbn);
	        	//String output = "Added book successfully!";
	        	output2 = "Deleted book successfully!";
	        	color = "alert-success";
	        	System.out.println("DELETEBOOK - SUCCESS!!");
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output2 + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
	        	out.print(message);  
	            RequestDispatcher rd=request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Books/deleteBook/deleteBookFeature.jsp");  
	            rd.include(request, response);  
	            
	        }catch(Exception ex) {
	        	
	        	//String output = "Add book failed!";
	        	output2 = "Delete book failed! Reason : " + ex;
	        	color = "alert-danger";
	        	System.out.println("ADDBOOK - FAILED!! : " + ex);
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output2 + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
	        	
	        	out.print(message);  
	            RequestDispatcher rd = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Books/deleteBook/deleteBookFeature.jsp");  
	            rd.include(request, response);  
	        }
		}
		
	

}
