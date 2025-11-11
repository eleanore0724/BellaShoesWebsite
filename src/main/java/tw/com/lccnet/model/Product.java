package tw.com.lccnet.model;

import java.util.Date;

public class Product {
	private Integer product_id;
	private String product_name;
	private String category;
	private String image_url;
	private String image_url_2;
	private String image_url_3;
	private Integer price;
	private Integer stock;
	private String description;
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getImage_url_2() {
		return image_url_2;
	}
	public void setImage_url_2(String image_url_2) {
		this.image_url_2 = image_url_2;
	}
	public String getImage_url_3() {
		return image_url_3;
	}
	public void setImage_url_3(String image_url_3) {
		this.image_url_3 = image_url_3;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
