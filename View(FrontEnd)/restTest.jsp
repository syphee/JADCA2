<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>test RESTful endpoints!!!111</h1>


<form action="<%=request.getContextPath()%>/restfulTesting" method="POST">
	<input type="submit" class="btn btn-danger" value="restfulsuccess" id="RESTtest">
</form>
</body>
</html>