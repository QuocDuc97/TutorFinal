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
							<h2 class="pageheader-title">Thông tin khách hàng</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Thao tác</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Người dùng</a></li>
										<li class="breadcrumb-item active" aria-current="page">Khách
											Hàng</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->

				<div class="row">
					<!-- ============================================================== -->
					<!-- basic table -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header card-header-primary">Thông tin khách
								hàng</h5>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<a href="#" class="btn btn-primary" data-toggle="modal"
											data-target="#modalAddCustomer"
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
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Họ tên</th>
												<th scope="col">Email</th>
												<th scope="col">Giới tính</th>
												<th scope="col">Số điện thoại</th>
												<th scope="col">Địa chỉ</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty listCustomer}">
												<c:forEach items="${listCustomer}" var="j">
													<tr>
														<td>${j.idKH}</td>
														<td>${j.hoTen}</td>
														<td>${j.email}</td>
														<td>${j.gioiTinh}</td>
														<td>${j.soDienThoai}</td>
														<td>${j.diaChi}</td>
														<td align="center"><a
															href="EditCustomer?idKH_id=${j.idKH}"><i
																class="material-icons">edit</i> </a><span> <a
																href="DeleteCustomer?idKH_id=${j.idKH}"
																onclick="return confirm('Bạn Có Thực Sự Muốn Xóa Không ?');">
																	<i class="material-icons">delete</i>
															</a>
														</span></td>
													</tr>

													<div class="modal" id="mymodalEditClass">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<!-- Modal Header -->
																<div class="modal-header">
																	<h1 class="modal-title text-center"
																		style="font-size: 1.7rem">Sửa thông tin khách
																		hàng</h1>
																	<button type="button" class="close"
																		data-dismiss="modal">×</button>
																</div>

																<!-- Modal body -->

																<form action="AddCustomer" method="post">
																	<div class="modal-body">
																		<div class="container">
																			<div class="form-group row">
																				<label for="full_name"
																					class="col-md-4 col-form-label text-md-right">Họ
																					và tên:</label>
																				<div class="col-md-6">
																					<input type="text" id="full_name"
																						class="form-control" name="full-name"
																						value="${j.hoTen}">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="email_address"
																					class="col-md-4 col-form-label text-md-right">Email:</label>
																				<div class="col-md-6">
																					<input type="text" id="email_address"
																						class="form-control" name="email-address"
																						value="${j.email}">
																				</div>
																			</div>
																			<c:set var="gender"
																				value="${sessionScope.customer.gioiTinh}" />
																			<div class="form-group row">
																				<label for="gioitinh"
																					class="col-md-4 col-form-label text-md-right">Giới
																					tính</label>
																				<div class="col-md-6">
																					<label
																						class="custom-control custom-radio custom-control-inline">
																						<input type="radio" name="gender" checked=""
																						class="custom-control-input"><span
																						class="custom-control-label">Female</span>
																					</label> <label
																						class="custom-control custom-radio custom-control-inline">
																						<input type="radio" name="gender"
																						class="custom-control-input"><span
																						class="custom-control-label">Male</span>
																					</label>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="phone_number"
																					class="col-md-4 col-form-label text-md-right">Số
																					điện thoại</label>
																				<div class="col-md-6">
																					<input type="text" id="phone_number"
																						class="form-control" value="${j.soDienThoai}"
																						name="phone_number">
																				</div>
																			</div>

																			<div class="form-group row">
																				<label for="present_address"
																					class="col-md-4 col-form-label text-md-right">
																					Địa chỉ:</label>
																				<div class="col-md-6">
																					<textarea id="student_address" class="form-control"
																						name="student_address">${j.diaChi}</textarea>
																				</div>
																			</div>


																		</div>
																	</div>
																	<!-- Modal footer student -->
																	<div class="modal-footer">
																		<button type="submit" class="btn btn-primary">Update</button>
																		<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Close</button>
																	</div>
																</form>
															</div>
														</div>
													</div>


												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div>


				</div>
				<div class="modal" id="modalAddCustomer">
					<jsp:include page="modalThemKH.jsp"></jsp:include>
				</div>
				<jsp:include page="include/footer.jsp"></jsp:include>


			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>