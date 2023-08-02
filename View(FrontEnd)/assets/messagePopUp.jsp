
<%
String code = request.getParameter("c");
String message = request.getParameter("m");
String color ="";
String popup ="";
try{
	if(code.equals("success")){
		color = "alert-success";
    	System.out.println("SUCCESS!!");
    	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
    	
    	// bootstrap card
    	popup = "<div class=\"m-0 alert " +color + " role=\"alert\">\r\n"
	     		+ message + "\r\n"
	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	     		+ "</div>";
	}else if(code.equals("false")){
		color = "alert-danger";
    	System.out.println("FAILED!!");
    	//response.sendRedirect(request.getContextPath()+"/BookstoreCA1/JAD-CA1/View(FrontEnd)/AdminPanel.jsp?c="+color+"&o="+output);
    	
    	// bootstrap card
    	popup = "<div class=\"m-0 alert " +color + " role=\"alert\">\r\n"
	     		+ message + "\r\n"
	     		+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
	     		+ "</div>";
	}
	
}catch(Exception x){
	System.out.println(x);
	
}


%>

<%=popup %>
