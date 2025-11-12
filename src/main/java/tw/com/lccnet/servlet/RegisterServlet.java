package tw.com.lccnet.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.com.lccnet.dao.UserDao;
import tw.com.lccnet.dao.daoLmpl.UserDaoImpl;
import tw.com.lccnet.model.User;

import java.io.IOException;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDaoImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		if(userDao.isUserExist(email)) {
			request.setAttribute("message", "帳號或 Email 已被使用！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}else {
			User user =new User(name, email, password);
			boolean success = userDao.insertUser(user);
			if(success) {
				request.setAttribute("message", "註冊成功，請登入！");
				response.sendRedirect("login.jsp");
			}else {
				request.setAttribute("message", "註冊失敗，請稍後再試");
				 request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}
	}

}
