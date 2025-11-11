package tw.com.lccnet.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.com.lccnet.dao.ProductDao;
import tw.com.lccnet.dao.daoLmpl.ProductDaoImpl;
import tw.com.lccnet.model.Product;

import java.io.IOException;


@WebServlet("/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao = new ProductDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		// 取得商品 id
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);

        // 撈資料
        Product product = productDao.getProductById(id);

        // 放入 request
        request.setAttribute("product", product);

        // 導向到 product.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
        dispatcher.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}