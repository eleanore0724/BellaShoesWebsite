package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.model.CartItem;
import tw.com.lccnet.model.Order;

public interface CartDao {
	// 創建訂單
	int insertCartItem(int user_id, double totalPrice,List<CartItem> cart);
	
	// 從購物車取出使用者的所有項目
	List<CartItem> getCartByUserId(int user_id);
	
	// 取消訂單
	void deleteCartByUserId(int user_id);
	
}
