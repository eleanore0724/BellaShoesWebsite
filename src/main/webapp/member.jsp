<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="row g-4">
			<!-- 左側：會員資訊側邊欄 -->
			<aside class="col-lg-3">
				<div class="bg-white border rounded-2 p-3 mb-3">
					<div class="text-center mb-3">
						<div class="ratio ratio-1x1 mx-auto mb-2" style="max-width: 80px;">
							<div
								class="bg-dark rounded-circle d-flex align-items-center justify-content-center">
								<span class="text-white">會員</span>
							</div>
						</div>
						<h3 class="h6 m-0"><%= auth.getName() %></h3>
						<p class="text-secondary small mb-0"><%= auth.getEmail() %></p>
					</div>
					<hr>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="" >我的訂單</a></li>
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
								<!-- 訂單項目由 JS 動態生成 -->
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
	</main>
	<%@include file="include/footer.jsp"%>

</body>
</html>