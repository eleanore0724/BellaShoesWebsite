<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.com.lccnet.model.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella Shoes-商品</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/styles.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body class="bg-light text-dark">
<%@include file="include/navbar.jsp"%>

	<main class="py-5" style="margin-top: 50px;">
		<div class="container">
			<!-- 麵包屑 -->
			<nav aria-label="breadcrumb" class="mb-3">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="index.jsp"
						class="link-dark">首頁</a></li>
					<li class="breadcrumb-item"><a href="indexServlet"
						class="link-dark">商品</a></li>
					<%
					String category = request.getParameter("category");
					String breadcrumbName = "全部";

					if ("boots".equals(category)) {
						breadcrumbName = "靴子";
					} else if ("casual".equals(category)) {
						breadcrumbName = "休閒鞋";
					} else if ("loafers".equals(category)) {
						breadcrumbName = "樂福鞋";
					} else if ("heels".equals(category)) {
						breadcrumbName = "跟鞋";
					}
					%>
					<li class="breadcrumb-item active" aria-current="page"><%= breadcrumbName %></li>
				</ol>
			</nav>

			<div class="container">
				<div class="row mt-2">
					<c:forEach items="${requestScope.lists}" var="list">
						<div class="col col-md-3 my-2">
							<div class="card h-100">
								<a href="ProductDetailServlet?id=${list.product_id}">
									<div class="bg-image hover-overlay" data-mdb-ripple-init
										data-mdb-ripple-color="light">
										<img src=${list.image_url } class="img-fluid"> <a href="#!">
											<div class="mask"
												style="background-color: rgba(251, 251, 251, 0.15);"></div>
										</a>
									</div>
									<div class="card-body">
										<h5 class="card-title fs-6">${list.product_name}</h5>
										<p class="card-text">TWD $ ${list.price}</p>
									</div>
									<!-- 購物車按鈕 -->
								<form action="addToCart" method="post" class="position-absolute bottom-0 end-0 m-2">
									<input type="hidden" name="product_id" value="${list.product_id}">
									<input type="hidden" name="product_name" value="${list.product_name}">
									<input type="hidden" name="price" value="${list.price}">
									<input type="hidden" name="image_url" value="${list.image_url}">
									<button type="submit" class="btn btn-outline-dark btn-sm rounded-3 px-2 py-1" id="btn-add">
										<i class="bi bi-cart-plus me-1"></i> 加入購物車
									</button>
								</form>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>
	<div class="d-flex justify-content-center">
		<%@include file="include/pagination.jsp"%>
	</div>
	<%@include file="include/footer.jsp"%>

	
</body>
</html>