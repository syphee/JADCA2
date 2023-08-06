package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbDAO.sqlPassword;

/**
 * Servlet implementation class manageShipment
 */
@WebServlet("/manageShipment")
public class manageShipment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageShipment() {
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
		try {
			PrintWriter out = response.getWriter();
			int order_item_id = Integer.parseInt(request.getParameter("order_item_id"));
			String status = request.getParameter("shipment-status");
			
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ sqlPassword.getSQLPassword() + "&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object

			// Call routine
			String simpleProc = "UPDATE order_items set status=? where order_item_id = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(simpleProc);
			
			
			pstmt.setString(1, status);
			pstmt.setInt(2, order_item_id);
			// insert book values
			
			
			
			
			// Step 5: Execute SQL Command
			//String sqlStr = "SELECT * FROM member";         
			
			
			
			int affectedRows = pstmt.executeUpdate();
			System.out.println("manageShipment - " + affectedRows + " row(s) inserted successfully.");
			
			
			// Step 7: Close connection
			conn.close();
			String output2 = "Successfully editted shipment status.";
        	String color = "alert-success";
        	
			String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
    	     		+ output2 + "\r\n"
    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
    	     		+ "</div>";
        	
        	out.print(message);  
            RequestDispatcher rd = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Orders/manageOrders/manageOrderFeature.jsp");  
            rd.include(request, response);  
			
			
		}catch(Exception ex) {
			PrintWriter out = response.getWriter();
			ex.printStackTrace();
			String output2 = "Edit shipment status fail.";
        	String color = "alert-danger";
        	
			String message = "<div class=\"alert " +color + " role=\"alert\">\r\n"
    	     		+ output2 + "\r\n"
    	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
    	     		+ "</div>";
        	
        	out.print(message);  
            RequestDispatcher rd = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel/Orders/manageOrders/manageOrderFeature.jsp");  
            rd.include(request, response);  
			
		}
		
	}

}
