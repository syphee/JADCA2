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
@WebServlet("/VerifyUser")
public class VerifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUser() {
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
		
		String output = "";

		//to redirect user if tries to bypass login by entering http://localhost:8080/Practical_2/Practical%202/VerifyUser.jsp without logging in
		if(loginid == null || password == null){
			response.sendRedirect("login.jsp");
		}else{
			
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
					String role = userDetails.get("role");
					
					session.setAttribute("username",username );
					session.setAttribute("role", role);
					
					// if successfully logged in 
					System.out.println("Logged in!");
					response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp");
					
					
					//request.getRequestDispatcher("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp").forward(request, response);
					
				}else{
					
					// if wrong password input , userDAO will return a null object
					output = "You have entered an invalid ID/Password";
					response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?errCode=invalidLogin");
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
				response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?errCode=ConnectionErr");
				System.out.println(e);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				// if error with servlet
				output = "Error with connecting to SP Rentals. Please contact the administrator.";
				response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?errCode=ConnectionErr");
				System.out.println(e);
				System.out.println("Unknown Error");
			}
		}
	}

}
