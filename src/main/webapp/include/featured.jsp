<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Featured -->
<section class="py-5">
	<div class="container">
		<div class="d-flex justify-content-between align-items-end mb-4">
			<h2 class="h3 m-0">精選商品</h2>
			<a href="productServlet" class="link-dark">查看全部</a>
		</div>
		
		<div class="row g-4">
			<c:forEach var="item" items="${featuredList}">
			<div class="col-6 col-md-4 col-lg-3">
				<div class="card h-100 border-0 shadow-sm">
					<div
						class="ratio ratio-1x1 bg-light d-flex align-items-center justify-content-center">
						<img src="${item.image_url}" class="card-img-top img-fluid" style="object-fit: cover;" alt="${item.product_name}">
					</div>
					<div class="card-body">
						<h3 class="h6">${item.product_name}</h3>
						<p class="text-secondary small mb-2">$ ${item.price}</p>
						<a href="productServlet" class="btn btn-outline-dark w-100">查看</a>
					</div>
				</div>
			</div>
			</c:forEach>

		
	</div>
</section>