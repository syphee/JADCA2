<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
    table { border: 0; }
    table td { padding: 5px; }
</style>


<script> 
var timeout = 5; //set time here 5sec
function timer(){ 
   if( --timeout > 0 ){ 
      document.forma.clock.value = timeout; 
      window.setTimeout( "timer()", 1000 ); 
   } 
   else{ 
     document.forma.clock.value = "Time over"; 
     ///disable submit-button etc 
   } 
   if(document.forma.clock.value=="Time over"){
     top.document.location.replace('/CA2/BookstoreCA1/JAD-CA1/View(FrontEnd)/home.jsp'); //redirect page url
   }
}     
</script>

</head>
<body>
<div align="center">
    <h1>Payment Done. Thank you for purchasing our products</h1>
    <br/>
    <h2>Receipt Details:</h2>
    <table>
        <tr>
            <td><b>Merchant:</b></td>
            <td>Company ABC Ltd.</td>
        </tr>
        <tr>
            <td><b>Payer:</b></td>
            <td>${payer.firstName} ${payer.lastName}</td>      
        </tr>
        <tr>
            <td><b>Description:</b></td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td><b>Subtotal:</b></td>
            <td>${transaction.amount.details.subtotal} USD</td>
        </tr>
        <tr>
            <td><b>Shipping:</b></td>
            <td>${transaction.amount.details.shipping} USD</td>
        </tr>
        <tr>
            <td><b>Tax:</b></td>
            <td>${transaction.amount.details.tax} USD</td>
        </tr>
        <tr>
            <td><b>Total:</b></td>
            <td>${transaction.amount.total} USD</td>
        </tr>                    
    </table>
    
    <p> You will be redirected back to home page... </p>
    <script>
    timer();
    </script>
</div>
</body>
</html>