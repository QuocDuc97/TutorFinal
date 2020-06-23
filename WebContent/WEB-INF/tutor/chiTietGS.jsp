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
			<div class="container-fluid  dashboard-content">
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Chi tiết gia sư</h2>
							<p class="pageheader-text"></p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Dashboard</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Gia Sư</a></li>
										<li class="breadcrumb-item active" aria-current="page">Chi
											tiết gia sư</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->

				<div class="row">
					<div
						class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="row">
							<c:if test="${not empty giaSu}" var="j">
								<div
									class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pr-xl-0 pr-lg-0 pr-md-0  m-b-30">
									<div class="product-slider">
										<div id="productslider-1"
											class="product-carousel carousel slide" data-ride="carousel">
											<!-- <ol class="carousel-indicators">
												<li data-target="#carouselExampleIndicators"
													data-slide-to="0" class="active"></li>
												<li data-target="#carouselExampleIndicators"
													data-slide-to="1"></li>
												<li data-target="#carouselExampleIndicators"
													data-slide-to="2"></li>
											</ol> -->
											<c:url
												value="Image?fname=
											${requestScope.giaSu.imageGS}"
												var="imgUrl"></c:url>

											<div class="carousel-inner">
												<div class="carousel-item active">
													<img class="d-block" src="${imgUrl}" alt="First slide"
														style="width: 285px; height: 313px">
												</div>

											</div>

										</div>
									</div>
								</div>
								<div
									class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
									<div class="product-details">
										<div class="border-bottom pb-3 mb-3">
											<h2 class="mb-3">
												<i class="icon-user"></i> ${requestScope.giaSu.hotenGS}
											</h2>
											<div class="product-rating d-inline-block float-right">
												<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
												<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
												<i class="fa fa-fw fa-star"></i>
											</div>
											<h4 class="mb-0 text-primary">
												<i class="fas fa-dollar-sign" style="color: #77d1b1"> </i> <span>${requestScope.giaSu.price}
													VND/buổi</span>
											</h4>
										</div>
										<c:if test="${not empty listMonHocbyTutor}">
											<div class="product-colors border-bottom">
												<h4>Môn học</h4>
												<c:forEach items="${listMonHocbyTutor}" var="b">
													<span>${b.tenMH},</span>

												</c:forEach>
											</div>
										</c:if>
										<!--
										<div class="product-size border-bottom">
											<h4>Size</h4>
											<div class="btn-group" role="group" aria-label="First group">
												<button type="button" class="btn btn-outline-light">SM</button>
												<button type="button" class="btn btn-outline-light">L</button>
												<button type="button" class="btn btn-outline-light">XL</button>
												<button type="button" class="btn btn-outline-light">XXl</button>
											</div>
											<div class="product-qty">
												<h4>Quantity</h4>
												<div class="quantity">
													<input type="number" min="1" max="9" step="1" value="1">
												</div>
											</div>
										</div>
										 -->
										<div class="product-description">
											<h4 class="mb-1">Mô tả</h4>
											<p>${requestScope.giaSu.moTa}</p>
											<form action="AddClass">
												<input name="idGS" value="${requestScope.giaSu.idGS}"
													hidden="">
												<button class="btn btn-primary btn-block btn-lg"
													type="submit">Chọn gia sư</button>
											</form>
										</div>
									</div>
								</div>
								<!-- <div
									class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60">
									<div class="simple-card">
										<ul class="nav nav-tabs" id="myTab5" role="tablist">
											<li class="nav-item"><a
												class="nav-link active border-left-0" id="product-tab-1"
												data-toggle="tab" href="#tab-1" role="tab"
												aria-controls="product-tab-1" aria-selected="true">Descriptions</a>
											</li>
											<li class="nav-item"><a class="nav-link"
												id="product-tab-2" data-toggle="tab" href="#tab-2"
												role="tab" aria-controls="product-tab-2"
												aria-selected="false">Reviews</a></li>
										</ul>
										<div class="tab-content" id="myTabContent5">
											<div class="tab-pane fade show active" id="tab-1"
												role="tabpanel" aria-labelledby="product-tab-1">
												<p>Praesent et cursus quam. Etiam vulputate est et metus
													pellentesque iaculis. Suspendisse nec urna augue.
													Vestibulum ante ipsum primis in faucibus orci luctus et
													ultrices posuere cubiliaurae.</p>
												<p>Nam condimentum erat aliquet rutrum fringilla.
													Suspendisse potenti. Vestibulum placerat elementum
													sollicitudin. Aliquam consequat molestie tortor, et
													dignissim quam blandit nec. Donec tincidunt dui libero, ac
													convallis urna dapibus eu. Praesent volutpat mi eget diam
													efficitur, a mollis quam ultricies. Morbi eu turpis odio.</p>
												<ul class="list-unstyled arrow">
													<li>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit.</li>
													<li>Donec ut elit sodales, dignissim elit et,
														sollicitudin nulla.</li>
													<li>Donec at leo sed nisl vestibulum fermentum.</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="tab-1" active role="tabpanel"
												aria-labelledby="product-tab-1">
												<div class="review-block">
													<p class="review-text font-italic m-0">“Vestibulum
														cursus felis vel arcu convallis, viverra commodo felis
														bibendum. Orci varius natoque penatibus et magnis dis
														parturient montes, nascetur ridiculus mus. Proin non
														auctor est, sed lacinia velit. Orci varius natoque
														penatibus et magnis dis parturient montes nascetur
														ridiculus mus.”</p>
													<div class="rating-star mb-4">
														<i class="fa fa-fw fa-star"></i> <i
															class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
														<i class="fa fa-fw fa-star"></i> <i
															class="fa fa-fw fa-star"></i>
													</div>
													<span class="text-dark font-weight-bold">Virgina G.
														Lightfoot</span><small class="text-mute"> (Company name)</small>
												</div>
												<div class="review-block border-top mt-3 pt-3">
													<p class="review-text font-italic m-0">“Integer pretium
														laoreet mi ultrices tincidunt. Suspendisse eget risus nec
														sapien malesuada ullamcorper eu ac sapien. Maecenas nulla
														orci, varius ac tincidunt non, ornare a sem. Aliquam sed
														massa volutpat, aliquet nibh sit amet, tincidunt ex. Donec
														interdum pharetra dignissim.”</p>
													<div class="rating-star mb-4">
														<i class="fa fa-fw fa-star"></i> <i
															class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
														<i class="fa fa-fw fa-star"></i> <i
															class="fa fa-fw fa-star"></i>
													</div>
													<span class="text-dark font-weight-bold">Ruby B.
														Matheny</span><small class="text-mute"> (Company name)</small>
												</div>
												<div class="review-block  border-top mt-3 pt-3">
													<p class="review-text font-italic m-0">“ Cras non
														rutrum neque. Sed lacinia ex elit, vel viverra nisl
														faucibus eu. Aenean faucibus neque vestibulum condimentum
														maximus. In id porttitor nisi. Quisque sit amet commodo
														arcu, cursus pharetra elit. Nam tincidunt lobortis augueat
														euismod ante sodales non. ”</p>
													<div class="rating-star mb-4">
														<i class="fa fa-fw fa-star"></i> <i
															class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
														<i class="fa fa-fw fa-star"></i> <i
															class="fa fa-fw fa-star"></i>
													</div>
													<span class="text-dark font-weight-bold">Gloria S.
														Castillo</span><small class="text-mute"> (Company name)</small>
												</div>
											</div>
										</div>
									</div>
								</div> -->
							</c:if>
						</div>


					</div>

					<jsp:include page="include/footer.jsp"></jsp:include>


				</div>
				<!--end dashboard-wrapper -->


			</div>
			<jsp:include page="include/js.jsp"></jsp:include>