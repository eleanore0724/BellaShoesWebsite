package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.base.BaseUtils;
import tw.com.lccnet.model.Product;

public interface ProductDao extends BaseUtils<Product>{
	
	//當Category沒有值
	public List<Product> query();
	
	public List<Product> queryByCategory(String category);
	public Product getProductById(int id);
	
	public List<Product> getProductsByGroup(int groupById);
	Product getProductByGroupSizeColor(String groupById, String size, String color);
	
	// 取得所有標記為精選的商品
    List<Product> getFeaturedProducts();
}
