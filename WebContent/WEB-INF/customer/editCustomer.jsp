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
											class="breadcrumb-link">Menu</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Tài khoản</a></li>
										<li class="breadcrumb-item active" aria-current="page">Tất
											cả tài khoản</li>
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
							<h5 class="card-header">Cập nhật thông tin tài khoản</h5>
							<div class="card-body">
								<c:if test="${not empty listCustomerEdit}">
									<form id="validationform" data-parsley-validate=""
										novalidate="" method="post" action="EditCustomer">
										<input name="id" value="${listTutorEdit.idGS}" hidden="">
										<div class="form-group row">
											<label class="col-12 col-sm-3 col-form-label text-sm-right">Họ
												và tên:</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<input type="text" required="" placeholder="Type something"
													class="form-control" name="full-name"
													value="${listCustomerEdit.hoTen}">
											</div>
										</div>

										<div class="form-group row">
											<label class="col-12 col-sm-3 col-form-label text-sm-right">Email</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<input type="email" required="" data-parsley-type="email"
													placeholder="Enter a valid e-mail" class="form-control"
													name="email-address" value="${listCustomerEdit.email}">
											</div>
										</div>
										<c:set var="gender"
											value="${requestScope.listCustomerEdit.gioiTinh}" />
										<div class="form-group row">
											<label for="gioitinh"
												class="col-12 col-sm-3 col-form-label text-sm-right">Giới
												tính</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<label
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" name="gender" checked=""
													class="custom-control-input" value="Female"
													<c:if test="${gender=='Female'}">checked</c:if>><span
													class="custom-control-label">Female</span>
												</label> <label
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" name="gender"
													class="custom-control-input" value="Male"
													<c:if test="${gender=='Male'}">checked</c:if>><span
													class="custom-control-label">Male</span>
												</label>
											</div>
										</div>
										<div class="form-group row">
											<label for="phone_number"
												class="col-12 col-sm-3 col-form-label text-sm-right">Số
												điện thoại</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<input type="text" id="phone_number" class="form-control"
													name="phone_number" value="${listCustomerEdit.soDienThoai}">
											</div>
										</div>

										<div class="form-group row">
											<label for="present_address"
												class="col-12 col-sm-3 col-form-label text-sm-right">
												Địa chỉ:</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<textarea id="student_address" class="form-control"
													name="student_address">${requestScope.listCustomerEdit.diaChi}</textarea>
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