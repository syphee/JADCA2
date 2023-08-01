package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;

import javax.ws.rs.core.Response;

import javax.ws.rs.core.MultivaluedHashMap;
import javax.ws.rs.core.MultivaluedMap;

/**
 * Servlet implementation class restfulTesting
 */
@WebServlet("/restfulTesting")
public class restfulTesting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public restfulTesting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		
		String value = request.getParameter("RESTtest");
		
		MultivaluedMap<String, String> formData = new MultivaluedHashMap<>();
		formData.add("value", value);

		
		Client client = ClientBuilder.newClient();
		
		String restUrl = "http://localhost:8085/CA2Backend/users/testRest";
		WebTarget target = client.target(restUrl);
		
		// APPLICATION_FORM_URLENCODED for form inputs, will be accessible via request.getParameter
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		
		//Response resp = invocationBuilder.post(Entity.form(formData));
		Response resp = invocationBuilder.get();
		System.out.println("Status : " + resp.getStatus());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
		
		String value = request.getParameter("RESTtest");
		
		MultivaluedMap<String, String> formData = new MultivaluedHashMap<>();
		formData.add("value", value);

		
		Client client = ClientBuilder.newClient();
		
		String restUrl = "http://localhost:8085/CA2Backend/users/testRest";
		WebTarget target = client.target(restUrl);
		
		// APPLICATION_FORM_URLENCODED for form inputs, will be accessible via request.getParameter
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		
		//Response resp = invocationBuilder.post(Entity.form(formData));
		Response resp = invocationBuilder.get();
		System.out.println("Status : " + resp.getStatus());
		
		
		
	}

}
