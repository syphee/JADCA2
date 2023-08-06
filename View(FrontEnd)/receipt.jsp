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
    
    /* CSS */
.button-27 {
  appearance: none;
  background-color: #000000;
  border: 2px solid #1A1A1A;
  border-radius: 15px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-block;
  font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
  font-size: 16px;
  font-weight: 600;
  line-height: normal;
  margin: 0;
  min-height: 60px;
  min-width: 0;
  outline: none;
  padding: 16px 24px;
  text-align: center;
  text-decoration: none;
  transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: 100%;
  will-change: transform;
}

.button-27:disabled {
  pointer-events: none;
}

.button-27:hover {
  box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
  transform: translateY(-2px);
}

.button-27:active {
  box-shadow: none;
  transform: translateY(0);
}otal amount row */
.total-row {
    font-weight: bold;
}


      body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%;
            max-width: 600px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 10px;
        }
        h2 {
            color: #444;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            appearance: none;
            background-color: #e74c3c;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            line-height: normal;
            margin-top: 20px;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
            user-select: none;
            width: 100%;
            will-change: transform;
        }
        .btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        .btn:active {
            background-color: #e74c3c;
            transform: translateY(0);
        }

    
    
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
    
    <form method="post" action="<%=request.getContextPath()%>/bookPayment">
            			<input type="submit" class="btn btn-danger" value="Back to home">
	       				
            		</form>
   
 
    
  
    

</div>
</body>
</html>