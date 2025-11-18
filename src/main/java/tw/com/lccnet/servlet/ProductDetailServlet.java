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
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;


@WebServlet("/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao = new ProductDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 取得商品 id
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        int groupBy_id = Integer.parseInt(request.getParameter("groupBy_id"));
        // 撈資料
        Product product = productDao.getProductById(id);
        System.out.println("id為"+id+"  "+"/ groupBy_id為"+groupBy_id);
        List<Product> variants =productDao.getProductsByGroup(groupBy_id);
        request.setAttribute("variants", variants);
        
        // 重複的尺寸 / 顏色
        Set<String> sizes = new LinkedHashSet<>();
        Set<String> colors = new LinkedHashSet<>();
        for (Product p : variants) {
            sizes.add(p.getSize());
            colors.add(p.getColor());
        }
        request.setAttribute("sizes", sizes);
        request.setAttribute("colors", colors);
        
        
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