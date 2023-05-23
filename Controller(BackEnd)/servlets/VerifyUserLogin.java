package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

// import userDAO class
import dbDAO.UserDAO;

/**
 * Servlet implementation class VerifyUser
 */
@WebServlet("/VerifyUserLogin")
public class VerifyUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUserLogin() {
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
		doGet(request, response);
		response.setContentType("text/html; charset=utf-8");

		// save the session,
		// if username / password is null, expression tag displayed in home.jsp will be "Guest", else it will follow the user's login details
		HttpSession session = request.getSession();
		

		// to call class verification
		String loginid = request.getParameter("loginid");
		String password = request.getParameter("password");
		String result = request.getParameter("rememberMe");
		
		String role;
		String guest = "";
		
		// to determine if has already redirected , since we are redirecting guest ontop of the validation
		boolean hasLogged = false;
				
		
		// to retrieve body params if user decides to login as guest
		try {
			guest = request.getParameter("GuestLogin");
			// to verify if user has clicked on Login as Guest, then skip the rest of the code and redirect
			if(guest.equals("Guest")) {
				System.out.println("Logged in as guest.");
				loginid = "Guest";
				role = "Guest";
				
				session.setAttribute("username","Guest" );
				session.setAttribute("role", "Guest");
				
				System.out.println("Logged in as guest!");
				hasLogged = true;
				response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp");
				
			}
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		// to set the cookie required
		boolean rememberMe = Boolean.parseBoolean(result);
		
		
		String output = "";
		

		
		//to redirect user if tries to bypass login by entering http://localhost:8080/Practical_2/Practical%202/VerifyUser.jsp without logging in
		// loginid and role is both "Guest" when user clicks on Login as guest. (This will only be reflected client-sided, no server interaction.)
		// Will need to reflect a visual "Login" button at home.jsp and subsequent pages if so.
		
		// if no login details, has not clicked log in as guest
		if(loginid == null && guest.equals("Guest") != true || password == null && guest.equals("Guest") != true){
			response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp");
		}else if(hasLogged == false){
			
			// for loop to check here
			// to call UserDAO class
			// if wrong password input , userDAO will return a null object
			

				try {
					
					// the returned result from Database
					Map<String, String> userDetails = UserDAO.VerifyLogin(loginid,password);
					
					// if there is content
					if (userDetails.isEmpty() != true) {
						
						// store login and role attribute of user here
						String username = userDetails.get("username");
						role = userDetails.get("role");
						
						session.setAttribute("username",username );
						session.setAttribute("role", role);
						
						// if user has selected to remember login
						if(result != null && rememberMe == true) {
							session.setAttribute("rememberMe", true);
						}
						
						// if successfully logged in 
						System.out.println("Logged in!");
						response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp");
						
						
						//request.getRequestDispatcher("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp").forward(request, response);
						
					}else{
						
						// if wrong password input , userDAO will return a null object
						output = "You have entered an invalid ID/Password";
						response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=invalidLogin");
						System.out.println(output);
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println(e);
					e.printStackTrace();
					
					// if error in connecting to database
				} catch (SQLException e) {
					
					
					// if error in connection with DB
					output = "Error with connecting to SP Rentals. Please contact the administrator.";
					response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=ConnectionErr");
					System.out.println(e);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
					// if error with servlet
					output = "Error with connecting to SP Rentals. Please contact the administrator.";
					response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=ConnectionErr");
					System.out.println(e);
					System.out.println("Unknown Error");
				}
				
			}

		}
	
	
	private void createCookie() {
		
	}

}
