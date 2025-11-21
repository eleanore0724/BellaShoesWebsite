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

@WebServlet("/deleteCart")
public class DeleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int product_id = Integer.parseInt(request.getParameter("product_id"));
		 String color =request.getParameter("color");
		 String size = request.getParameter("size");
		 
	     
		 HttpSession session = request.getSession();
		 List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		 
		 

		 if (cart != null ) {
	            cart.removeIf(item -> item.getProduct_id() == product_id &&
	                    item.getSize() != null && item.getSize().equals(size) &&
	                    item.getColor() != null && item.getColor().equals(color));
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
		doGet(request, response);
	}

}
