package tw.com.lccnet.model;

import java.time.LocalDateTime;

public class CartItem {
	private int cart_item_id;
	private int product_id;
	private int quantity;
	private String size;
	private String product_name;
	private String image_url;
	private int price;
	private String color;
	private Integer user_id;
	private LocalDateTime created_at;
	private int order_id;
	
	public CartItem() {}
	
	public CartItem(int cart_item_id, int product_id, int quantity, String product_name, String image_url, int price,
			Integer user_id) {
		super();
		this.cart_item_id = cart_item_id;
		this.product_id = product_id;
		this.quantity = quantity;
		this.product_name = product_name;
		this.image_url = image_url;
		this.price = price;
		this.user_id = user_id;
		this.created_at = LocalDateTime.now();
	}

	public CartItem(int product_id, String product_name, int price, String image_url ,int quantity,String size, String color) {
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.image_url = image_url;
		this.quantity = quantity;
		this.size = size;
		this.color = color;
		this.created_at = LocalDateTime.now();
	}
	
	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public int getCart_item_id() {
		return cart_item_id;
	}

	public void setCart_item_id(int cart_item_id) {
		this.cart_item_id = cart_item_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}



	public LocalDateTime getCreated_at() {
		return created_at;
	}

	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
}
