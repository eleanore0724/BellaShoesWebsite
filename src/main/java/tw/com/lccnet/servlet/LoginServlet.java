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
import java.io.PrintWriter;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
			UserDao dao=new UserDaoImpl();
			String email=request.getParameter("login-email");
			String password=request.getParameter("login-password");
			User user =dao.userLogin(email,password);
			if(user != null) {
				//out.print("user login");
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			}else{
				//response.getWriter().println("<script>alert('登入失敗，請重新輸入！');</script>");
				//out.print("user login failed!");
				//response.sendRedirect("login.jsp");
				
				response.getWriter().println("<script>");
	            response.getWriter().println("alert('登入失敗，請重新輸入！');");
	            response.getWriter().println("window.location.href='login.jsp';");
	            //response.sendRedirect("login.jsp");
	            response.getWriter().println("</script>");
			}
		}catch(Exception e) {
            e.printStackTrace();
        }
	}
}