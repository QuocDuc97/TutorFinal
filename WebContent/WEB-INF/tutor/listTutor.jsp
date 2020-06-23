<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="include/header.jsp"></jsp:include>
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
								<h2 class="pageheader-title">Danh sách gia sư</h2>
								<p class="pageheader-text"></p>
								<div class="page-breadcrumb">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="#"
												class="breadcrumb-link">Dashboard</a></li>
											<li class="breadcrumb-item"><a href="#"
												class="breadcrumb-link">Tìm kiếm</a></li>
											<li class="breadcrumb-item active" aria-current="page">Danh
												sách gia sư</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end pageheader -->

					<div class="row">
						<div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
							<div class="row">
								<c:if test="${not empty listGS1}">
									<c:forEach items="${listGS1}" var="j">
										<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
											<div class="product-thumbnail">

												<div class="product-img-head">
													<div class="product-img">
														<c:url value="Image?fname=${j.imageGS }" var="imgUrl"></c:url>
														<img src="${imgUrl}" alt="" class="img-fluid">
													</div>
													<div class="">
														<a href="#" class="product-wishlist-btn"><i
															class="fas fa-heart"></i></a>
													</div>
												</div>
												<div class="product-content">
													<div class="product-content-head">
														<h3 class="product-title">
															<i class="icon-user"></i> ${j.hotenGS }
														</h3>
														<div class="product-rating d-inline-block">
															<i class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i> <i
																class="fa fa-fw fa-star"></i>
														</div>
														<div class="product-price">
															<i class="fas fa-dollar-sign" style="color: #77d1b1">
															</i> <span>${j.price} VND/day</span>
														</div>
													</div>
													<div class="product-btn">
														<!-- <a href="#" class="btn btn-primary">Chọn gia sư</a>  -->
														<a href="DetailTutor?id=${j.idGS}"
															class="btn btn-outline-light">Xem thông tin</a> <a
															href="#" class="btn btn-primary" alt="chọn gia sư này"><i
															class="fas fa-check"></i></a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<nav aria-label="Page navigation example">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item active"><a class="page-link "
												href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
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
													for="cat-${b}"><a
													href="SearchBySubject?sub=${j.idMH}">${j.tenMH}</a></label>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="product-sidebar-widget">
									<h4 class="product-sidebar-widget-title">Giới tính</h4>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="size-1"> <label class="custom-control-label"
											for="size-1"> <a href="SearchByGarder?gender=Male">Nam</a></label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="size-2"> <label class="custom-control-label"
											for="size-2"> <a href="SearchByGarder?gender=Female">Nữ</a></label>
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
								<!-- <div class="product-sidebar-widget">
									<h4 class="product-sidebar-widget-title">Color</h4>
									<div class="custom-control custom-radio custom-color-blue ">
										<input type="radio" id="color-1" name="customRadio"
											class="custom-control-input"> <label
											class="custom-control-label" for="color-1">Blue</label>
									</div>
									<div class="custom-control custom-radio custom-color-red ">
										<input type="radio" id="color-2" name="customRadio"
											class="custom-control-input"> <label
											class="custom-control-label" for="color-2">Red</label>
									</div>
									<div class="custom-control custom-radio custom-color-yellow ">
										<input type="radio" id="color-3" name="customRadio"
											class="custom-control-input"> <label
											class="custom-control-label" for="color-3">Yellow</label>
									</div>
									<div class="custom-control custom-radio custom-color-black ">
										<input type="radio" id="color-4" name="customRadio"
											class="custom-control-input"> <label
											class="custom-control-label" for="color-4">Black</label>
									</div>
								</div> -->
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
						</div>
					</div>
				</div>

			</div>

			<jsp:include page="include/footer.jsp"></jsp:include>


		</div>
		<!--end dashboard-wrapper -->


	</div>
	<jsp:include page="include/js.jsp"></jsp:include>