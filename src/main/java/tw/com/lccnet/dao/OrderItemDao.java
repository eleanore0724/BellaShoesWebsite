package tw.com.lccnet.dao;

import java.util.List;

import tw.com.lccnet.model.OrderItems;

public interface OrderItemDao {
	public List<OrderItems> getItemsByOrderId(int order_id);
}
