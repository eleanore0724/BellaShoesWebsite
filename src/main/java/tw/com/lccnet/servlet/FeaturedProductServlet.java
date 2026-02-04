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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/featuredProductServlet")
public class FeaturedProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao = new ProductDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> featuredList = productDao.getFeaturedProducts();
		getServletContext().setAttribute("featuredList", featuredList);
		System.out.println(featuredList);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
