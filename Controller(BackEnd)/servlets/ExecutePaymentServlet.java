package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;

import orderDAO.OrderDAO;

import javax.servlet.http.HttpSession;
 
@WebServlet("/ExecutePaymentServlet")
public class ExecutePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    //after the user has clicked on the pay now button
    //the orderDetails DAO will also be called and
    //the orderDetails should be captured and saved
    //to database
    
    public ExecutePaymentServlet() {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
		

        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        int userid = 0;
        
        HashMap<String,Integer> book_list = new HashMap<String,Integer>();

        try {
        	book_list = (HashMap<String,Integer>) session.getAttribute("book_list");
        	userid = (Integer) session.getAttribute("userid");
        	
        	
        	System.out.println("Payment recieved with userid : " + userid);
        	
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            
            // Get the current date

            // Convert the java.util.Date to java.sql.Date

            OrderDAO Orders = new OrderDAO();

            float TotalAmount = Float.parseFloat(transaction.getAmount().getTotal());
            
            int orderID = Orders.createOrder(userid,TotalAmount,book_list);
            
            System.out.println("ExecutePaymentServlet - Order ID Captured : " + orderID);
            
            
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);          
 
            request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/receipt.jsp").forward(request, response);
             	
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
    }
 
}