package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

/**
 * Servlet implementation class removeItem
 */
@WebServlet("/removeItem")
public class removeItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeItem() {
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
		
		// get current cart
		ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
		
		
		// get deleted book name
		String remove_book = request.getParameter("book_id");
		
		// search the cart for the same book , then delete and break out from loop;
		for(String a :  shopping_cart ) {
			if(a.equals(remove_book)) {
				
				int b = shopping_cart.indexOf(remove_book);
				System.out.println("Removing book : " + shopping_cart.get(b));
				shopping_cart.remove(b);
				break;
			}
		}
		
		// then set updated shopping cart
		session.setAttribute("shopping_cart",shopping_cart);

		
		response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/checkout.jsp");
		

	}

}
