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
							<h2 class="pageheader-title">Các lớp đang dạy</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Thao tác</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Lớp đang dạy</a></li>
										<li class="breadcrumb-item active" aria-current="page">Tất
											cả các lớp</li>
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
							<h4 class="card-header card-header-primary">Các lớp của tôi</h4>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<a href="LopTimGS" class="btn btn-primary"
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
												<th scope="col">#</th>
												<th scope="col">ID</th>
												<th scope="col">Tên lớp</th>
												<th scope="col">Tên môn</th>
												<th scope="col">Địa chỉ</th>
												<th scope="col">Sổ liên lạc</th>
												<!-- <th scope="col">Thao tác</th> -->
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty danhSachLopDangDay}">
												<c:forEach items="${danhSachLopDangDay}" var="j">
													<tr>
														<c:set var="b" value="${b+1}"></c:set>
														<td>${b}</td>
														<td>${j.idL}</td>
														<td>${j.tenL}</td>
														<td>${j.monHoc.getTenMH()}</td>
														<td>${j.diaChi}</td>
														<td><a href="#"><i class="material-icons">brush</i></a></td>
														<%-- <td><a href="#" data-toggle="modal"
															data-target="#modalEditTutor" data-id=""><i
																class="fa fa-edit"></i> </a><span> <a
																href="DeleteCustomer?idKH_id=${j.idL}"
																onclick="return confirm('Bạn Có Thực Sự Muốn Xóa Không ?');">
																	<i class="fa fa-trash"></i>
															</a>
														</span></td> --%>
													</tr>

													<%-- <div class="modal" id="modalEditTutor">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<!-- Modal Header -->
																<div class="modal-header">
																	<h1 class="modal-title text-center"
																		style="font-size: 1.7rem">Sửa thông tin Gia sư</h1>
																	<button type="button" class="close"
																		data-dismiss="modal">×</button>
																</div>
																<!-- Modal body -->
																<form action="EditTutor" method="post">
																	<div class="modal-body">
																		<div class="container">
																			<div class="form-group row">
																				<label for="full_name"
																					class="col-md-4 col-form-label text-md-right">Họ
																					và tên:</label>
																				<div class="col-md-6">
																					<input type="text" id="full_name"
																						class="form-control" name="full-name"
																						value="${j.hotenGS}">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="email_address"
																					class="col-md-4 col-form-label text-md-right">Email:</label>
																				<div class="col-md-6">
																					<input type="text" id="email_address"
																						class="form-control" name="email-address"
																						value="${j.emailGS}">
																				</div>
																			</div>


																			<div class="form-group row">
																				<label for="image"
																					class="col-md-4 col-form-label text-md-right">Image
																					:</label>
																				<div class="col-md-6">
																					<div class="custom-file mb-3">
																						<input type="file" class="custom-file-input"
																							id="customFile"> <label
																							class="custom-file-label" for="customFile">File
																							Input</label>
																					</div>
																				</div>
																			</div>



																			<c:set var="gender" value="${j.gioiTinhGS}" />
																			<div class="form-group row">
																				<label for="gioitinh"
																					class="col-md-4 col-form-label text-md-right">Giới
																					tính</label>
																				<div class="col-md-6">
																					<label
																						class="custom-control custom-radio custom-control-inline">
																						<input type="radio" name="gender"
																						class="custom-control-input"
																						<c:if test="${gender=='Female'}">checked</c:if>><span
																						class="custom-control-label">Female</span>
																					</label> <label
																						class="custom-control custom-radio custom-control-inline">
																						<input type="radio" name="gender"
																						class="custom-control-input"
																						<c:if test="${gender=='Male'}">checked</c:if>><span
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
																						class="form-control" value="${j.soDienThoaiGS}"
																						name="phone_number">
																				</div>
																			</div>

																			<div class="form-group row">
																				<label for="present_address"
																					class="col-md-4 col-form-label text-md-right">
																					Địa chỉ:</label>
																				<div class="col-md-6">
																					<textarea id="student_address" class="form-control"
																						name="student_address">${j.diaChiGS}</textarea>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="address"
																					class="col-md-4 col-form-label text-md-right">Công
																					việc: </label>
																				<div class="col-md-6">
																					<select class="form-control" id="address"
																						name="subject">
																						<option value="${j.ngheNghiepGS}">${j.ngheNghiepGS}</option>
																						<option value="Sinh viên">Sinh viên</option>
																						<option value="Đã đi làm">Đã đi làm</option>
																					</select>
																				</div>
																			</div>


																		</div>
																	</div>

																	<!-- Modal footer student -->
																	<div class="modal-footer">
																		<button type="submit" class="btn btn-primary">Thêm
																			mới</button>
																		<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Đóng</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
 --%>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>

								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${currentPage != 1}">
											<li class="page-item"><a class="page-link"
												href="LopDangDay?page=${currentPage - 1}">Previous</a></li>
										</c:if>
										<c:forEach begin="1" end="${noOfPages}" var="i">
											<c:choose>
												<c:when test="${currentPage eq i}">
													<li class="page-item active"><a class="page-link"
														href="LopDangDay?page=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="LopDangDay?page=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${currentPage lt noOfPages}">
											<li class="page-item"><a class="page-link"
												href="LopDangDay?page=${currentPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</nav>
							</div>

						</div>
					</div>
				</div>
				<%-- <div class="modal" id="modalAddTutor">
					<jsp:include page="modalThemGS.jsp"></jsp:include>
				</div> --%>


				<jsp:include page="include/footer.jsp"></jsp:include>


			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>
		<script type="text/javascript">
			// Add the following code if you want the name of the file appear on select
			$(".custom-file-input").on(
					"change",
					function() {
						var fileName = $(this).val().split("\\").pop();
						$(this).siblings(".custom-file-label").addClass(
								"selected").html(fileName);
					});
		</script>