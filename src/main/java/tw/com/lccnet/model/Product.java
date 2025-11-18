package tw.com.lccnet.model;

import java.util.Date;
import java.util.Objects;

public class Product {
	private Integer product_id;
	private Integer groupBy_id;
	private String product_name;
	private String size;
	private String color;
	private String category;
	private String image_url;
	private String image_url_2;
	private String image_url_3;
	private Integer price;
	private Integer stock;
	private String description;
	
	public Product() {
		super();
	}
	
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
	
	
	public Integer getGroupBy_id() {
		return groupBy_id;
	}

	public void setGroupBy_id(Integer groupBy_id) {
		this.groupBy_id = groupBy_id;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_name=" + product_name + ", size=" + size + ", color="
				+ color + ", category=" + category + ", image_url=" + image_url + ", image_url_2=" + image_url_2
				+ ", image_url_3=" + image_url_3 + ", price=" + price + ", stock=" + stock + ", description="
				+ description + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(category, color, description, image_url, image_url_2, image_url_3, price, product_id,
				product_name, size, stock);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(category, other.category) && Objects.equals(color, other.color)
				&& Objects.equals(description, other.description) && Objects.equals(image_url, other.image_url)
				&& Objects.equals(image_url_2, other.image_url_2) && Objects.equals(image_url_3, other.image_url_3)
				&& Objects.equals(price, other.price) && Objects.equals(product_id, other.product_id)
				&& Objects.equals(product_name, other.product_name) && Objects.equals(size, other.size)
				&& Objects.equals(stock, other.stock);
	}
}
