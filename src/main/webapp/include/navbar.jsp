<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tw.com.lccnet.dao.CartDao"%>
<%@page import="tw.com.lccnet.dao.daoLmpl.CartDaoImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="tw.com.lccnet.model.User" %>
<%@ page import="tw.com.lccnet.model.CartItem" %>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("auth", auth);
	}
%>
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
if (cart == null) cart = new ArrayList<>();
%>
<%
    Integer cartCount = (Integer) session.getAttribute("cartCount");
    if (cartCount == null) {
        cartCount = 0; // 一開始是 0
    }
    String userName = (String) session.getAttribute("userName"); // 如果之後要加登入會員
%>
<%
//計算總價
double totalPrice = 0;
for (CartItem item : cart) {
	totalPrice += item.getPrice() * item.getQuantity();
}
request.setAttribute("totalPrice", totalPrice);
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3 fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">Bella Shoe</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse position-absolute top-50 start-50 translate-middle" id="navbarNav">
			<ul class="navbar-nav gap-3">
				<li class="nav-item"><a class="nav-link" href="index.jsp">首頁</a></li>
				<!--  <li class="nav-item"><a class="nav-link" href="latest-product.jsp">新品登場</a></li> 
				<li class="nav-item"><a class="nav-link" href="indexServlet">全部商品</a></li>-->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle active" href="#" id="navProducts" role="button" data-bs-toggle="dropdown" aria-expanded="false">商品分類</a>
					<ul class="dropdown-menu" aria-labelledby="navProducts">
						<li><a class="dropdown-item" href="productServlet">全部</a></li>
						<li><a class="dropdown-item" href="productServlet?category=loafers">樂福鞋</a></li>
						<li><a class="dropdown-item" href="productServlet?category=casual">休閒鞋</a></li>
						<li><a class="dropdown-item" href="productServlet?category=boots">靴子</a></li>
						<li><a class="dropdown-item" href="productServlet?category=heels">跟鞋</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="/products.html">門市查詢</a></li>
			</ul>


		</div>
		<div>

			<ul class="navbar-nav ms-auto">
				<% 
		    	if(auth != null){%>
		    	<span class="nav-link text-white">您好，<%= auth.getName() %>! </span>
				<li class="nav-item me-2"><a class="nav-link" href="logoutServlet">登出</a></li>
				<li class="nav-item me-2"><a class="nav-link" href="myOrders">會員中心</a></li>
				<%}else{%>	
				<li class="nav-item me-2"><a class="nav-link" href="login.jsp">登入</a></li>
				<%}%>
				<li class="nav-item"><a
					class="btn btn-outline-light position-relative" href="cart.jsp">購物車
						<span id="cartCount" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-light text-dark">
						<%= cartCount %>
						</span>
				</a></li>
			</ul>
		</div>
	</div>
    </nav>