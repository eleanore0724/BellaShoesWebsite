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
			String sql = "SELECT p.* FROM products p JOIN (SELECT groupBy_id, MIN(product_id) AS pid FROM products GROUP BY groupBy_id) x ON p.groupBy_id = x.groupBy_id AND p.product_id = x.pid;";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Product product =new Product();
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setGroupBy_id(rs.getInt("groupBy_id"));
				product.setSize(rs.getString("size"));
				product.setColor(rs.getString("color"));
				product.setCategory(rs.getString("category"));
				product.setImage_url(rs.getString("image_url"));
				product.setPrice(rs.getInt("price"));
				product.setStock(rs.getInt("stock"));
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

	    String sql = "SELECT p.* FROM products p JOIN (SELECT groupBy_id, MIN(product_id) AS pid FROM products GROUP BY groupBy_id) x ON p.groupBy_id = x.groupBy_id AND p.product_id = x.pid WHERE p.category = ?;";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, category);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Product product = new Product();
	                product.setProduct_id(rs.getInt("product_id"));
	                product.setGroupBy_id(rs.getInt("groupBy_id"));
	                product.setProduct_name(rs.getString("product_name"));
	                product.setSize(rs.getString("size"));
					product.setColor(rs.getString("color"));
	                product.setCategory(rs.getString("category"));
	                product.setImage_url(rs.getString("image_url"));
	                product.setPrice(rs.getInt("price"));
	                product.setStock(rs.getInt("stock"));
	                product.setDescription(rs.getString("description"));
	                list.add(product);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	//-----------------------------
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
	            product.setGroupBy_id(rs.getInt("groupBy_id"));
	            product.setSize(rs.getString("size"));
				product.setColor(rs.getString("color"));
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

	//-----------------------------
	@Override
	public List<Product> getProductsByGroup(int groupById) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM products WHERE groupBy_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, groupById);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()){
				Product p = new Product();
				p.setProduct_id(rs.getInt("product_id"));
				p.setGroupBy_id(rs.getInt("groupBy_id"));
				p.setProduct_name(rs.getString("product_name"));
				p.setSize(rs.getString("size"));
				p.setColor(rs.getString("color"));
				p.setImage_url(rs.getString("image_url"));
				p.setPrice(rs.getInt("price"));
				p.setStock(rs.getInt("stock"));
				list.add(p);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//-----------------------------
	@Override
	public Product getProductByGroupSizeColor(String groupById, String size, String color) {
		String sql = "SELECT * FROM products WHERE groupBy_id = ? AND size = ? AND color = ?";
		Product p = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, groupById);
			ps.setString(2, size);
			ps.setString(3, color);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
	            p = new Product();
	            p.setProduct_id(rs.getInt("product_id"));
	            p.setSize(rs.getString("size"));
	            p.setColor(rs.getString("color"));
	            p.setImage_url(rs.getString("image_url"));
	            p.setPrice(rs.getInt("price"));
	            p.setStock(rs.getInt("stock"));
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	

}
