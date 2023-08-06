package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.UserDAO;

/**
 * Servlet implementation class editUser
 */
@WebServlet("/editUser")
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15, // 15 MB
        location            = "D:\\Eclipse\\school work\\CA2\\jadca2\\jadca2\\src\\main\\webapp\\BookstoreCA1\\JAD-CA1\\View(FrontEnd)\\assets\\user-imgs"
)
public class editUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUser() {
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
		 
		 
		 
		 String user_email = request.getParameter("user_email");
		
		 Part user_pic = request.getPart("user_pic");
		 String user_first_name = request.getParameter("user_first_name");
		 String user_role = request.getParameter("user_role");
		 String user_last_name = request.getParameter("user_last_name");
		 String user_contact = request.getParameter("user_contact");
		 String user_address = request.getParameter("user_address");
	
	// redirect to previous page
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

			
		try {
			 

		
			PrintWriter out = response.getWriter();
			System.out.println("user_id: " + user_id);

			System.out.println("user_email: " + user_email);
			System.out.println("user_pic: " + user_pic);
			System.out.println("user_first_name: " + user_first_name);
			System.out.println("user_last_name: " + user_last_name);
			System.out.println("user_contact: " + user_contact);
			System.out.println("user_address: " + user_address);
			// retrieval of info
			 
			 
			 UserDAO.editProfile(user_id,user_email,user_pic,user_first_name,user_last_name,user_contact,user_address);
			 
			//String output = "Added book successfully!";
	        	String output2 = "Editted user with user ID :" + user_id + " successfully!";
	        	String color = "alert-success";
	        	System.out.println("EDIT USER - SUCCESS!!");
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
        	String output = "EDIT USER failed! ";
        	String color = "alert-danger";
        	System.out.println("EDIT USER- FAILED!! : " );
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
