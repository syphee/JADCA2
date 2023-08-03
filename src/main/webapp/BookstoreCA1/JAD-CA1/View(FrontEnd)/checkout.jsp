<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.UserDAO"%>
<%@page import="model.sqlPassword"%>
<%@page import="java.sql.*"%>

<%
//change ur sql password here
	final String SQLpassword = sqlPassword.getSQLPassword();
%>

<%
// init cart function
ArrayList<String> shopping_cart = (ArrayList<String>)session.getAttribute("shopping_cart");
if(shopping_cart.size() < 1){
	String message = "Shopping cart is empty!";
	
	response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp"+ "?c=false&m=" + message );
}

%>

<%	
String user = "";
String role = "";
String pic = "";



try {
			user = session.getAttribute("username").toString();
			role = session.getAttribute("role").toString();
			pic = session.getAttribute("pic").toString();

		} catch (Exception ex) {
			System.out.println("login failed.");
			response.sendRedirect("login.jsp");
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/library svg/test.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Ionicons -->
<script type="module"
	src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
<script nomodule
	src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />


<!-- stylings -->
<link rel="stylesheet" type="text/css"
	href="/CA2/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/styles.css">
<link rel="stylesheet"
	href="/CA2/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/css/animations.css">
	

</head>
<body class="bg-black" style="overflow-y:auto;overflow-x:hidden;" >
	<%@include file="assets/messagePopUp.jsp"%>
	
	<%@include file="assets/header/header.jsp"%>
	
	

	

	 <section class="  " style="margin-left: 200px;margin-right: 200px;">
        
       
        <div class="row align-items-end">
            <div class="col">
                <h1 class="text-white fs-1">Check out</h1>
            </div>
            <div class="col-3">
                <h4 class="text-white fs-6">Book title | Description</h4>
            </div>
            <div class="col">
                <h1 class="text-white fs-6">Price</h1>
            </div>
            <div class="col">
                <h1 class="text-white fs-6">Quantity</h1>
            </div>
            <div class="col">
                <h1 class="text-white fs-6"></h1>
            </div>
            <div class="col">
                <h1 class="text-white fs-6">Total</h1>
            </div>

          

            


        </div>
        <hr class="bg-danger my-1 opacity-100">
       
<%
int total = 0;
String title_display = "";

// this quantity variable to retrieve amount of books added to cart by user
int quantity = 1;

// delivery fee lol
int delivery_fee = 10;

// number of books found
int count = 0;

for(String a :  shopping_cart){
	String title = "";
	String author = "";
	String genre = "";
	String desc = "";
	String pictureURI = "";
	double price = 0;
try{

	// for every item in shopping cart



	//step 1 Load jdbc driver
	Class.forName("com.mysql.jdbc.Driver");

	//step 2 define URL connection
	String connURL = "jdbc:mysql://localhost/jadca1?user=root&password="+ SQLpassword + "&serverTimezone=UTC";

	//step 3 Establish connection
	Connection conn = DriverManager.getConnection(connURL);

	//Call routine
				String simpleProc = "{ call selectBookByTitle(?) }";
				CallableStatement cs = conn.prepareCall(simpleProc);

				// insert book values
				cs.setString(1, a);
				
				
				// Step 5: Execute SQL Command
				//String sqlStr = "SELECT * FROM member";         
				
				
				
				

	ResultSet rs = cs.executeQuery();

	while (rs.next()) {
		int id = rs.getInt("book_id");
		title = rs.getString("title");
		author = rs.getString("author");
		genre = rs.getString("genre_id");
		desc = rs.getString("description");
		pictureURI = rs.getString("pic");
		price = rs.getInt("price");
		
		
		// to add up in total
		total += price;
		title += title_display;
		
		// to add in for each entry 
		count++;
				System.out.println(count);
		
}
%>




	<div class=" my-1 row text-light">
    <div class="col">
    <form action="details.jsp" method="post">
	                	<input type="hidden" name="s" value="<%=title%>"/>
             			 <input type="image" alt="Submit" src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=pictureURI%>" class="card-img-top book-img hover-underline-animation" style="max-width: 100px;">
						
             </form>
       
    </div>
    <div class="col-3">
        <div class="row">
            <%=title %>
        </div>
        <div class="row text-truncate-container">
            <p class="">
            <%=desc %>
            
        </p>
        </div>
        
    </div>

    <div class="col">
       $<%=price%>
    </div>
    <div class="col">
        1
    </div>
    <div class="col">
    	<form action="<%=request.getContextPath() %>/removeItem" method="post">
	    	
	        <input type="submit" class="btn btn-danger" value="Remove">
	        <input type="hidden" name="book_title" value="<%=title %>"/>
    	</form>
        
        
    </div>
    <div class="col">
        <%=price * quantity %>
    </div>


</div>


<%




}catch (Exception e) {
	out.println("Error : " + e);
}
} 
%>
        

	<hr class="bg-danger my-1 opacity-100">
    </section>
     

        <div class="row text-light"  style="margin-bottom: 200px;">
            <div class="d-flex align-items-end flex-column col">
                
            </div>
            <div class="d-flex align-items-end flex-column col">
                
            </div>
        
            <div class="d-flex align-items-center flex-column col">
             <%--    <div class="row">
                    <%=total %>
                </div>
                <div class="row">
                    <%=total * 0.08 %>
                </div>
                <div class="row">
                    <%=delivery_fee %>
                </div>
                <div class="row">
                    <%=total + (total * 0.08) + delivery_fee %> 
                </div>
                <div class="row"> --%>
      <form action="<%=request.getContextPath() %>/AuthorizePaymentServlet" method="post">
    <table>
    
            <tr>
            <td>Payment Summary:</td>
            <td><input type="hidden" name="product" value="Book Order" /></td>
        </tr>
    
        <tr>
            <td>Sub Total:</td>
            <td><input type="text" name="subtotal" readonly value="<%=total %>" style="color: black;" /></td>
        </tr>
        <tr>
            <td>Shipping:</td>
            <td><input type="text" name="shipping" readonly value="<%=delivery_fee %>" style="color: black;" /></td>
        </tr>    
        <tr>
            <td>Tax:</td>
            <td><input type="text" name="tax" readonly value="<%=total * 0.08 %>" style="color: black;" /></td>
        </tr>    
        <tr>
            <td>Total Amount:</td>
            <td><input type="text" name="total" readonly value="<%=total + (total * 0.08) + delivery_fee %>" style="color: black;" /></td>
        </tr>
    </table>


       
                
                
<%--                     <form method="post" action="<%=request.getContextPath()%>/bookPayment">
 --%>            			
 					<input type="submit" class="btn btn-danger" value="Pay with PayPal">
         		</form>
                </div>
                

               
            </div>
        
       

		<%@ include file="assets/footer/footer.jsp"%>
</body>
</html>
