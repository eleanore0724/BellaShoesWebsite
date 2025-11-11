package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.base.BaseUtils;
import tw.com.lccnet.model.Product;

public interface ProductDao extends BaseUtils<Product>{
	
	public List<Product> query();
	public List<Product> queryByCategory(String category);
	public Product getProductById(int id);
}
