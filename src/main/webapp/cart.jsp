<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella Shoes-購物車</title>
<link href="css/styles.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body>
<%@include file="include/navbar.jsp"%>
	<main class="py-5" style="margin-top: 50px;">
		<div class="container">
			<!-- 麵包屑導航 -->
			<nav aria-label="breadcrumb" class="mb-4">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="index.jsp"
						class="link-dark">首頁</a></li>
					<li class="breadcrumb-item active" aria-current="page">購物車</li>
				</ol>
			</nav>

			<h1 class="h4 mb-4">購物車</h1>

			<div class="row g-4">
				<!-- 左側：購物車商品列表 -->
				<div class="col-lg-8">
					<div class="bg-white border rounded-2 p-3">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h2 class="h6 m-0">購物車商品</h2>
							<span id="item-count" class="text-secondary small"><%=cartCount %> 項商品</span>
						</div>
						<ul id="cart-list" class="list-group list-group-flush">							

							<%if (cart == null || cart.isEmpty()) {%>
							<p>目前購物車是空的！</p>
							<%} else {%>
							<!-- 購物車商品- (不帶參數) -->
							<% for (CartItem item : cart) { %>
							<ul class="list-group">
								<li class="list-group-item d-flex align-items-center">
									<!-- 商品圖片 -->
									<div class="flex-shrink-0 me-3">
										<div class="ratio ratio-1x1" style="width: 60px;">
											<div class="bg-light d-flex align-items-center justify-content-center rounded">
												<span class="text-muted" style="font-size: 10px;"> 
													<img src="<%= item.getImage_url() %>" alt="商品" class="img-fluid" style="max-width: 100%; max-height: 100%;">
												</span>
											</div>
										</div>
									</div> <!-- 商品資訊 -->
									<div class="flex-grow-1">
										<div class="fw-semibold"><%= item.getProduct_name() %></div>
										<div class="small text-secondary">尺寸：<%= item.getSize()%> | 顏色：<%= item.getColor()%> | 單價：<%= item.getPrice() %></div>
									</div> <!-- 數量控制 -->
									<div class="flex-shrink-0 d-flex align-items-center gap-2">
										<div class="input-group" style="width: 100px;">
											<form action="updateCart" method="post" style="display:flex; align-items:center; gap:5px;">
												<input type="hidden" name="product_id" value="<%= item.getProduct_id() %>">
												<input type="hidden" name="color" value="<%= item.getColor()%>">
												<input type="hidden" name="size" value="<%= item.getSize() %>">
												
												
												
												<button class="btn btn-outline-secondary btn-sm" name="action" value="decrease">-</button>
												<input class="form-control form-control-sm text-center" value="<%= item.getQuantity()%>" min="1">
												<button class="btn btn-outline-secondary btn-sm" name="action" value="increase">+</button>
											</form>
										</div>
										<div class="text-end" style="width: 80px;">
											<div class="fw-semibold">$<%= item.getPrice() * item.getQuantity() %></div>
										</div>
										<form action="deleteCart" method="post" style="display:flex;">
											<input type="hidden" name="product_id" value="<%= item.getProduct_id() %>">

											<input type="hidden" name="color" value="<%= item.getColor() %>">
											<input type="hidden" name="size" value="<%= item.getSize() %>">
											<button class="btn btn-outline-danger btn-sm" title="移除商品">
												<span>×</span>
											</button>
										</form>
									</div>
								</li>
							</ul>
							<% } %>
							<% } %>

						</ul>
					</div>

					<!-- 優惠券輸入區 -->
					<div class="bg-white border rounded-2 p-3 mt-3">
						<h3 class="h6 mb-3">優惠券</h3>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="輸入優惠券代碼"
								id="coupon-code">
							<button class="btn btn-outline-dark" type="button"
								id="apply-coupon">套用</button>
						</div>
						<div id="coupon-message" class="mt-2 small"></div>
					</div>

					<!-- 配送資訊 -->
					<div class="bg-white border rounded-2 p-3 mt-3">
						<h3 class="h6 mb-3">配送資訊</h3>
						<div class="row g-2">
							<div class="col-md-6">
								<div class="d-flex align-items-center">
									<i class="bi bi-truck me-2"></i> <span class="small">宅配：2-3
										個工作天</span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="d-flex align-items-center">
									<i class="bi bi-shop me-2"></i> <span class="small">超商取貨：1-2
										個工作天</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 右側：訂單摘要 -->
				<div class="col-lg-4">
					<div class="bg-white border rounded-2 p-3 sticky-top"
						style="top: 100px;">
						<h3 class="h6 mb-3">訂單摘要</h3>

						<!-- 價格明細 -->
						<div class="mb-3">
							<div class="d-flex justify-content-between mb-1">
								<span class="small">商品小計</span> <span class="small"
									id="totalPric">$ <%=totalPrice %></span>
							</div>
							<div class="d-flex justify-content-between mb-1">
								<span class="small">運費</span> <span class="small" id="shipping">$ 100</span>
							</div>
							<div class="d-flex justify-content-between mb-1"
								id="discount-row" style="display: none;">
								<span class="small text-success">優惠折扣</span> <span
									class="small text-success" id="discount">-$0</span>
							</div>
							<hr class="my-2">
							<div class="d-flex justify-content-between">
								<strong>總計</strong> <strong id="total">$ <%=totalPrice +100 %></strong>
							</div>
						</div>

						<!-- 操作按鈕 -->
						<div class="d-grid gap-2">
							<form action="saveCart" method="post" class="d-grid">
								<button class="btn btn-dark" id="checkout-btn" type="submit">前往結帳</button>
							</form>
							<form action="clearCartServlet" method="post" class="d-grid">
								<button id="btn-clear" class="btn btn-outline-dark" type="submit">清空購物車</button>
							</form>
							<a href="productServlet" class="btn btn-outline-secondary">繼續購物</a>
						</div>

						<div class="mt-3 p-2 bg-light rounded small text-secondary">
							<i class="bi bi-shield-check me-1"></i> 安全加密結帳，保障您的購物安全
						</div>
					</div>
				</div>
			</div>
		<%@include file="include/related-products.jsp"%>
		</div>
	</main>
</body>
</html>