package tw.com.lccnet.dao.daoLmpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import tw.com.lccnet.dao.OrderDao;
import tw.com.lccnet.databaseutils.DBUtils;
import tw.com.lccnet.model.CartItem;
import tw.com.lccnet.model.Order;
import tw.com.lccnet.model.ShippingAddress;

public class OrderDaoImpl implements OrderDao{
	private Connection conn = DBUtils.getDataBase().getConnection();
	PreparedStatement psOrder = null;
	PreparedStatement psItem = null;
	
	@Override
	public boolean createOrder(int user_id, List<CartItem> cartItems) throws Exception {
		String insertOrderSQL = "INSERT INTO orders(user_id, total_price, created_at, orders_status) VALUES (?, ?, NOW(), '已成立')";
		String insertItemSQL = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
		
		try {
			conn.setAutoCommit(false);// 關閉自動提交 
			
			// 計算總金額
			double total = 0;
			for (CartItem item : cartItems) {
                total += item.getPrice() * item.getQuantity();
            }
			
			// 建立 orders
			psOrder = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
			psOrder.setInt(1, user_id);
			psOrder.setDouble(2, total);
			psOrder.executeUpdate();
            
			// 取得新建立的 order_id
			ResultSet rs = psOrder.getGeneratedKeys();
			int order_id = 0;
			if (rs.next()) {
                order_id = rs.getInt(1);
            }
			
			//建立 order_items
			psItem =conn.prepareStatement(insertItemSQL);
			for (CartItem item : cartItems) {
				psItem.setInt(1, order_id);
				psItem.setInt(2, item.getProduct_id());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getPrice());
                psItem.addBatch();
			}
			psItem.executeBatch();
			conn.commit(); // 提交交易
            return true;
		} catch (Exception e) {
			if (conn != null) conn.rollback();
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Order> getOrdersByUser(int user_id) {
		List<Order> list =new ArrayList<Order>();
		String sql ="SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";
		
		try {
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs =ps.executeQuery();
			
			while(rs.next()) {
				Order o =new Order();
				o.setOrder_id(rs.getInt("order_id"));
				o.setUser_id(rs.getInt("user_id"));
				o.setTotal_price(rs.getDouble("total_price"));
				o.setCreated_at(rs.getDate("created_at"));
				o.setOrders_status(rs.getString("orders_status"));
				list.add(o);
				
			}
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Order getOrderById(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

	// 存入寄送資訊
	@Override
	public void insertShippingAddress(ShippingAddress shippingAddress) {
		String sql = "INSERT INTO shipping_addresses (receiver_name, phone, address, order_id) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement ps =conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			//ps.setInt(1, shippingAddress.getUserId());
			
			ps.setString(1, shippingAddress.getReceiverName());
			ps.setString(2, shippingAddress.getPhone());
			ps.setString(3, shippingAddress.getAddress());
			ps.setInt(4, shippingAddress.getOrderId());
			int rowAffected = ps.executeUpdate();
			
			if (rowAffected > 0) {
	            System.out.println("成功存入寄送資訊");
	        }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
