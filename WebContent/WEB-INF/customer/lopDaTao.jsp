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
												class="breadcrumb-link">Lớp</a></li>
											<li class="breadcrumb-item active" aria-current="page">Các
												lớp đã tạo</li>
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
							<div class="card">
								<h4 class="card-header card-header-primary">Các lớp đã tạo</h4>
								<div class="container-fluid">
									<div class="row">
										<div class="col-sm-3"></div>
										<div class="col-sm-3" style="top: 50%">

											<a href="#" class="btn btn-primary" data-toggle="modal"
												data-target="#exampleModal"
												style="text-decoration: none; margin-top: 6%"><i
												class="fa fa-plus"></i> Thêm mới</a>
										</div>
										<div class="col-sm-6">
											<div class="input-group col sm-3" style="top: 20%">
												<input type="text" class="form-control">
												<div class="input-group-append">
													<button type="button" class="btn btn-primary">Tìm
														kiếm!</button>
												</div>
											</div>
										</div>
									</div>
									<div id="exampleModal" class="modal">
										<jsp:include page="modalThemLop.jsp"></jsp:include>
									</div>
								</div>
								<div class="card-body">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="row">
											<c:if test="${not empty listClassAddByCustomer}">
												<c:forEach items="${listClassAddByCustomer}" var="j">
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
																	<i class="fa fa-briefcase" style="color: #77d1b1"></i>
																	<span>${j.yeuCau}</span><br> <i
																		class="fas fa-dollar-sign" style="color: #77d1b1">
																	</i> <span>${j.hocPhi} VND/day</span> <br> <i
																		class="icon-location-pin" style="color: #77d1b1"></i>
																	<span>${j.diaChi}</span> <br>
																</div>
																<div class="product-btn">
																	<!-- <a href="#" class="btn btn-primary">Chọn gia sư</a>  -->
																	<a href="#" class="btn btn-outline-light">Xem thông
																		tin </a> <a
																		href="Apply?idClass=${j.idL} &idGs=${
											sessionScope.account.id}"
																		<c:if
										test="${sessionScope.account.id.startsWith('K')}">
										class="btn btn-primary btn disabled"
									</c:if>
																		<c:if
										test="${sessionScope.account.id.startsWith('G')}">
										class="btn btn-primary"
									</c:if>><i
																		class="fas fa-check"></i></a>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
										</div>
									</div>
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<c:if test="${currentPage != 1}">
													<li class="page-item"><a class="page-link"
														href="displayAddByCustomer?page=${currentPage - 1}">Previous</a></li>
												</c:if>
												<c:forEach begin="1" end="${noOfPages}" var="i">
													<c:choose>
														<c:when test="${currentPage eq i}">
															<li class="page-item active"><a class="page-link"
																href="displayAddByCustomer?page=${i}">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
																href="displayAddByCustomer?page=${i}">${i}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${currentPage lt noOfPages}">
													<li class="page-item"><a class="page-link"
														href="displayAddByCustomer?page=${currentPage + 1}">Next</a></li>
												</c:if>
											</ul>
										</nav>

									</div>
								</div>

							</div>
						</div>

					</div>

					<jsp:include page="include/footer.jsp"></jsp:include>



				</div>
			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>