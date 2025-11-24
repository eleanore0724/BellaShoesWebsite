package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tw.com.lccnet.dao.OrderDao;
import tw.com.lccnet.dao.OrderItemDao;
import tw.com.lccnet.dao.daoLmpl.OrderDaoImpl;
import tw.com.lccnet.dao.daoLmpl.OrderItemImpl;
import tw.com.lccnet.model.Order;
import tw.com.lccnet.model.OrderItems;
import tw.com.lccnet.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/myOrders")
public class MyOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User auth = (User)session.getAttribute("auth");
		
		if (auth == null) {
			response.sendRedirect("login.jsp");
            return;
        }
		
		OrderDao orderDao =new OrderDaoImpl();
		OrderItemDao itemDao=new OrderItemImpl();
		
		List<Order> orders=orderDao.getOrdersByUser(auth.getId());
		
		for (Order o : orders) {
            List<OrderItems> items = itemDao.getItemsByOrderId(o.getOrder_id());
            o.setItems(items);  // 你在 Order model 加一個 List<OrderItem>
        }
		
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("member.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
