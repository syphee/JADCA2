package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import com.itextpdf.text.DocumentException;
*/
/*import model.PDFGenerator;
 * 
 */

import model.Sales;
import model.SalesDAO;

/**
 * Servlet implementation class TopSalesServlet
 */
@WebServlet("/TopSalesServlet")
public class TopSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopSalesServlet() {
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
	    try {
	        SalesDAO salesDAO = new SalesDAO();
	        ArrayList<Sales> topSalesList = salesDAO.getTopSales(10); // Retrieve top 10 sales

	        HttpSession session = request.getSession();

	        // Set top sales data in session attribute
	        session.setAttribute("topSalesList", topSalesList);
	        
			/*
			 * String filePath = getServletContext().getRealPath("/") + "top_sales.pdf";
			 * PDFGenerator.generateOrderPDF(topSalesList, filePath);
			 */

	        // Forward the request to SalesInquiry.jsp
	        request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/SalesInquiry.jsp")
	            .forward(request, response);

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "An error occurred while retrieving top sales.");
	        request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/error.jsp").forward(request, response);
		} 
	    /*
			 * catch (DocumentException e) { request.setAttribute("errorMessage",
			 * "fuck you");
			 * 
			 * }
			 */
	}

}
