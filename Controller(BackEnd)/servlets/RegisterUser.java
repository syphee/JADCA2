package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;

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
		
		PrintWriter out = response.getWriter();
		String output = "";
		String color = "";

		response.setContentType("text/html; charset=utf-8");

		// save the session,
		// if username / password is null, expression tag displayed in home.jsp will be "Guest", else it will follow the user's login details
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
		
		

		// to call class verification, make sure that both input passwords are the same
		String loginid = request.getParameter("loginid");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		


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
					if(verifyExists == false) {
						// the returned result from Database			
						String userDetails = UserDAO.RegisterNewUser(loginid,password);
						
						// if there is content
						if (userDetails.isEmpty() != true) {
							

							// if successfully logged in 
							System.out.println("Successfully created user!");
							//response.sendRedirect(request.getContextPath() + currentPage);
							output = "Added user successfully!";
				        	color = "alert-success";
				        	System.out.println("REGISTERUSER - SUCCESS!!");
				        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
				        	
				        	// bootstrap card
				        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
				    	     		+ output + "\r\n"
				    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
				    	     		+ "</div>";
							
							out.println(message);
							
							request.getRequestDispatcher( currentPage).include(request, response);
							
						}else{
							
							// if wrong password input , userDAO will return a null object
							output = "You have entered an invalid ID/Password";
							//response.sendRedirect(request.getContextPath() + currentPage);

				        	color = "alert-danger";
				        	System.out.println("REGISTERUSER - FAILED!!");
				        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
				        	
				        	// bootstrap card
				        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
				    	     		+ output + "\r\n"
				    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
				    	     		+ "</div>";
							request.getRequestDispatcher(currentPage).include(request, response);
							out.println(message);
							System.out.println(output);
						}
					}
					// if user already exists
					else {
						output = "User Already exists in the database!";
						//response.sendRedirect(request.getContextPath() + currentPage);

			        	color = "alert-danger";
			        	System.out.println("EDITBOOK - SUCCESS!!");
			        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
			        	
			        	// bootstrap card
			        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
			    	     		+ output + "\r\n"
			    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
			    	     		+ "</div>";
						request.getRequestDispatcher(currentPage).include(request, response);
						out.println(message);
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
					//response.sendRedirect(request.getContextPath() + currentPage);

		        	color = "alert-danger";
		        	System.out.println("REGISTERUSER - FAILED!!");
		        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
		        	
		        	// bootstrap card
		        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
		    	     		+ output + "\r\n"
		    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
		    	     		+ "</div>";
					request.getRequestDispatcher(currentPage).include(request, response);
					out.println(message);
					System.out.println(output);
					//response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=ConnectionErr");
					request.getRequestDispatcher(currentPage).include(request, response);
					
					System.out.println(e);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
					// if error with servlet
					output = "Error with connecting to SP Rentals. Please contact the administrator.";

					//response.sendRedirect(request.getContextPath() + currentPage);

		        	color = "alert-danger";
		        	System.out.println("REGISTERUSER - FAILED!!");
		        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
		        	
		        	// bootstrap card
		        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
		    	     		+ output + "\r\n"
		    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
		    	     		+ "</div>";
					request.getRequestDispatcher(currentPage).include(request, response);
					out.println(message);
					System.out.println(output);
					//response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=ConnectionErr");
					request.getRequestDispatcher(currentPage).include(request, response);
					
					System.out.println(e);
					System.out.println("Unknown Error");
				}
				
			}else {
				output = "Passwords do not match!";

				//response.sendRedirect(request.getContextPath() + currentPage);

	        	color = "alert-danger";
	        	System.out.println("REGISTERUSER - FAILED!!");
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
				request.getRequestDispatcher( currentPage).include(request, response);
				out.println(message);
				System.out.println(output);
				//response.sendRedirect(request.getContextPath() + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/login.jsp?c=invalidLogin");
				request.getRequestDispatcher(currentPage).include(request, response);
				
				System.out.println(output);
			}

		}
	}

}
