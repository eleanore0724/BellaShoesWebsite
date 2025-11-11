<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-6 col-md-4">
	<c:forEach items="${requestScope.lists}" var="list">
		<div class="card h-100 border-0 shadow-sm">
			<div
				class="ratio ratio-1x1 bg-light d-flex align-items-center justify-content-center">
				<img src=${list.image_url} class="img-fluid" /> <a href="#!">
				<!-- <span class="text-muted">Monochrome Runner</span>  -->
			</div>
			<div class="card-body d-flex flex-column">
				<h3 class="h6">${list.product_name}</h3>
				<p class="text-secondary small mb-3">${list.price}</p>
				<a href="/product.html?id=p1" class="btn btn-outline-dark mt-auto">查看</a>
			</div>
		</div>
	</c:forEach>
</div>