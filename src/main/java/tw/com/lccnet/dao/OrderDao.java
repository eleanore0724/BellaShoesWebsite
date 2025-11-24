package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.model.CartItem;
import tw.com.lccnet.model.Order;

public interface OrderDao {
	
	boolean createOrder(int user_id, List<CartItem> cartItems) throws Exception;
	
	// 取得指定會員的所有訂單
	public List<Order> getOrdersByUser(int user_id);
	
	// 查單筆訂單
	public Order getOrderById(int orderId);
}
