<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bella Shoes-登入</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body  class="bg-light text-dark d-flex align-items-center" style="min-height:85vh;">
	<div class="container" style="max-width: 480px;">
		<div class="text-center mb-4">
			<a href="index.jsp" class="text-decoration-none text-dark">
				<h1 class="h3 fw-bold m-0">Bella Shoes</h1>
			</a>
		</div>
		<div class="card border-0 shadow-sm">
			<div class="card-body p-4">
				<h2 class="h5 mb-3">登入</h2>
				<form action="loginServlet" method="post">
					<div class="mb-3">
						<label class="form-label">Email</label> <input type="email"
							class="form-control" name="login-email" placeholder="you@example.com">
					</div>
					<div class="mb-3">
						<label class="form-label">密碼</label> <input type="password"
							class="form-control" name="login-password" placeholder="••••••••" >
					</div>
					<button type="submit" class="btn btn-dark w-100">登入</button>
				</form>
				<hr>
				<p class="text-secondary small m-0">
					沒有帳號？<a href="register.jsp" class="link-dark">建立帳號</a>
				</p>
			</div>
		</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>