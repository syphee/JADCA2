package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbDAO.BookDAO;

import java.util.ArrayList;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
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
		
		HttpSession session = request.getSession();
		
		// get current page of user before passed on to servlet
		String currentPage = request.getHeader("Referer");
		String contextPath = request.getContextPath();

		// .getScheme() to get the http:// length
		if (currentPage != null && currentPage.startsWith(request.getScheme())) {
		    // Remove the protocol and server name
		    currentPage = currentPage.substring(currentPage.indexOf(contextPath) + contextPath.length());
		}

		System.out.println("Relative path of previous page: " + currentPage);
		
		// remove any query params
		if (currentPage != null) {
		    int queryIndex = currentPage.indexOf('?');
		    if (queryIndex != -1) {
		        currentPage = currentPage.substring(0, queryIndex);
		    }
		}

		String output ="";
		String color = "";
		PrintWriter out = response.getWriter();
		
		String isQuickRent = "";
		isQuickRent = request.getParameter("quick_rent");
		ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
		
		
		String title = "";
		title = request.getParameter("s");
		
		// set session attributes according to what user has pressed
		
		
		
		try {
					// if quick rent
					if(isQuickRent.equals("true")) {
						session.setAttribute("quick_rent",title);
					}
					
					// if its just add to cart
					// update new cart
					else {
						shopping_cart.add(title);
						session.setAttribute("shopping_cart",shopping_cart);
					}
			
		        	
		        
		        	//String output = "Added book successfully!";
		        	output = "Added to cart successfully!";
		        	color = "alert-success";
		        	System.out.println("ADDTOCART - SUCCESS!!");
		        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
		        	
		        	// bootstrap card
		        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
		    	     		+ output + "\r\n"
		    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
		    	     		+ "</div>";
		        	out.print(message);  
		        	
		        	// substring to remove the extra / 
		        	String redirect = (request.getContextPath() + currentPage + "?c=success&m=" + output).toString();
		        	response.sendRedirect(redirect);
		            
		        }catch(Exception ex) {
		        	
		        	//String output = "Add book failed!";
		        	output = "Add to cart failed! Reason : " + ex;
		        	color = "alert-danger";
		        	System.out.println("ADDTOCART - FAILED!! : " );
		        	ex.printStackTrace();
		        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
		        	
		        	// bootstrap card
		        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
		    	     		+ output + "\r\n"
		    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
		    	     		+ "</div>";
		        	
		        	out.print(message);  
		        	String redirect = (request.getContextPath() + currentPage + "?c=failed&m=" + output).toString();
		            response.sendRedirect(redirect);
		        }
	}

}