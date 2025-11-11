<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella-Shoes - 結帳</title>
<link href="css/styles.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body>
<%@include file="include/navbar.jsp"%>
	<main class="py-5" style="margin-top: 50px;">
		<div class="container">
			<div class="row g-4">
				<!-- 左邊：表單 -->
				<div class="col-lg-8">
					<form class="p-3 bg-white border rounded-2" action="checkout"
						method="post">
						<h1 class="h5">收件資訊</h1>
						<form action="checkout" method="post">
						<div class="row g-3 mt-1">
							<div class="col-md-6">
								<label for="name" class="form-label">姓名</label> 
								<input type="text" name="shipping_name" class="form-control" placeholder="王小明" required>
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">電話</label> 
								<input type="text" name="shipping_phone" class="form-control" placeholder="0912-345-678" required>
							</div>
							<div class="col-12">
								<label for="address" class="form-label">地址</label> 
								<input type="text" name="shipping_address" class="form-control" placeholder="台北市中正區…" required>
							</div>
							<div class="col-md-6">
								<label for="shipping" class="form-label">配送方式</label> 
								<select id="shipping" name="shipping" class="form-select" required>
									<option name="delivery_method" value="home">宅配</option>
									<option name="delivery_method" value="store">超商取貨</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="payment" class="form-label">付款方式</label> 
								<select name="payment" class="form-select" required>
									<option name="payment_method" value="credit">信用卡</option>
									<option name="payment_method" value="transfer">轉帳</option>
									<option name="payment_method" value="cash">現金</option>
								</select>
							</div>
							<div class="col-12">
								<button type="submit" id="btn-pay" class="btn btn-dark w-100">送出訂單</button>
							</div>
							</form>
						</div>
					</form>
				</div>

				<!-- 右邊：訂單摘要 -->
				<div class="col-lg-4">
					<div class="p-3 bg-white border rounded-2">
						<h2 class="h6">訂單摘要</h2>
						<ul id="summary" class="list-unstyled small mb-2"></ul>
						<div class="d-flex justify-content-between border-top pt-2">
							<span>合計</span> <strong id="total">$0</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
	<%@include file="include/footer.jsp"%>

</body>
</html>