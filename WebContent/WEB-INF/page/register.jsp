
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Đăng ký</title>
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
<!-- ============================================================== -->
<!-- signup form  -->
<!-- ============================================================== -->

<body>
	<!-- ============================================================== -->
	<!-- signup form  -->
	<!-- ============================================================== -->
	<form class="splash-container">
		<div class="card">
			<div class="card-header">
				<h3 class="mb-1">Đăng ký chức năng</h3>
				<p>Vui lòng chọn chức năng.</p>
			</div>
			<div class="card-body">
				<div class="form-group row pt-0">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
						<button class="btn btn-block btn-social btn-facebook "
							type="button" data-toggle="modal" data-target="#modalAddCustomer">Học
							sinh</button>
					</div>
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<button class="btn  btn-block btn-social btn-twitter"
							type="button" data-toggle="modal" data-target="#modalAddTutor">Gia
							sư</button>
					</div>
				</div>
			</div>
			<div class="card-footer bg-white">
				<p>
					Đã có tài khoản?&ensp;<a href="LoginUserServlet"
						class="text-secondary">Đăng nhập ở đây.</a>
				</p>
			</div>
		</div>
	</form>

	<div class="modal" id="modalAddCustomer">
		<jsp:include page="../admin/modalThemKH.jsp"></jsp:include>
	</div>
	<div class="modal" id="modalAddTutor">
		<jsp:include page="../admin/modalThemGS.jsp"></jsp:include>
	</div>
	<jsp:include page="../admin/include/js.jsp"></jsp:include>
</body>


</html>