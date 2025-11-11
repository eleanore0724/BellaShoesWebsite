<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tw.com.lccnet.model.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
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
                                    </span>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="ratio ratio-1x1 d-flex align-items-center justify-content-center bg-light">
                                    <span class="text-secondary">
                                    	<img src="<%= product.getImage_url_2() %>" alt="圖二" class="img-fluid">
                                    </span>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="ratio ratio-1x1 d-flex align-items-center justify-content-center bg-light">
                                    <span class="text-secondary">
                                    	<img src="<%= product.getImage_url_3() %>" alt="圖三" class="img-fluid">
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

                    <!-- 顏色選擇（色票） -->
                    <div class="mb-3">
                        <label class="form-label">顏色</label>
                        <div class="d-flex gap-2" id="p-colors">
                            <!-- 以 radio 當作顏色選擇 -->
                            <input type="radio" class="btn-check" name="color" id="c-black" value="black" autocomplete="off" checked>
                            <label class="btn swatch swatch-black" for="c-black" title="黑色"></label>
                            <input type="radio" class="btn-check" name="color" id="c-white" value="white" autocomplete="off">
                            <label class="btn swatch swatch-white" for="c-white" title="白色"></label>
                            <input type="radio" class="btn-check" name="color" id="c-grey" value="grey" autocomplete="off">
                            <label class="btn swatch swatch-grey" for="c-grey" title="灰色"></label>
                        </div>
                    </div>

                    <!-- 尺寸選擇 -->
                    <div class="mb-3">
                        <label class="form-label">尺寸</label>
                        <select id="p-size" class="form-select w-auto">
                            <option value="">選擇尺寸</option>
                            <option>38</option>
                            <option>39</option>
                            <option>40</option>
                            <option>41</option>
                            <option>42</option>
                        </select>
                    </div>

                    <!-- 數量選擇 -->
                    <div class="mb-3">
                        <label class="form-label">數量</label>
                        <input id="p-qty" type="number" class="form-control w-auto" min="1" value="1">
                    </div>

                    <!-- 操作按鈕 -->
                    <div class="d-flex gap-2">
                    <form action="addToCart" method="post">
                    	<input type="hidden" name="product_id" value="${product.product_id}">
                    	<input type="hidden" name="product_name" value="${product.product_name}">
						<input type="hidden" name="price" value="${product.price}">
						<input type="hidden" name="image_url" value="${product.image_url}">
                        <button id="btn-add" class="btn btn-dark btn-add-cart">加入購物車</button>
                    </form>
                        <a href="cartServlet" class="btn btn-outline-dark">前往購物車</a>
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
			<%@include file="include/related-products.jsp"%>
        </div>
    </main>
	<%@include file="include/footer.jsp"%>
</body>
</html>