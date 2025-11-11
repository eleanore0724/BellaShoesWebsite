package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.model.CartItem;

public interface OrderDao {
	
	boolean createOrder(int user_id, List<CartItem> cartItems) throws Exception;
}
