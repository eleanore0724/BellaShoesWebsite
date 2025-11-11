<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella-Shoes - 新品登出</title>
<link rel="stylesheet" href="styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body class="bg-light text-dark">
<%@include file="include/navbar.jsp"%>

	<!-- master -->
	<section class="py-5 bg-white border-bottom" style="margin-top: 50px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<h1 class="display-5 fw-bold">輕量樂福鞋，走出你的風格</h1>
					<p class="lead text-secondary">極簡設計、舒適腳感、經典與新作。</p>
					<a href="products.jsp" class="btn btn-dark btn-lg">立即選購</a>
				</div>
				<div class="col-lg-6 text-center mt-4 mt-lg-0">
					<div
						class="ratio ratio-16x9 bg-light d-flex align-items-center justify-content-center border">
						<span class="text-muted">Hero Image</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<%@include file="include/featured.jsp"%>
	<%@include file="include/footer.jsp"%>

</body>
</html>