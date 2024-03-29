package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;

import orderDAO.OrderDAO;
import orderDAO.orders;
 
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
        
        int userid = (Integer)session.getAttribute("user_id");
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction",transaction);
            
            // Get the current date
            
            // Convert the java.util.Date to java.sql.Date
            
            OrderDAO Orders = new OrderDAO();
            
            //order capturing commences here.
            float TotalAmount = Float.parseFloat(transaction.getAmount().getTotal());
            int orderID = Orders.createOrder((userid),TotalAmount);
             
                 
            
     
            request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/receipt.jsp").forward(request, response);
             	
            //error handling exceptions: 
            
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/error.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            // Handle the ClassNotFoundException here
            ex.printStackTrace();
            request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/BookstoreCA1/JAD-CA1/View(FrontEnd)/error.jsp").forward(request, response);
        }
    }
 
}