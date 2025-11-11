<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.com.lccnet.model.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella-Shoes - 首頁</title>
<link rel="stylesheet" href="styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body class="bg-light text-dark">
	<%@include file="include/navbar.jsp"%>
<!-- 輪播 Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-top: 50px;">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active"
				style="height: 800px; object-fit: cover;">
				<img src="https://shoplineimg.com/6667f31eb876420075a23f61/682581098df9d900106664e8/2160x.webp?source_format=jpg" class="w-100" alt="...">
			</div>
			<div class="carousel-item" style="height: 800px; object-fit: cover;">
				<img src="https://shoplineimg.com/6667f31eb876420075a23f61/68257fc6a68ea1000e915cf2/2160x.webp?source_format=jpg" class="w-100" alt="...">
			</div>
			<div class="carousel-item" style="height: 800px; object-fit: cover;">
				<img src="https://shoplineimg.com/6667f31eb876420075a23f61/682580db07a4720010166972/2160x.webp?source_format=jpg" class="w-100" alt="...">
			</div>
			<div class="carousel-item" style="height: 800px; object-fit: cover;">
				<img src="https://shoplineimg.com/6667f31eb876420075a23f61/67f72e45786abc000b1ab387/2160x.webp?source_format=jpg" class="w-100" alt="...">
			</div>
			<div class="carousel-item" style="height: 800px; object-fit: cover;">
				<img src="https://shoplineimg.com/6667f31eb876420075a23f61/67345826f3fd6f000fc4ece7/2160x.webp?source_format=jpg" class="w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>


	<c:forEach items="${requestScope.lists}" var="list">
		<div class="col col-md-3 my-2">
			<div class="card h-100">
				<div class="bg-image hover-overlay" data-mdb-ripple-init
					data-mdb-ripple-color="light">
					<img src=${list.image_url } class="img-fluid" /> <a href="#!">
						<div class="mask"
							style="background-color: rgba(251, 251, 251, 0.15);"></div>
					</a>
				</div>
				<div class="card-body">
					<h5 class="card-title">${list.product_name}</h5>
					<p class="card-text">${list.description}</p>
					<p class="card-text">${list.price}</p>
				</div>
			</div>
		</div>
	</c:forEach>


	<%@include file="include/featured.jsp"%>
	<%@include file="include/footer.jsp"%>
</body>
</html>