package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.model.CartItem;

public interface CartDao {
	
	boolean insertCartItem(int user_id, double totalPrice,List<CartItem> cart);
	
	//從購物車取出使用者的所有項目
	List<CartItem> getCartByUserId(int user_id);
	
	//取消訂單
	void deleteCartByUserId(int user_id);
}
