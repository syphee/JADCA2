<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dbDAO.sqlPassword"%>
<%
final String SQLpassword = sqlPassword.getSQLPassword();
String path = request.getContextPath();

%>

<%
String URI = "";

//constructing bootstrap card
String color = "";
String output2 = "";
String message = "";
color = request.getParameter("c");
output2 = request.getParameter("o");
if (color != null || output2 != null) {
	message = "<div class=\"alert " + color + " role=\"alert\">\r\n" + output2 + "\r\n"
	+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	+ "</div>";
}
%>