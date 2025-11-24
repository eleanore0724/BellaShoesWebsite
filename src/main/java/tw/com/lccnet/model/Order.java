package tw.com.lccnet.model;

import java.util.Date;
import java.util.List;

public class Order {
	private int order_id;
	private int user_id;
	private double total_price;
	private Date created_at;
	private String orders_status;
	private List<OrderItems> items;
	
	
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getOrders_status() {
		return orders_status;
	}
	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}
	
	
	public List<OrderItems> getItems() {
		return items;
	}
	public void setItems(List<OrderItems> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", total_price=" + total_price + ", created_at="
				+ created_at + ", orders_status=" + orders_status + "]";
	}
	
}
