package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tw.com.lccnet.dao.CartDao;
import tw.com.lccnet.dao.OrderDao;
import tw.com.lccnet.dao.daoLmpl.CartDaoImpl;
import tw.com.lccnet.dao.daoLmpl.OrderDaoImpl;
import tw.com.lccnet.model.CartItem;
import tw.com.lccnet.model.User;

import java.io.IOException;
import java.util.List;


@WebServlet("/saveCart")
public class SaveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		User auth = (User) request.getSession().getAttribute("auth");

		if (auth == null) {
			// 尚未登入 → 回登入頁
			response.sendRedirect("login.jsp");
			return;
		}
		int user_id = auth.getId();

		// 檢查購物車是否有內容
		if (cart == null || cart.isEmpty()) {
			 request.setAttribute("message", "購物車是空的，無法結帳！");
			 System.out.println("客戶ID "+user_id+"的購物車是空的，無法結帳!");
			 request.getRequestDispatcher("cart.jsp").forward(request, response);
			 return;
		}
		
		// 計算總價
		double totalPrice = 0;
		for (CartItem item : cart) {
            totalPrice += item.getPrice() * item.getQuantity();
        }
		
		// 寫入orders資料庫
		CartDao cartDao = new CartDaoImpl();
		boolean isSuccess = cartDao.insertCartItem(user_id, totalPrice, cart);
		
		// 清空購物車 Session
		if (isSuccess) {
			session.removeAttribute("cart");
			session.setAttribute("cartCount", 0);
			response.sendRedirect("checkout.jsp");
			//session.setAttribute("cartCount", 0);
		} else {
			request.setAttribute("message", "結帳失敗，請稍後再試！");
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
