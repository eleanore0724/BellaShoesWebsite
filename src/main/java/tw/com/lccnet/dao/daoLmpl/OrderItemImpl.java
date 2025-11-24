package tw.com.lccnet.dao.daoLmpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.com.lccnet.dao.OrderItemDao;
import tw.com.lccnet.databaseutils.DBUtils;
import tw.com.lccnet.model.OrderItems;

public class OrderItemImpl implements OrderItemDao{
	
	private Connection conn = DBUtils.getDataBase().getConnection();
	
	@Override
	public List<OrderItems> getItemsByOrderId(int order_id) {
		List<OrderItems> list = new ArrayList<>();
		String sql = "SELECT * FROM order_items WHERE order_id = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, order_id);
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        	OrderItems item = new OrderItems();
	        	item.setItem_id(rs.getInt("item_id")); 
	            item.setProduct_name(rs.getString("product_name"));
	            item.setProduct_id(rs.getInt("product_id"));
	            item.setPrice(rs.getInt("price"));
	            item.setQuantity(rs.getInt("quantity"));
	            item.setColor(rs.getString("color"));
	            item.setSize(rs.getString("size"));
	            list.add(item);
	        }
	        
	        System.out.println(" OrderItemImpl 的 list"+list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
