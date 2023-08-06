package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Sales;
import model.SalesDAO;

/**
 * Servlet implementation class SalesReportServlet
 */
@WebServlet("/SalesReportServlet")
public class SalesReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SalesReportServlet() {
        super();
    }

    private void generateSalesReport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		 System.out.println("Inside generateSalesReport method"); // Add this line
		  
		  HttpSession session = request.getSession();
		  
		  try { SalesDAO salesDAO = new SalesDAO(); ArrayList<Sales> salesList =
		  salesDAO.getSales();
		  
		  if (salesList.isEmpty()) {
	            System.out.println("No data found in the salesList.");
	            return;
	        }
		  
		  session.setAttribute("salesList", salesList);
		  
		  RequestDispatcher dispatcher = request.getRequestDispatcher(
		  "/BookstoreCA1/JAD-CA1/View(FrontEnd)/SalesInquiry.jsp");
		  dispatcher.forward(request, response);
		  
		  //debugging System.out.println("Sales list size: " + salesList.size());
		  
		  } catch (SQLException | ClassNotFoundException e) { e.printStackTrace();
		  request.setAttribute("errorMessage",
		  "An error occurred while generating the sales report."); // 
		  RequestDispatcher dispatcher = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp"); //
		  dispatcher.forward(request, response);
		  
		  //more debugging System.out.println("Error in SalesReportServlet: " +
		  e.getMessage(); e.printStackTrace(); }
		 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        generateSalesReport(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        generateSalesReport(request, response);
    }
}
