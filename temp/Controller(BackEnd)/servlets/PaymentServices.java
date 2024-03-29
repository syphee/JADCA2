package servlets;

import java.util.*;

import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
 
public class PaymentServices {
	
	//for now this is just my own Client ID and secret later will have to edit for James
    private static final String CLIENT_ID = "Adwql8TmIAn0pBRO5_-zX51SWnuy5Pa7JN-qq7UIdfWTbPf5lqLhiLdkco6miZbOQXB_3mPSDnZN66YP";
    private static final String CLIENT_SECRET = "EAfqm3WDddszDCUoWcbDV43JCMOVJVMMvtl8cgYsHiXDWfwhbM_t1bbGEnIv6bn8JFz-a-I9LRYMNe20";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDetail orderDetail,String contextPath)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs(contextPath);
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation() {
    	   Payer payer = new Payer();
    	    payer.setPaymentMethod("paypal");
    	     
    	    PayerInfo payerInfo = new PayerInfo();
    	    payerInfo.setFirstName("Skye")
    	             .setLastName("Chew")
    	             .setEmail("sb-rpjm926536114@personal.example.com");
    	     
    	    payer.setPayerInfo(payerInfo);
    	     
    	    return payer;
    }
     	
    private RedirectUrls getRedirectURLs(String contextPath) {
    	 RedirectUrls redirectUrls = new RedirectUrls();
    	    redirectUrls.setCancelUrl("http://localhost:8080" + contextPath + "/BookstoreCA1/JAD-CA1/View(FrontEnd)/checkout.jsp");
    	    redirectUrls.setReturnUrl("http://localhost:8080" + contextPath + "/ReviewPaymentServlet");
    	     
    	    return redirectUrls;
    }
     
    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
    	  Details details = new Details();
    	    details.setShipping(orderDetail.getShipping());
    	    details.setSubtotal(orderDetail.getSubTotal());
    	    details.setTax(orderDetail.getTax());
    	 
    	    Amount amount = new Amount();
    	    amount.setCurrency("USD");
    	    amount.setTotal(orderDetail.getTotal());
    	    amount.setDetails(details);
    	 
    	    Transaction transaction = new Transaction();
    	    transaction.setAmount(amount);
    	    transaction.setDescription(orderDetail.getProductName());
    	     
    	    ItemList itemList = new ItemList();
    	    List<Item> items = new ArrayList<>();
    	     
    	    Item item = new Item();
    	    item.setCurrency("USD");
    	    item.setName(orderDetail.getProductName());
    	    item.setPrice(orderDetail.getSubTotal());
    	    item.setQuantity("1");
    	     
    	    items.add(item);
    	    itemList.setItems(items);
    	    transaction.setItemList(itemList);
    	 
    	    List<Transaction> listTransaction = new ArrayList<>();
    	    listTransaction.add(transaction);  
    	     
    	    return listTransaction;
    }
     
    private String getApprovalLink(Payment approvedPayment) {
    	 List<Links> links = approvedPayment.getLinks();
    	    String approvalLink = null;
    	     
    	    for (Links link : links) {
    	        if (link.getRel().equalsIgnoreCase("approval_url")) {
    	            approvalLink = link.getHref();
    	            break;
    	        }
    	    }      
    	     
    	    return approvalLink;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    
    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);
     
        Payment payment = new Payment().setId(paymentId);
     
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
     
        return payment.execute(apiContext, paymentExecution);
    }
}