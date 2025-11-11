package tw.com.lccnet.dao.daoLmpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tw.com.lccnet.dao.ProductDao;
import tw.com.lccnet.databaseutils.DBUtils;
import tw.com.lccnet.model.Product;

public class ProductDaoImpl implements ProductDao{
	
	private Connection conn = DBUtils.getDataBase().getConnection();
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	//搜尋全部-----------------------------
	@Override
	public List<Product> query() {
		
		List<Product> list = new ArrayList<Product>();
		try {
			String sql = "Select * from products ORDER BY product_id";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Product product =new Product();
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setCategory(rs.getString("category"));
				product.setImage_url(rs.getString("image_url"));
				product.setPrice(rs.getInt("price"));
				product.setDescription(rs.getString("description"));
				list.add(product);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	//搜尋queryByCategory產品-----------------------------
	@Override
	public List<Product> queryByCategory(String category) {
		List<Product> list = new ArrayList<>();

	    String sql = "SELECT * FROM products WHERE category = ?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, category);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Product product = new Product();
	                product.setProduct_id(rs.getInt("product_id"));
	                product.setProduct_name(rs.getString("product_name"));
	                product.setCategory(rs.getString("category"));
	                product.setImage_url(rs.getString("image_url"));
	                product.setPrice(rs.getInt("price"));
	                product.setDescription(rs.getString("description"));
	                list.add(product);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public Product getProductById(int id) {
		Product product = null;
		String sql = "SELECT * FROM products WHERE product_id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				product.setProduct_id(rs.getInt("product_id"));
	            product.setProduct_name(rs.getString("product_name"));
	            product.setCategory(rs.getString("category"));
	            product.setImage_url(rs.getString("image_url"));
	            product.setImage_url_2(rs.getString("image_url_2"));
	            product.setImage_url_3(rs.getString("image_url_3"));
	            product.setPrice(rs.getInt("price"));
	            product.setStock(rs.getInt("stock"));
	            product.setDescription(rs.getString("description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
}
