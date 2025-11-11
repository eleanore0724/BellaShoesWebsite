package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.com.lccnet.dao.ProductDao;
import tw.com.lccnet.dao.daoLmpl.ProductDaoImpl;
import tw.com.lccnet.model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/productServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDaoImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		List<Product> lists;
		
		if(category==null || category.isEmpty()) {
			lists = dao.query();
		}else {
			lists = dao.queryByCategory(category);
		}
		
		request.setAttribute("lists", lists);
		request.getRequestDispatcher("products.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}