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
 * Servlet implementation class manageStock
 */
@WebServlet("/manageStock")
public class manageStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageStock() {
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
		
		PrintWriter out = response.getWriter();
		
		String quantity = request.getParameter("book_quantity");
		String isbn = request.getParameter("book_isbn");
		
		System.out.println("manageStock - Quantity to be removed for book ISBN " + isbn + " : " + quantity);
		
		String output2 = "";
		String color ="";
		
		 try {
	        	
	        	BookDAO.manageBookQuantity(isbn,quantity);
	        	//String output = "Added book successfully!";
	        	output2 = "Edited book stocks successfully!";
	        	color = "alert-success";
	        	System.out.println("MANAGE BOOK STOCKS - SUCCESS!!");
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output2 + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
	        	out.print(message);  
	            RequestDispatcher rd=request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Inventory/manageInventory/manageInventoryFeature.jsp");  
	            rd.include(request, response);  
	            
	        }catch(Exception ex) {
	        	
	        	//String output = "Add book failed!";
	        	output2 = "Edited book stocks failed! Reason : " + ex;
	        	color = "alert-danger";
	        	System.out.println("MANAGE BOOK STOCKS - FAILED!! : " + ex);
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output2 + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
	        	
	        	out.print(message);  
	            RequestDispatcher rd = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Inventory/manageInventory/manageInventoryFeature.jsp");  
	            rd.include(request, response);  
	        }
		
		
	}

}
