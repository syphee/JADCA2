package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.DBConnection;

public class SalesDAO {

	public ArrayList<Sales> getSales() throws SQLException, ClassNotFoundException{
		ArrayList<Sales> sales = new ArrayList<Sales>();
		
		Connection conn = null;
		
		try {
			conn = DBConnection.getConnection();
			String sqlString = "select a.userid as order_id, b.first_name, b.last_name, "
					+ "a.order_date, a.total_amount"
					+ " FROM orders a, users b where a.userid = b.userid;";	
					
      		PreparedStatement pstmt = conn.prepareStatement(sqlString);
      		ResultSet rs = pstmt.executeQuery();
      		
      		
      		while(rs.next()) {
      			Sales sale = new Sales();
      			sale.setOrderid(rs.getInt("order_id"));
      			sale.setFirst_name(rs.getString("first_name"));
      			sale.setLast_name(rs.getString("last_name"));
      			sale.setOrder_date(rs.getString("order_date"));
      			sale.setTotal_amount(rs.getFloat("total_amount"));
      			
      			
      				 // can try to later make convert it to a DATETIME data 
      				 //just that that will be additional parsing needed later
      			
      			
//      			 // Retrieve the order_date as a Timestamp
//      		    java.sql.Timestamp orderDateTimestamp = rs.getTimestamp("order_date");
//      		    
//      		    // Convert the Timestamp to a more readable format (e.g., yyyy-MM-dd HH:mm:ss)
//      		    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//      		    String orderDateFormatted = sdf.format(orderDateTimestamp);
//      		    
//      		    sale.setOrder_date(orderDateFormatted);
//
//      		    // Add the sale to the ArrayList
//      		    sales.add(sale);
      			
      			
      			
      		}
		}catch (Exception e) {
			System.out.println("not working");
			System.out.println("...UserDetails" + e);
			
			
		} finally {
			conn.close();
		}
		
		return sales;
		
	}
	
}
