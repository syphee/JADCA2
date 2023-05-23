package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbDAO.UserDAO;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
		

		// to call class verification, make sure that both input passwords are the same
		String loginid = request.getParameter("loginid");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		String output = "";

		//to redirect user if tries to bypass login by entering http://localhost:8080/Practical_2/Practical%202/VerifyUser.jsp without logging in
		if(loginid == null || password == null || confirmPassword == null){
			response.sendRedirect("login.jsp");
		}else{
			

			// to call UserDAO class
			// if wrong password input , userDAO will return  empty values, then will stop redirect
			// to check if password is the same as confirmPassword
			if(password.equals(confirmPassword)) {
				try {
					
					// to check if user already exists
					boolean verifyExists = UserDAO.ValidateExists(loginid,password);
					
					// if user does not exist on the DB yet
					if(verifyExists = false) {
						// the returned result from Database			
						String userDetails = UserDAO.RegisterNewUser(loginid,password);
						
						// if there is content
						if (userDetails.isEmpty() != true) {
							

							// if successfully logged in 
							System.out.println("Successfully created user!");
							response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=successful_registration");
							
							
							//request.getRequestDispatcher("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp").forward(request, response);
							
						}else{
							
							// if wrong password input , userDAO will return a null object
							output = "You have entered an invalid ID/Password";
							response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=invalidLogin");
							System.out.println(output);
						}
					}
					// if user already exists
					else {
						output = "User Already exists in the database!";
						response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=UserExists");
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
				
			}else {
				output = "Passwords do not match!";
				response.sendRedirect("/../../../../CA1/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=invalidLogin");
				System.out.println(output);
			}

		}
	}

}