package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.paypal.base.rest.PayPalRESTException;
//import com.paypal.base.rest.*;

import model.OrderDetail;

/**
 * Servlet implementation class AuthorizePaymentServlet
 */
@WebServlet("/AuthorizePaymentServlet")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorizePaymentServlet() {
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
		
		//find out how did james store inside cart
		//then later integrate with the paypal API
		//should be able to finish by friday
		
		//query database to grab book titles
		//store the queried data into a variable
		//
		
			String contextPath = request.getContentType();
		  	String product = request.getParameter("product");
	        String subtotal = request.getParameter("subtotal");
	        String shipping = request.getParameter("shipping");
	        String tax = request.getParameter("tax");
	        String total = request.getParameter("total");
	        
	        //set userid 
	        HttpSession session = request.getSession();
	        int userid = 0;
	        try {
	        	userid = (Integer) session.getAttribute("userid");
	        	System.out.println("Payment being authorized with userid : " + userid);
	        	request.setAttribute("userid",userid);
	    		
	        }catch(Exception ex) {
	        	ex.printStackTrace();	        
	        	}
	        
	        
	        OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);

	        try {
	            PaymentServices paymentServices = new PaymentServices();
	            String approvalLink = paymentServices.authorizePayment(orderDetail,contextPath);
	 
	            response.sendRedirect(approvalLink);
	             
	        } catch (PayPalRESTException ex) {
	        request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            response.sendRedirect(request.getContextPath()+ "/error.jsp");
	        }
	        
	        
		doGet(request, response);
	}

}
