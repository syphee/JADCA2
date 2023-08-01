<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
        table { border: 0; }
        table td { padding: 10px; }
    </style>	

</head>
<body>

<div align="center">
    <h1>Check Out</h1>
    <br/>
    <form action="<%=request.getContextPath() %>/AuthorizePaymentServlet" method="post">
    <table>
        <tr>
            <td>Product/Service:</td>
            <td><input type="text" name="product" value="Book details" /></td>
        </tr>
        <tr>
            <td>Sub Total:</td>
            <td><input type="text" name="subtotal" value="100" /></td>
        </tr>
        <tr>
            <td>Shipping:</td>
            <td><input type="text" name="shipping" value="10" /></td>
        </tr>    
        <tr>
            <td>Tax:</td>
            <td><input type="text" name="tax" value="10" /></td>
        </tr>    
        <tr>
            <td>Total Amount:</td>
            <td><input type="text" name="total" value="120" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Checkout" />
            </td>
        </tr>
    </table>
    </form>
</div>


</body>
</html>