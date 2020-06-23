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
							<h2 class="pageheader-title">Thêm mới</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Thao tác</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Lớp</a></li>
										<li class="breadcrumb-item active" aria-current="page">Tất
											cả lớp</li>
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
							<h5 class="card-header">Thêm mới lớp</h5>
							<div class="card-body">
								<form id="validationform" data-parsley-validate="" novalidate=""
									method="post" action="AddClass" class="needs-validation">
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Tên
											lớp</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" placeholder="Nhập tên lớp"
												class="form-control" name="tenlop">
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Vui lòng điền thông tin.</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right"
											for="input-select">Tên môn</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<select class="form-control" id="input-select" name="subject">
												<c:forEach items="${listMonHoc}" var="a">
													<option value="${a.idMH}">${a.tenMH}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right"
											for="input-cấp độ">Cấp độ</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<select class="form-control" id="input-select" name="level">
												<c:forEach items="${listLevel}" var="b">
													<option value="${b.idLevel}">${b.levelName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="phone_number"
											class="col-12 col-sm-3 col-form-label text-sm-right">Học
											phí</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="number" id="phone_number" class="form-control"
												name="hocPhi" required="required">
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Vui lòng điền thông tin.</div>
										</div>
									</div>

									<div class="form-group row">
										<label for="present_address"
											class="col-12 col-sm-3 col-form-label text-sm-right">
											Yêu cầu</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<textarea id="student_address" class="form-control"
												name="yeuCau"></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label for="present_address3"
											class="col-12 col-sm-3 col-form-label text-sm-right">
											Địa Chỉ</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<textarea id="student_address3" class="form-control"
												name="diaChi" required="required"></textarea>
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Vui lòng điền thông tin.</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="present_address2"
											class="col-12 col-sm-3 col-form-label text-sm-right">
											Mô tả</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<textarea id="student_address2" class="form-control"
												name="moTa"></textarea>
										</div>
									</div>

									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
											<button type="submit" class="btn btn-space btn-primary">Submit</button>
											<button class="btn btn-space btn-secondary">Cancel</button>
										</div>
									</div>
								</form>
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