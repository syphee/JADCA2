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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
//		
//		try {
//			//calling in and initializing
//			SalesDAO salesDAO = new SalesDAO();
//			
//			//storing in an array
//			ArrayList<Sales> salesList = salesDAO.getSales();
//			
//			//set as an attribute
//			request.setAttribute("salesList", salesList);
//			
//			//forward request
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/SalesInquiry.jsp");
//			dispatcher.forward(request, response);
//			
//						
//			
//			
//			
//		}catch (SQLException | ClassNotFoundException e) {
//			e.printStackTrace();
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		HttpSession session = request.getSession();
		
		try {
			//calling in and initializing
			SalesDAO salesDAO = new SalesDAO();
			
			//storing in an array
			ArrayList<Sales> salesList = salesDAO.getSales();
			
			//set as an attribute
			session.setAttribute("salesList", salesList);
			
			//forward request
			RequestDispatcher dispatcher = request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/SalesInquiry.jsp");
			dispatcher.forward(request, response);
			
						
			
			
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
