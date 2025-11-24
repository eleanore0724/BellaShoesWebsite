package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tw.com.lccnet.model.CartItem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String product_name = request.getParameter("product_name");
		int price = Integer.parseInt(request.getParameter("price"));
		String image_url = request.getParameter("image_url");
		String size=request.getParameter("size");
		String color = request.getParameter("color");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		
		System.out.println("size: "+size +"   "+"color: " +color+"   "+"quantity: "+quantity+ "  product_name :"+product_name);
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		}
		
		boolean found = false;
		
		
		for (CartItem item : cart) {
			if (item.getProduct_id() == product_id && item.getSize().equals(size) &&item.getColor().equals(color)) {
				item.setQuantity(item.getQuantity() + quantity);
				found = true;
				break;
			}
		}
		if (!found) {
            cart.add(new CartItem(product_id, product_name, price,image_url , quantity, size ,color));
        }
		System.out.println(cart);
		// 計算總數量
		int totalQuantity = 0;
		for (CartItem item : cart) {
		    totalQuantity += item.getQuantity();
		}
		
		session.setAttribute("cartCount", totalQuantity);
		//session.setAttribute("totalPrice", totalPrice);
		response.sendRedirect("cart.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
