package model;

public class Sales {

	private int orderid;
	private int userid;
	private String first_name;
	private String last_name;
	private String order_date;
	private float total_amount;
	
	
	/**
	 * @return the first_name
	 */
	public String getFirst_name() {
		return first_name;
	}
	/**
	 * @param first_name the first_name to set
	 */
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	/**
	 * @return the last_name
	 */
	public String getLast_name() {
		return last_name;
	}
	/**
	 * @param last_name the last_name to set
	 */
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	/**
	 * @return the orderid
	 */
	public int getOrderid() {
		return orderid;
	}
	/**
	 * @param orderid the orderid to set
	 */
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	/**
	 * @return the userid
	 */
	public int getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(int userid) {
		this.userid = userid;
	}
	/**
	 * @return the order_date
	 */
	public String getOrder_date() {
		return order_date;
	}
	/**
	 * @param order_date the order_date to set
	 */
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	/**
	 * @return the total_amount
	 */
	public float getTotal_amount() {
		return total_amount;
	}
	/**
	 * @param total_amount the total_amount to set
	 */
	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}
	
	
}
