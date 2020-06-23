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
					class="splash-description">Vui lòng điền thông tin của bạn.</span>
			</div>
			<div class="card-body">
				<form action="LoginUserServlet" method="post">
					<p>Đừng lo lắng, chúng tôi sẽ gửi email cho bạn để bạn thay đổi
						mật khẩu.</p>
					<div class="form-group">
						<input class="form-control form-control-lg" type="email"
							name="email" required="" placeholder="Your Email"
							autocomplete="off">
					</div>

					<div class="form-group pt-1">
						<a class="btn btn-block btn-primary btn-xl" href="../index.html">Gửi
						</a>
					</div>
				</form>
			</div>
			<div class="card-footer bg-white p-0  ">
				<div class="card-footer text-center">
					<span>Bạn không có tài khoản ? <a href="RegisterUserServlet">Đăng
							ký</a></span>
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