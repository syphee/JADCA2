package servlets;

import dbDAO.sqlPassword;

import java.io.IOException;
import java.util.ArrayList;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addItem
 */
@WebServlet("/addItem")
public class addItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String SQLpassword = sqlPassword.getSQLPassword();
		HttpSession session = request.getSession();

		boolean hasBooks = true;
		String book_query = "";
		int quantity = 0;
		String book_title = "";

		// get current cart
		ArrayList<String> shopping_cart = (ArrayList<String>) session.getAttribute("shopping_cart");

		// get deleted book name
		String add_book = request.getParameter("book_id");

		// TO check if db has enough books
		int increment = 0;
		for (String a : shopping_cart) {
			if (a.equals(add_book)) {
				increment++;
			}
		}

		try {

			book_query = add_book;

			int PARSED_book_query = Integer.parseInt(book_query);

			// step 1 Load jdbc driver
			Class.forName("com.mysql.jdbc.Driver");

			// step 2 define URL connection
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password=" + SQLpassword + "&serverTimezone=UTC";

			// step 3 Establish connection
			Connection conn = DriverManager.getConnection(connURL);

			// Call routine
			String simpleProc = "SELECT * from books where book_id = ? ";
			PreparedStatement cs = conn.prepareStatement(simpleProc);

			// insert book values
			cs.setInt(1, PARSED_book_query);

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				quantity = rs.getInt("quantity");
				book_title = rs.getString("title");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		if(increment >= quantity) {
			hasBooks = false;
		}

		// search the cart for the same book , then delete and break out from loop;
		if (hasBooks) {
			for (String a : shopping_cart) {
				if (a.equals(add_book)) {

					int b = shopping_cart.indexOf(add_book);
					System.out.println("Adding book : " + shopping_cart.get(b));
					shopping_cart.add(shopping_cart.get(b));
					break;
				}
			}
			// then set updated shopping cart
			session.setAttribute("shopping_cart", shopping_cart);
			
			String message = ("Successfully updated cart!");
			response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/checkout.jsp?c=success&m=" + message);
		}else {
			String message = ("There is not enough stock for Book :" + book_title + "!");
			response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/checkout.jsp?c=false&m=" + message);
		}

		

		

	}

}
