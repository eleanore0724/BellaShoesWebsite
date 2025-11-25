<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella Shoes-門市</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/styles.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>
<body class="bg-light text-dark">
<%@include file="include/navbar.jsp"%>
	<main class="py-5" style="margin-top: 80px;">
        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="index.jsp" class="link-dark">首頁</a></li>
                    <li class="breadcrumb-item active" aria-current="page">門市資訊</li>
                </ol>
            </nav>

            <!-- Hero -->
            <section class="bg-white border rounded-2 p-4 mb-4">
                <div class="row align-items-center g-4">
                    <div class="col-lg-6">
                        <h1 class="h3 mb-3">門市據點</h1>
                        <p class="text-secondary mb-3">歡迎親臨 BellaShoes 門市試穿，專業門市人員提供鞋款建議、客製化配件與即時售後服務。</p>
                        <ul class="list-unstyled text-secondary small mb-0">
                            <li>．提供現場訂購、線上取貨、退換貨服務</li>
                            <li>．支援線上預約試穿，現場快速結帳</li>
                            <li>．門市營業時間：11:00 - 21:30（週一至週日）</li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <div class="ratio ratio-4x3 border rounded overflow-hidden">
                            <iframe title="BB Shoes 門市地圖" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.063265425712!2d121.56102027546168!3d25.033964338160464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abbd8a18f40d%3A0x287d0d0b3034eb61!2zVGFpcGVpIDEwMSDlrabljJfluILkuK3ljbDot6_luILoiIflpKfljJflm73lkI3li5XmnKznq5k!5e0!3m2!1szh-TW!2stw!4v1732540000000!5m2!1szh-TW!2stw" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Store list -->
            <section class="mb-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h2 class="h5 m-0">實體門市列表</h2>
                    <div class="text-secondary small">共 3 間門市</div>
                </div>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-body">
                                <h3 class="h6">台北旗艦店</h3>
                                <p class="text-secondary small mb-3">台北市信義區市府路 45 號 1F</p>
                                <ul class="list-unstyled small text-secondary mb-3">
                                    <li>電話：02-1234-5678</li>
                                    <li>營業時間：11:00 - 21:30</li>
                                    <li>服務：現場試穿、預約諮詢、退換貨</li>
                                </ul>
                                <a href="https://maps.google.com/?q=台北市信義區市府路45號" target="_blank" class="btn btn-outline-dark btn-sm w-100">Google Map 導航</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-body">
                                <h3 class="h6">台中勤美店</h3>
                                <p class="text-secondary small mb-3">台中市西區公益路 68 號 1F</p>
                                <ul class="list-unstyled small text-secondary mb-3">
                                    <li>電話：04-8765-4321</li>
                                    <li>營業時間：11:00 - 21:00</li>
                                    <li>服務：現場試穿、預約諮詢、退換貨</li>
                                </ul>
                                <a href="https://maps.google.com/?q=台中市西區公益路68號" target="_blank" class="btn btn-outline-dark btn-sm w-100">Google Map 導航</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-body">
                                <h3 class="h6">高雄巨蛋店</h3>
                                <p class="text-secondary small mb-3">高雄市左營區博愛二路 757 號</p>
                                <ul class="list-unstyled small text-secondary mb-3">
                                    <li>電話：07-2233-1122</li>
                                    <li>營業時間：11:00 - 22:00</li>
                                    <li>服務：現場試穿、預約諮詢、退換貨</li>
                                </ul>
                                <a href="https://maps.google.com/?q=高雄市左營區博愛二路757號" target="_blank" class="btn btn-outline-dark btn-sm w-100">Google Map 導航</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Contact form -->
            <section class="bg-white border rounded-2 p-4">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <h2 class="h5 mb-3">預約門市試穿</h2>
                        <p class="text-secondary small mb-4">留下您的需求，門市將於 24 小時內與您聯繫，安排專屬試穿時段。</p>
                        <form class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">姓名</label>
                                <input type="text" class="form-control" placeholder="您的姓名">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">聯絡電話</label>
                                <input type="tel" class="form-control" placeholder="09xx-xxx-xxx">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">選擇門市</label>
                                <select class="form-select">
                                    <option value="taipei">台北旗艦店</option>
                                    <option value="taichung">台中勤美店</option>
                                    <option value="kaohsiung">高雄巨蛋店</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">希望日期</label>
                                <input type="date" class="form-control">
                            </div>
                            <div class="col-12">
                                <label class="form-label">備註</label>
                                <textarea class="form-control" rows="3" placeholder="想試穿的鞋款/尺寸、其他需求"></textarea>
                            </div>
                            <div class="col-12">
                                <button type="button" class="btn btn-dark w-100">送出預約</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-6">
                        <div class="bg-light border rounded-2 p-4 h-100">
                            <h3 class="h6 mb-3">聯絡客服</h3>
                            <p class="text-secondary small mb-1">客服專線：0800-123-456</p>
                            <p class="text-secondary small mb-1">客服信箱：support@bbshoes.com</p>
                            <p class="text-secondary small mb-0">服務時間：週一至週五 10:00 - 19:00</p>
                            <hr>
                            <h4 class="h6 mb-2">交通建議</h4>
                            <ul class="text-secondary small mb-0">
                                <li>台北旗艦店：捷運市政府站 3 號出口，步行 5 分鐘</li>
                                <li>台中勤美店：草悟道旁，鄰近多條公車路線</li>
                                <li>高雄巨蛋店：捷運巨蛋站 5 號出口，步行 3 分鐘</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>


<%@include file="include/footer.jsp"%>
</body>
</html>