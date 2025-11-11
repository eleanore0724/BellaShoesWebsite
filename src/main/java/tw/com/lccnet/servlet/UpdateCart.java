package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tw.com.lccnet.model.CartItem;

import java.io.IOException;
import java.util.List;

@WebServlet("/updateCart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String action = request.getParameter("action");  // "increase" or "decrease"
		
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		
		if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProduct_id() == product_id) {
                    if ("increase".equals(action)) item.setQuantity(item.getQuantity() + 1);
                    if ("decrease".equals(action) && item.getQuantity() > 1) item.setQuantity(item.getQuantity() - 1);
                    break;
                }
            }
        }
		
		// 計算總數量
        int totalQuantity = 0;
        if (cart != null) {
            for (CartItem item : cart) {
                totalQuantity += item.getQuantity();
            }
        }
        session.setAttribute("cartCount", totalQuantity);
		
		response.sendRedirect("cart.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
