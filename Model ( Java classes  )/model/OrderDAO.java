package model;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class OrderDAO {
    public int createOrder(int userid, float total,HashMap<String,Integer> order_items) throws SQLException, ClassNotFoundException {
        int record = 0;
        
        // if nrow more than 0 , then insert into order_items
        int nrow = 0;
        Connection conn;
        try {
            conn = DBConnection.getConnection();
            String sqlString = "INSERT INTO orders (userid, order_date, total_amount) VALUES (?, CURDATE(), ?)";
            PreparedStatement pstmt = conn.prepareStatement(sqlString, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, userid);
            pstmt.setFloat(2, total);
            nrow = pstmt.executeUpdate();
            if (nrow > 0) {
                ResultSet orderid = pstmt.getGeneratedKeys();
                if (orderid.next()) {
                    record = orderid.getInt(1);
                    
                    // close first connection
                    conn.close();
                    
                   // record will be the id of the order
                    insertIntoOrder(order_items,record);
                }
            }
            System.out.println("Order Created in DB");
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } 
        
        if(nrow > 0) {
        	
        }
        
        
        
        return record;
    }
    
    public void insertIntoOrder(HashMap<String,Integer> order_items,int order_id) throws SQLException,Exception{
    	int affectedRows= 0;
    	int record = 0;
        
    
        // do a for each loop through the hashmap
        for(Map.Entry a:order_items.entrySet()) {
        	 Connection conn;
             try {
            	 int quantity = (int) a.getValue();
            	 String book_id = (String) a.getKey();
            	 
            	 int PARSED_book_id = Integer.parseInt(book_id);
            	 
                 conn = DBConnection.getConnection();
                 String sqlString = "INSERT INTO order_items (order_id,quantity,book_id) VALUES (?,?, ?)";
                 PreparedStatement pstmt = conn.prepareStatement(sqlString, Statement.RETURN_GENERATED_KEYS);
                 pstmt.setInt(1, order_id);
                 pstmt.setInt(2, quantity);
                 pstmt.setInt(3, PARSED_book_id);
                 affectedRows = pstmt.executeUpdate();
                 
                 if (affectedRows > 0) {
                     ResultSet orderid = pstmt.getGeneratedKeys();
                     if (orderid.next()) {
                         record = orderid.getInt(1);
                         
                         // record will be the id of the order

                     }
                 }
                 System.out.println("Order Created in DB");
                 conn.close();
             } catch (Exception e) {
                 // TODO: handle exception
                 e.printStackTrace();

             }
        }
    }
}
