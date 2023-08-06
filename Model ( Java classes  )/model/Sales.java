package model;

public class Sales {
	
	private int orderid;
	private int userid;
	private String firstname;
	private String lastname;
	private float totalamount;
	private String orderdate;
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
	 * @return the firstname
	 */
	public String getFirstname() {
		return firstname;
	}
	/**
	 * @param firstname the firstname to set
	 */
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	/**
	 * @return the lastname
	 */
	public String getLastname() {
		return lastname;
	}
	/**
	 * @param lastname the lastname to set
	 */
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	/**
	 * @return the totalamount
	 */
	public float getTotalamount() {
		return totalamount;
	}
	/**
	 * @param totalamount the totalamount to set
	 */
	public void setTotalamount(float totalamount) {
		this.totalamount = totalamount;
	}
	/**
	 * @return the orderdate
	 */
	public String getOrderdate() {
		return orderdate;
	}
	/**
	 * @param orderdate the orderdate to set
	 */
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
	 @Override
	    public String toString() {
	        return "Order{" +
	                ", customerId=" + orderid +
	                ", firstname=" + firstname +
	                ", lastname=" + lastname +
	                ", orderDate=" +  orderdate +
	                ", totalAmount=" + totalamount +
	                '}';
	    }
	
	
}