<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String user = (String)session.getAttribute("username");
    String role = (String)session.getAttribute("role");

    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	Successfully logged in.
	<%=user %>
	<%=role %>

</div>
</body>
</html>