package servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addBook
 */
@WebServlet("/addBook")
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15, // 15 MB
        location            = "D:\\Eclipse\\New\\JADPracticals\\src\\main\\webapp\\test"
)
public class addBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the file part from the request
		HttpSession session = request.getSession();

        Part filePart = request.getPart("file");
        
        
        
        // Get the filename
        String fileName = getFileName(filePart);
        System.out.println(fileName);
        
        // Save the file to a desired location
        File outputFile = new File("../JADPracticals/test/assets", fileName);
        try (InputStream inputStream = filePart.getInputStream()) {
            Files.copy(inputStream, outputFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        
        // Redirect or return a response to the client
        session.setAttribute("output", fileName);
        response.sendRedirect("../JADPracticals/test/index.jsp");
    }
    
    // Helper method to extract the filename from the Part object
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }

}
