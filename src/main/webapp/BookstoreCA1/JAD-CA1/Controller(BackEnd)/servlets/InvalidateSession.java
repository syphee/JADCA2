package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbDAO.UserDAO;

import javax.servlet.http.Cookie;

/**
 * Servlet implementation class InvalidateSession
 */
@WebServlet("/InvalidateSession")
public class InvalidateSession extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvalidateSession() {
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
		
		Cookie[] cookies = request.getCookies();
		
		
		String DELETE_session = "";
		for(Cookie cookie: cookies){
			
			if(cookie.getName().equals("session_id")){
				DELETE_session = cookie.getValue();
	            
			}
			
		}
		
		// Delete the remmeberMe, sesh id cookie by overriding
		Cookie cookie = new Cookie("rememberMe", "false");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);

		Cookie cookie2 = new Cookie("session_id", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie2);
		System.out.println("Successfully reset cookies.");
		
		try {
			
			System.out.println(DELETE_session);
			UserDAO.deleteSession(DELETE_session);
			System.out.println("Successfully deleted session id.");
		} catch (Exception ex) {
			System.out.println("Unable to delete session");
		}
		HttpSession session = request.getSession();
		session.invalidate();

		

		// Get an HttpSession related to this request, if no session exist don't
		// create a new one. This is just a check to see after invalidation the
		// session will be null.
		session = request.getSession(false);

		// response.getWriter().println("Session : " + session);
		console.log(request.getContextPath());
		response.sendRedirect("http://localhost:8080/CA2/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp");

	}

}
