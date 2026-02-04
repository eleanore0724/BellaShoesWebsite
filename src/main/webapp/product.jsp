<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tw.com.lccnet.model.Product" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<%
    List<Product> variants = (List<Product>) request.getAttribute("variants");
    Set<String> sizes = (Set<String>) request.getAttribute("sizes");
    Set<String> colors = (Set<String>) request.getAttribute("colors");
%>


 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella Shoes-商品詳情</title>
<link href="/styles.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body class="bg-light text-dark">
<%@include file="include/navbar.jsp"%>
<main class="py-5" style="margin-top: 50px;">
        <div class="container">
            <!-- 麵包屑：顯示目前位置 -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="index.jsp" class="link-dark">首頁</a></li>
                    <li class="breadcrumb-item"><a href="products.jsp" class="link-dark">商品</a></li>
                </ol>
            </nav>
			
			<div class="row g-4">
                <!-- 左側：商品圖片輪播 -->
                <div class="col-lg-6">
                    <div id="carouselProduct" class="carousel slide bg-white border" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="ratio ratio-1x1 d-flex align-items-center justify-content-center">
                                    <span class="text-secondary">
                                     	<img src="<%= product.getImage_url() %>" alt="主圖" class="img-fluid">
<%--                                      	<img src="<%= product.getImage_url() %>" alt="主圖" class="img-fluid"> --%>
                                    </span>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="ratio ratio-1x1 d-flex align-items-center justify-content-center bg-light">
                                    <span class="text-secondary">
                                    	<img src="<%= product.getImage_url_2() %>" alt="圖二" class="img-fluid">
<%--                                     	<img src="<%= product.getImage_url_2() %>" alt="圖二" class="img-fluid"> --%>
                                    </span>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="ratio ratio-1x1 d-flex align-items-center justify-content-center bg-light">
                                    <span class="text-secondary">
                                    	<img src="<%= product.getImage_url_3() %>" alt="圖三" class="img-fluid">
<%--                                     	<img src="<%= product.getImage_url_3() %>" alt="圖三" class="img-fluid"> --%>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselProduct" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselProduct" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>

                <!-- 右側：標題、價格、選項與按鈕 -->
                <div class="col-lg-6">
                    <h1 id="p-name" class="h3"><%= product.getProduct_name()%></h1>
                    <p id="p-price" class="lead">$<%= product.getPrice() %></p>
				<form action="addToCart" method="post">
                    <!-- 顏色選擇（色票） -->
                    <div class="mb-3">
                        <label class="form-label">顏色</label>
                        <div class="d-flex gap-2" id="p-colors">

							<select id="colorSelect" name="color" class="form-select w-auto">
								<option>請選擇</option>
								<% for (String c : colors) { %>
								<option value="<%=c%>"><%=c%></option>
								<% } %>
							</select>
                        </div>
                    </div>

                    <!-- 尺寸選擇 -->
                    <div class="mb-3">
                        <label class="form-label">尺寸</label> 
                        	<select id="sizeSelect" name="size" class="form-select w-auto">
							<option>選擇尺寸</option>
							<%for (String s : sizes) {%>
							<option value="<%=s%>"><%=s%></option>
							<%}%>
							</select>
					</div>

                    <!-- 數量選擇 -->                     
					<div class="mb-3">
						<label class="form-label">數量</label>
						<div class="d-flex align-items-center gap-2 mt-1">
							<button type="button" class="btn btn-outline-secondary btn-sm" id="btn-decrease">-</button>
							<input id="quantityInput" name="quantityInput" type="text" class="form-control w-auto text-center" value="1" min="1" style="width: 60px;" readonly>
							<button type="button" class="btn btn-outline-secondary btn-sm" id="btn-increase">+</button>
						</div>
					</div>
					<!-- 操作按鈕 -->
                    <div class="d-flex gap-2">
                    
                    	<input type="hidden" name="product_id" value="${product.product_id}">
                    	<input type="hidden" name="product_name" value="${product.product_name}">
						<input type="hidden" name="price" value="${product.price}">
						<input type="hidden" name="image_url" value="${product.image_url}">
						<input type="hidden" name="quantity" id="hiddenQuantity" value="1">
                        <button id="btn-add" class="btn btn-dark btn-add-cart">加入購物車</button>
                    </form>
                        <!--  <a href="cartServlet" class="btn btn-outline-dark">前往購物車</a> -->
                    </div>

                    <hr>

                    <!-- Tabs：商品說明 / 規格 / 配送 -->
                    <ul class="nav nav-tabs" id="pTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="tab-desc" data-bs-toggle="tab" data-bs-target="#pane-desc" type="button" role="tab">商品說明</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="tab-spec" data-bs-toggle="tab" data-bs-target="#pane-spec" type="button" role="tab">商品規格</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="tab-ship" data-bs-toggle="tab" data-bs-target="#pane-ship" type="button" role="tab">配送與退貨</button>
                        </li>
                    </ul>
                    <div class="tab-content border border-top-0 p-3 bg-white">
                        <div class="tab-pane fade show active" id="pane-desc" role="tabpanel">
                            黑白簡約設計，全天候舒適腳感，適合日常與運動穿搭。
                        </div>
                        <div class="tab-pane fade" id="pane-spec" role="tabpanel">
                            重量約 280g（單腳 42 號），鞋面合成纖維，橡膠鞋底。
                        </div>
                        <div class="tab-pane fade" id="pane-ship" role="tabpanel">
                            2-3 個工作天出貨，7 天鑑賞期（不影響二次銷售）。
                        </div>
                    </div>
                </div>
            </div>
			<%@include file="include/featured.jsp"%> 
        </div>
    </main>

	<%@include file="include/footer.jsp"%>

	<script>
    const qtyInput = document.getElementById("quantityInput");
    const hiddenQty = document.getElementById("hiddenQuantity");
    const btnIncrease = document.getElementById("btn-increase");
    const btnDecrease = document.getElementById("btn-decrease");

    // 增加數量 +1
    btnIncrease.addEventListener("click", () => {
        qtyInput.value = parseInt(qtyInput.value) + 1;
        hiddenQty.value = qtyInput.value;
    });

    // 減少數量 -1（不能 < 1）
    btnDecrease.addEventListener("click", () => {
        qtyInput.value = Math.max(1, parseInt(qtyInput.value) - 1);
        hiddenQty.value = qtyInput.value;
    });
</script>
</body>
</html>