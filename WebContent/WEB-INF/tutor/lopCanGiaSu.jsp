<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="include/header.jsp"></jsp:include>
<
<style>
<!--
.product .fa {
	margin-top: 5px;
	margin-right: 10px;
	color: #77d1b1;
}

.product p {
	margin-bottom: 0 !important;
}
-->
</style>
<body>
	<div class="dashboard-main-wrapper">
		<!-- navbar -->
		<jsp:include page="include/dashboard-header.jsp"></jsp:include>
		<!--end navbar -->

		<!-- left-sidebar -->
		<jsp:include page="include/sidebar.jsp"></jsp:include>
		<!--end left-sidebar -->


		<!-- dashboard-wrapper -->
		<div class="dashboard-wrapper">
			<div class="dashboard-ecommerce">
				<div class="container-fluid  dashboard-content">
					<!-- pageheader -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<h2 class="pageheader-title">Lớp cần gia sư</h2>
								<p class="pageheader-text"></p>
								<div class="page-breadcrumb">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="#"
												class="breadcrumb-link">Dashboard</a></li>
											<li class="breadcrumb-item"><a href="#"
												class="breadcrumb-link">Tìm kiếm</a></li>
											<li class="breadcrumb-item active" aria-current="page">Lớp
												cần gia sư</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end pageheader -->

					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="row">
								<c:if test="${not empty listClass}">
									<c:forEach items="${listClass}" var="j">
										<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
											<div class="product-thumbnail">

												<div class="product-content">
													<div class="product-content-head">
														<h3 class="product-title">
															<b>${j.tenL}</b>
														</h3>
														<!-- <div class="product-rating d-inline-block">
															<i class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i>
														</div> -->
														<i class="fa fa-briefcase" style="color: #77d1b1"></i> <span>${j.yeuCau}</span><br>
														<i class="fas fa-dollar-sign" style="color: #77d1b1">
														</i> <span>${j.hocPhi} VND/day</span> <br> <i
															class="icon-location-pin" style="color: #77d1b1"></i> <span>${j.diaChi}</span>
														<br>
													</div>
													<div class="product-btn">
														<!-- <a href="#" class="btn btn-primary">Chọn gia sư</a>  -->
														<a href="#" class="btn btn-outline-light">Xem thông
															tin </a>

														<c:if test="${sessionScope.account.id.startsWith('K')}">
															<button
																<%-- href="Apply?idClass=${j.idL} &idGs=${sessionScope.account.id}" --%>
																class="btn btn-primary"
																disabled="disabled">
																<i class="fas fa-check"></i>
															</button>
														</c:if>


														<c:if test="${sessionScope.account.id.startsWith('G')}">
															<a
																href="Apply?idClass=${j.idL} &idGs=${sessionScope.account.id}"
																class="btn btn-primary"><i class="fas fa-check"></i></a>
														</c:if>

													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<c:if test="${currentPage != 1}">
												<li class="page-item"><a class="page-link"
													href="LopTimGS?page=${currentPage - 1}">Previous</a></li>
											</c:if>
											<c:forEach begin="1" end="${noOfPages}" var="i">
												<c:choose>
													<c:when test="${currentPage eq i}">
														<li class="page-item active"><a class="page-link"
															href="LopTimGS?page=${i}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="LopTimGS?page=${i}">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${currentPage lt noOfPages}">
												<li class="page-item"><a class="page-link"
													href="LopTimGS?page=${currentPage + 1}">Next</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
							</div>
						</div>
						<%-- <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
							<div class="product-sidebar">
								<div class="product-sidebar-widget">
									<h4 class="mb-0">Lọc theo</h4>
								</div>
								<div class="product-sidebar-widget">
									<c:if test="${not empty dsMonHoc}">
										<h4 class="product-sidebar-widget-title">Môn học</h4>
										<c:forEach items="${dsMonHoc}" var="j">
											<c:set var="b" value="${b+1}"></c:set>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input"
													id="cat-${b}"> <label class="custom-control-label"
													for="cat-${b}"><a href="#">${j.tenMH}</a></label>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="product-sidebar-widget">
									<h4 class="product-sidebar-widget-title">Giới tính</h4>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="size-1"> <label class="custom-control-label"
											for="size-1">Nam</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="size-2"> <label class="custom-control-label"
											for="size-2">Nữ</label>
									</div>
								</div>
								<div class="product-sidebar-widget">
									<h4 class="product-sidebar-widget-title">Công việc hiện
										tại</h4>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="brand-1"> <label class="custom-control-label"
											for="brand-1">Sinh viên</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="brand-2"> <label class="custom-control-label"
											for="brand-2">Khác</label>
									</div>
								</div>
								<div class="product-sidebar-widget">
									<h4 class="product-sidebar-widget-title">Giá tiền</h4>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="price-1"> <label class="custom-control-label"
											for="price-1">100.000-150000</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="price-2"> <label class="custom-control-label"
											for="price-2">150000-300000</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="price-3"> <label class="custom-control-label"
											for="price-3">trên 300000</label>
									</div>
								</div>
								<div class="product-sidebar-widget">
									<a href="#" class="btn btn-outline-light">Bộ lọc mặc định</a>
								</div>
							</div>
						</div> --%>
					</div>
				</div>

			</div>

			<jsp:include page="include/footer.jsp"></jsp:include>


		</div>
		<!--end dashboard-wrapper -->


	</div>
	<jsp:include page="include/js.jsp"></jsp:include>