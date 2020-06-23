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
							<h2 class="pageheader-title">Thông tin tài khoản</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Thao tác</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Phê duyệt</a></li>
										<li class="breadcrumb-item active" aria-current="page">Phê
											duyệt bài đăng</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- ============================================================== -->
					<!-- valifation types -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Phê duyệt bài đăng</h5>
							<div class="card-body">
								<c:if test="${not empty editClass}">
									<form id="validationform" data-parsley-validate=""
										novalidate="" method="post" action="EditApprovedClass">
										<input name="id" value="${editClass.idL}" hidden="">
										<div class="form-group row">
											<label class="col-12 col-sm-3 col-form-label text-sm-right">Tên
												lớp</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<input type="text" required="" placeholder="Type something"
													class="form-control" name="full-name"
													value="${editClass.tenL}" disabled="disabled">
											</div>
										</div>

										<div class="form-group row">
											<label class="col-12 col-sm-3 col-form-label text-sm-right">Trạng
												thái</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<select class="form-control" id="address" name="trangThai">
													<c:if test="${editClass.trangThai==1}">
														<option value="${editClass.trangThai}">Không Phê
															duyệt</option>
													</c:if>
													<c:if test="${editClass.trangThai==0}">
														<option value="${editClass.trangThai}">Phê duyệt</option>
													</c:if>
													<option value="0">Phê duyệt</option>
													<option value="1">Không phê duyệt</option>
												</select>
											</div>
										</div>

										<div class="form-group row text-right">
											<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
												<button type="submit" class="btn btn-space btn-primary">OK</button>
												<button class="btn btn-space btn-secondary" type="button"
													onclick="history.go(-1);">Trở về</button>
											</div>
										</div>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->


				<!-- ============================================================== -->
				<!-- end valifation types -->
				<!-- ============================================================== -->

				<jsp:include page="include/footer.jsp"></jsp:include>


			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>