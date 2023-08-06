package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.DBConnection;

public class SalesDAO {

	public ArrayList<Sales> getSales() throws SQLException, ClassNotFoundException{
		
		//intialize into sales variable
		ArrayList<Sales> sales = new ArrayList<Sales>();
		
		Connection conn = null;
	
		
		
		try {
			
			conn = DBConnection.getConnection();
			String sqlString = "select a.userid as order_id, b.first_name, b.last_name, a.order_date, a.total_amount FROM orders a, users b where a.userid = b.userid;";	
					
			
      		PreparedStatement pstmt = conn.prepareStatement(sqlString);
      		ResultSet rs = pstmt.executeQuery();
      		
      		
      		while(rs.next()) {
      			Sales sale = new Sales();
      			
      			sale.setOrderid(rs.getInt("order_id"));
      			sale.setFirstname(rs.getString("first_name"));
      			sale.setLastname(rs.getString("last_name"));
      			sale.setOrderdate(rs.getString("order_date"));
      			sale.setTotalamount(rs.getFloat("total_amount"));
      			
      	
      			
      
      	       

      			
      			//pushing the rs into the arrayList
      			sales.add(sale);
      			
      			
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
      		
      		//catch any error
      		
		}catch (Exception e) {
			System.out.println("not working");
			System.out.println("...UserDetails" + e);
			e.printStackTrace();
			System.out.println();
			
		} finally {
			conn.close();
		}
		//returns sales everything the method is called :)
		
		return sales;
		
		
	}

	public ArrayList<Sales> getTopSales(int limit) throws SQLException, ClassNotFoundException {
	    ArrayList<Sales> topSales = new ArrayList<>();
	    Connection conn = null;

	    try {
	        conn = DBConnection.getConnection(); // You were missing the assignment here

	        String sqlString = "SELECT a.userid AS order_id, b.first_name, b.last_name, a.order_date, a.total_amount "
	                + "FROM orders a, users b "
	                + "WHERE a.userid = b.userid "
	                + "ORDER BY a.total_amount DESC "
	                + "LIMIT ?";

	        PreparedStatement pstmt = conn.prepareStatement(sqlString);
	        pstmt.setInt(1, limit);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Sales sale = new Sales();
	            sale.setOrderid(rs.getInt("order_id"));
	            sale.setFirstname(rs.getString("first_name"));
	            sale.setLastname(rs.getString("last_name"));
	            sale.setOrderdate(rs.getString("order_date"));
	            sale.setTotalamount(rs.getFloat("total_amount"));
	            topSales.add(sale);
	        }
	        //not 
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // Rethrow the exception to handle it further up the call stack
	    } finally {
	        if (conn != null) {
	            conn.close();
	        }
	    }

	    return topSales;
	}

	
}
