/*
 * package model;
 * 
 * import com.itextpdf.text.Document; import
 * com.itextpdf.text.DocumentException; import com.itextpdf.text.Paragraph;
 * import com.itextpdf.text.pdf.PdfWriter; import java.io.FileOutputStream;
 * import java.util.ArrayList;
 * 
 * 
 * 
 * public class PDFGenerator { public static void
 * generateOrderPDF(ArrayList<Sales> topSalesList, String filePath) throws
 * DocumentException { Document document = new Document(); try {
 * PdfWriter.getInstance(document, new FileOutputStream(filePath));
 * document.open(); for (Sales sale : topSalesList) { document.add(new
 * Paragraph("Order ID: " + sale.getOrderid())); document.add(new
 * Paragraph("First Name: " + sale.getFirstname())); document.add(new
 * Paragraph("Last Name: " + sale.getLastname())); // Add other order details
 * document.add(new Paragraph("------------------------------")); } } catch
 * (Exception e) { e.printStackTrace(); } finally { document.close(); } } }
 */