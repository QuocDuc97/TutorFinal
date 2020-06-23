<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<!-- Bootstrap CSS -->
<jsp:include page="../admin/include/header.jsp"></jsp:include>
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- login page  -->
	<!-- ============================================================== -->
	<div class="splash-container">
		<div class="card ">
			<div class="card-header text-center">
				<a href="../index.html"><img class="rounded-circle"
					src="assets/img/logoAccount.png" alt="logo"></a><span
					class="splash-description">Điền thông tin đăng nhập.</span>
			</div>
			<div class="card-body">
				<form action="LoginUserServlet" method="post" id="validationform"
					data-parsley-validate="" novalidate="" class="needs-validation">
					<div class="form-group">
						<input class="form-control form-control-lg" id="username"
							name="username" type="text" placeholder="Tên đăng nhập"
							autocomplete="off" required="required">
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Vui lòng nhập tên đăng nhập.</div>
						<div class="form-group">
							<input class="form-control form-control-lg" id="password"
								type="password" placeholder="Mật khẩu" name="password"
								required="required">
						</div>
						<div class="form-group">
							<label class="custom-control custom-checkbox"> <input
								class="custom-control-input" type="checkbox"><span
								class="custom-control-label">Nhớ mật khẩu</span>
							</label>
						</div>
						<button type="submit" class="btn btn-primary btn-lg btn-block">Đăng
							nhập</button>
				</form>
			</div>
			<div class="card-footer bg-white p-0  ">
				<div class="card-footer-item card-footer-item-bordered">
					<a href="RegisterUserServlet" class="footer-link">Tạo tài khoản</a>
				</div>
				<div class="card-footer-item card-footer-item-bordered">
					<a href="ResetPassword" class="footer-link">Quên mật khẩu</a>
				</div>
			</div>
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- end login page  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<jsp:include page="../admin/include/js.jsp"></jsp:include>
</body>

</html>