package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;

/**
 * Servlet implementation class changePassword
 */
@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
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
		
		String user_id = request.getParameter("user_id");
		
		String old_password = request.getParameter("old-password");
		String new_password = request.getParameter("new-password");
		String confirm_password = request.getParameter("confirm-password");
		
		
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
		
		
		
		try {
			 

			
			PrintWriter out = response.getWriter();
			System.out.println("user_id: " + user_id);

			System.out.println("Old password : " + old_password);
			System.out.println("New password : " + new_password);
			System.out.println("Confirm password : " + confirm_password);
			
			// retrieval of info
			 
			 
			 UserDAO.changePassword(user_id,old_password,new_password,confirm_password);
			 
			//String output = "Added book successfully!";
	        	String output2 = "Editted password of user with user ID :" + user_id + " successfully!";
	        	String color = "alert-success";
	        	System.out.println("EDIT USER PASSWORD - SUCCESS!!");
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output2 + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
	        	out.print(message);  
	        	
	        	
	        	if(currentPage.equals("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/editUser/editUserFeature.jsp")) {
	        		RequestDispatcher rd=request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/editUser/editUserFeature.jsp");  
		            rd.include(request, response);  
	        	}else {
	        		String output = "Successfully editted profile!";
	        		String redirect = (request.getContextPath() + currentPage + "?c=success&m=" + output).toString();
	        		response.sendRedirect(redirect);
	        	}
	            
			 
		}catch(Exception ex) {
			
			
			PrintWriter out = response.getWriter();
			ex.printStackTrace();
			//String output = "Add book failed!";
        	String output = "EDIT USER PASSWORD failed! ";
        	String color = "alert-danger";
        	System.out.println("EDIT USER PASSWORD- FAILED!! : " );
        	ex.printStackTrace();
        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
        	
        	// bootstrap card
        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
    	     		+ output + "\r\n"
    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
    	     		+ "</div>";
        	
        	out.print(message);  
        	
        	if(currentPage.equals("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/editUser/editUserFeature.jsp")) {
        		RequestDispatcher rd=request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/editUser/editUserFeature.jsp");  
	            rd.include(request, response);  
        	}else {
        		String output2 = "Edit profile failed! Reason : " + ex;
        		String redirect = (request.getContextPath() + currentPage + "?c=false&m=" + output2).toString();
        		response.sendRedirect(redirect);
        	}
             
			
		}
	}

}
