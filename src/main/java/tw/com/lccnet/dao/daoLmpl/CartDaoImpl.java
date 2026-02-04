package tw.com.lccnet.dao.daoLmpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import tw.com.lccnet.dao.CartDao;
import tw.com.lccnet.databaseutils.DBUtils;
import tw.com.lccnet.model.CartItem;
import tw.com.lccnet.model.Order;

public class CartDaoImpl implements CartDao{
	
	private Connection conn = DBUtils.getDataBase().getConnection();

	@Override
	public int insertCartItem(int user_id, double totalPrice ,List<CartItem> cart) {
		int orderId = 0;
		String insertOrderSQL  = "INSERT INTO orders (user_id, total_price, created_at, orders_status) VALUES (?, ?, NOW(), '已成立')";
		String insertItemSQL = "INSERT INTO order_items (order_id, product_id, quantity, price, size, color, product_name) VALUES (?, ?, ?, ?, ?,?,?)";
		try {
			conn.setAutoCommit(false); // 開始交易
			
			// 建立訂單主檔
			PreparedStatement orderPs =conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
			orderPs.setInt(1, user_id);
			orderPs.setDouble(2, totalPrice);
			orderPs.executeUpdate();
			
			// 取得 order_id
			ResultSet rs = orderPs.getGeneratedKeys();
			if (rs.next()) {
                orderId = rs.getInt(1);
            }
			System.out.println("orderId:" + orderId);
			
			// 寫入訂單明細
			PreparedStatement itemPs = conn.prepareStatement(insertItemSQL);
			
			for (CartItem item : cart) {
                itemPs.setInt(1, orderId);
                itemPs.setInt(2, item.getProduct_id());
                itemPs.setInt(3, item.getQuantity());
                itemPs.setDouble(4, item.getPrice());
                itemPs.setString(5, item.getSize());
                itemPs.setString(6, item.getColor());
                itemPs.setString(7, item.getProduct_name());
                itemPs.addBatch();
            }
			itemPs.executeBatch();
			
			conn.commit(); // 提交交易
			return orderId;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
                if (conn != null) conn.rollback(); // 發生錯誤回滾
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
			return -1;
		}
		
	}

	@Override
	public List<CartItem> getCartByUserId(int user_id) {
		String sql = "SELECT * FROM cart WHERE user_id = ?";
		List<CartItem> list = new ArrayList<>();
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CartItem item = new CartItem();
				item.setCart_item_id( rs.getInt("product_id"));
				item.setProduct_name(rs.getString("product_name"));
				item.setPrice(rs.getInt("price"));
				item.setQuantity(rs.getInt("quantity"));
				item.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
				list.add(item);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteCartByUserId(int user_id) {
		String sql = "DELETE FROM cart WHERE user_id = ?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
