<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella Shoes-會員註冊</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="/styles.css" rel="css/stylesheet">
</head>
<body class="bg-light text-dark d-flex align-items-center" style="min-height:85vh;">
	<div class="container" style="max-width:480px;">
        <div class="text-center mb-4">
            <a href="/index.html" class="text-decoration-none text-dark">
                <h1 class="h3 fw-bold m-0">Bella Shoes</h1>
            </a>
        </div>
        <div class="card border-0 shadow-sm">
            <div class="card-body p-4">
                <h2 class="h5 mb-3">建立帳號</h2>
                <form action="registerServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">名稱</label>
                        <input type="text" name="username" class="form-control" placeholder="您的名稱" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="you@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">密碼</label>
                        <input type="password" name="password" class="form-control" placeholder="至少6碼" required>
                    </div>
                    <button type="submit" class="btn btn-dark w-100">註冊</button>
                </form>
                <hr>
                <p class="text-secondary small m-0">已經有帳號？<a href="login.jsp" class="link-dark">登入</a></p>
            </div>
        </div>
    </div>


<% String message = (String) request.getAttribute("message");
   if (message != null) { %>
   <script>
       alert("<%= message %>");
   </script>
<% } %>

<script>
function validateForm() {
    let email = document.getElementById("email").value;
    let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;  // 基本 Email 格式驗證

    if (!regex.test(email)) {
        alert("請輸入有效的 Email 格式！");
        return false; // 阻止表單送出
    }
    return true;
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
</body>
</html>