<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella-Shoes - 會員中心</title>
<link rel="stylesheet" href="styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body class="bg-light text-dark">
	<%@include file="include/navbar.jsp"%>
	<main class="py-5" style="margin-top: 80px;">
		<div class="container">
			<!-- 麵包屑導航 -->
			<nav aria-label="breadcrumb" class="mb-4">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="index.jsp"
						class="link-dark">首頁</a></li>
					<li class="breadcrumb-item active" aria-current="page">會員中心</li>
				</ol>
			</nav>
			<div class="row g-4">
				<!-- 左側：會員資訊側邊欄 -->
				<aside class="col-lg-3">
					<div class="bg-white border rounded-2 p-3 mb-3">
						<div class="text-center mb-3">
							<div class="ratio ratio-1x1 mx-auto mb-2"
								style="max-width: 80px;">
								<div
									class="bg-dark rounded-circle d-flex align-items-center justify-content-center">
									<span class="text-white">會員</span>
								</div>
							</div>
							<h3 class="h6 m-0"><%=auth.getName()%></h3>
							<p class="text-secondary small mb-0"><%=auth.getEmail()%></p>
						</div>
						<hr>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link active" href="">我的訂單</a></li>
							<li class="nav-item"><a class="nav-link" href="">歷史紀錄</a></li>
						</ul>
					</div>
				</aside>

				<!-- 右側：主要內容區 -->
				<div class="col-lg-9">
					<div class="tab-content">
						<!-- 我的訂單 -->
						<div class="tab-pane fade show active" id="orders" role="tabpanel">
							<div class="bg-white border rounded-2 p-4">
								<h2 class="h5 mb-4">我的訂單</h2>

								<!-- 訂單篩選 -->
								<div class="mb-3">
									<select class="form-select w-auto d-inline-block"
										id="order-filter">
										<option value="all">全部訂單</option>
										<option value="pending">待處理</option>
										<option value="processing">處理中</option>
										<option value="shipped">已出貨</option>
										<option value="completed">已完成</option>
										<option value="cancelled">已取消</option>
									</select>
								</div>

								<!-- 訂單列表 -->
								<div id="orders-list">
									<c:forEach var="o" items="${orders}">
										<div class="border rounded-2 p-3 mb-3">
											<div class="d-flex justify-content-between align-items-start mb-3">
												<div>
													<div class="fw-semibold fw-bold fs-6">訂單編號：${o.order_id}</div>
													<div class="small text-secondary">訂購日期：${o.created_at}</div>
												</div>
												<div>
													<span class="badge bg-warning text-dark">${o.orders_status}</span>
												</div>
											</div>

											<div class="mb-3">
												<c:forEach var="item" items="${o.items}">
													<div
														class="d-flex justify-content-between align-items-center py-2 border-bottom">
														<div>
															<div class="small">${item.product_name}</div>
															<div class="text-secondary" style="font-size: 12px;">${item.size}
																- ${item.color} × ${item.quantity}</div>
														</div>
														<div class="text-end">
															<div class="small">$ ${item.price}</div>
														</div>
													</div>
												</c:forEach>
											</div>

											<div class="d-flex justify-content-between align-items-center mb-2">
												<span class="small text-secondary">配送方式：宅配</span>
												<div class="text-end">
													<span class="small text-secondary me-2">總計：</span>
													<strong>$ ${o.total_price}</strong>
												</div>
											</div>

											<div class="d-flex gap-2 mt-3">
												<button class="btn btn-outline-dark btn-sm">查看詳情</button>
											</div>
										</div>
										</c:forEach>
								</div>
							</div>
							
						</div>
						
						<!-- 歷史紀錄 -->
						<div class="tab-pane fade" id="history" role="tabpanel">
							<div class="bg-white border rounded-2 p-4">
								<h2 class="h5 mb-4">歷史紀錄</h2>

								<!-- 歷史紀錄列表 -->
								<div id="history-list">
									<!-- 歷史紀錄項目由 JS 動態生成 -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="include/footer.jsp"%>
	<script>
		//狀態標籤樣式
		function getStatusBadge(status) {
			const badges = {
				pending : '<span class="badge bg-warning text-dark">待處理</span>',
				processing : '<span class="badge bg-info text-dark">處理中</span>',
				shipped : '<span class="badge bg-primary">已出貨</span>',
				completed : '<span class="badge bg-success">已完成</span>',
				cancelled : '<span class="badge bg-secondary">已取消</span>'
			};
			return badges[status] || badges.pending;
		}
	</script>
</body>
</html>