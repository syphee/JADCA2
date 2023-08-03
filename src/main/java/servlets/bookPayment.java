package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookDAO;

import java.util.ArrayList;
/**
 * Servlet implementation class bookPayment
 */
@WebServlet("/bookPayment")
public class bookPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookPayment() {
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
		// for now its just redirect to home, reset cart
		
		// load the cart
		@SuppressWarnings("unchecked")
		ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
		// then clear stock
		  try {
	        	
	        	BookDAO.editBookStock(shopping_cart);
	    		// then clear cart
	    		shopping_cart = new ArrayList<String>();
	    		session.setAttribute("shopping_cart",shopping_cart);
	    		
	    		String message = "Thank you for using SP ARK Rental system!";

	    		
	    		response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp"+ "?c=success&m=" + message );
	    	
	            
	        }catch(Exception ex) {
	        	String message = "Book payment failed!";
	    		response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp"+ "?c=false&m=" + message );

	        }
		

	}

}
