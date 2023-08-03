package model;

import java.sql.*;

import model.DBConnection;

public class OrderDAO {
    public int createOrder(int userid, float total) throws SQLException, ClassNotFoundException {
        int record = 0;
        int nrow = 0;
        Connection conn = null;
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
                }
            }
            System.out.println("Order Created in DB");
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return record;
    }
}
