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
 * Servlet implementation class deleteUser
 */
@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUser() {
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
		String user_id = "";
		
		try {
			PrintWriter out = response.getWriter();
			 user_id = request.getParameter("user_id");
			 
			 UserDAO.deleteUser(user_id);
			 
			//String output = "Added book successfully!";
	        	String output2 = "Deleted user successfully!";
	        	String color = "alert-success";
	        	System.out.println("DELETE USER - SUCCESS!!");
	        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
	        	
	        	// bootstrap card
	        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
	    	     		+ output2 + "\r\n"
	    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	    	     		+ "</div>";
	        	out.print(message);  
	            RequestDispatcher rd=request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Users/deleteUser/deleteUserFeature.jsp");  
	            rd.include(request, response);  
			 
		}catch(Exception ex) {
			PrintWriter out = response.getWriter();
			ex.printStackTrace();
			//String output = "Add book failed!";
        	String output = "DELETE USER failed! Reason : " + ex;
        	String color = "alert-danger";
        	System.out.println("DELETE USER- FAILED!! : " );
        	ex.printStackTrace();
        	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
        	
        	// bootstrap card
        	String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
    	     		+ output + "\r\n"
    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
    	     		+ "</div>";
        	
        	out.print(message);  
            RequestDispatcher rd = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp");  
            rd.include(request, response);  
			
		}
		
		
	}

}
