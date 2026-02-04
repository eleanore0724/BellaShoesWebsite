package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.com.lccnet.dao.OrderDao;
import tw.com.lccnet.dao.daoLmpl.OrderDaoImpl;
import tw.com.lccnet.model.ShippingAddress;

import java.io.IOException;


@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDao orderdao =new OrderDaoImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// int userId = Integer.parseInt(request.getParameter("user_id"));
		String orderIdStr = request.getParameter("orderId");
		int orderId = Integer.parseInt(orderIdStr);
        String receiverName = request.getParameter("shipping_name");
        String phone = request.getParameter("shipping_phone");
        String address = request.getParameter("shipping_address");
        String deliveryMethod =request.getParameter("shipping");
        String paymentMethod = request.getParameter("payment");
        System.out.println("orderId:" + orderId +"receiverName：" + receiverName+ "address:" + address+"deliveryMethod:"+deliveryMethod + "paymentMethod:" + paymentMethod);
        
        
        ShippingAddress sa = new ShippingAddress();
        // sa.setUserId(userId);
        sa.setOrderId(orderId);
        sa.setReceiverName(receiverName);
        sa.setPhone(phone);
        sa.setAddress(address);
        // sa.setDeliveryMethod(deliveryMethod);
        // sa.setPaymentMethod(paymentMethod);

        orderdao.insertShippingAddress(sa);
        
        response.sendRedirect("success.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
