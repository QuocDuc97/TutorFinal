<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Tutor online</title>
<jsp:include page="include/header.jsp"></jsp:include>
</head>

<body>
	<!---header-------->
	<section id="header">
		<jsp:include page="include/navbar.jsp"></jsp:include>
		<!----banner-->
		<div class="banner text-center">
			<h1>GIA SƯ TRỰC TUYẾN</h1>
			<p>Hãy đến với chúng tôi</p>

		</div>
	</section>
	<!---header-------->
	<!----search tutor-->
	<div class="search-tutor text-center">
		<form action="DisplayTutor">
			<input type="text" class="form-control"
				placeholder="Nhập từ khóa tìm kiếm"> <input type="button"
				class="btn btn-primary" value="Tìm kiếm">
		</form>
	</div>
	<!---- end search tutor-->
	<!----top subject-->
	<section id="top-subject">
		<div class="conatiner text-center">
			<h3>Các môn học hàng đầu</h3>
			<div>
				<img src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png">
			</div>
			<div>
				<img src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png"> <img
					src="assets/client/img/math.png">
			</div>
		</div>
	</section>
	<!-------recent class-->

	<section id="listclass">
		<div class="container ">
			<h5>Lớp cần gia sư</h5>
			<c:if test="${not empty listClass}">
				<c:forEach items="${listClass}" var="j">
					<div class="company-details">
						<div class="job-update">
							<h4>
								<b>${j.tenL}</b>
							</h4>
							<p>${j.tenL}</p>
							<i class="fa fa-briefcase"></i> <span>${j.yeuCau}</span><br>
							<i class="fa fa-inr"></i> <span>${j.hocPhi} VND/day</span><br>
							<i class="fa fa-map-marker"></i> <span>${j.diaChi}</span><br>
							<p>
								Description: <i class="fa fa-angle-double-right"></i> ${j.moTa}
								<!-- <a href="#">Read more</a> -->
							</p>
						</div>
						<div class="apply-btn">
							<button type="button" class="btn btn-primary" disabled="disabled">Nhận
								lớp</button>
						</div>
					</div>
				</c:forEach>
			</c:if>


			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${currentPage != 1}">
						<li class="page-item"><a class="page-link"
							href="home?page=${currentPage - 1}">Previous</a></li>
					</c:if>
					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<li class="page-item active"><a class="page-link"
									href="home?page=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="home?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage lt noOfPages}">
						<li class="page-item"><a class="page-link"
							href="home?page=${currentPage + 1}">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>
	<!-- site- stats -->
	<section id="site-stats">
		<div class="container text-center">
			<h3>Về chúng tôi</h3>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-6">
							<div class="stats-box">
								<i class="fa fa-hand-peace-o"></i><span><small>10k
										+</small></span>
								<p>Lượt tìm kiếm</p>
							</div>
						</div>
						<div class="col-6">
							<div class="stats-box">
								<i class="fa fa-user-o"></i><span><small>100k +</small></span>
								<p>Người sử dụng</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-6">
							<div class="stats-box">
								<i class="fa fa-hand-peace-o"></i><span><small>10k
										+</small></span>
								<p>Với sứ mạng giáo dục chúng tôi cung cấp, giới thiệu các
									gia sư uy tín, đảm bảo chất lượng</p>
							</div>
						</div>
						<div class="col-6">
							<div class="stats-box">
								<i class="fa fa-user-o"></i><span><small>100k +</small></span>
								<p>Gọi ngay cho chúng tôi qua số điện thoại: 0981895317</p>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		</div>
	</section>
	<section id="app-banner" class=" container text-center">
		<h1>Tải app của chúng tôi</h1>
		<img src="assets/client/img/gooogle.png"> <img
			src="assets/client/img/appstore.png">
	</section>
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>
</html>