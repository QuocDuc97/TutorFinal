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
							<h2 class="pageheader-title">Thông tin Lớp</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Thao tác</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Lớp</a></li>
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
							<h5 class="card-header card-header-primary">Danh sách các
								lớp</h5>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<a href="AddClass" class="btn btn-primary"
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
												<th scope="col">STT</th>
												<th scope="col">ID</th>
												<th scope="col">Tên lớp</th>
												<th scope="col">Tên môn</th>
												<th scope="col">Cấp độ</th>
												<th scope="col">Trạng thái</th>
												<th scope="col">Học phí</th>
												<th scope="col">Yêu cầu</th>
												<th scope="col">Địa Chỉ</th>
												<th scope="col">Mô tả</th>
												<th scope="col">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty listClass}">
												<c:forEach items="${listClass}" var="j">
													<tr>
													<tr>
														<c:set var="d" value="${d+1}"></c:set>
														<td>${d}</td>
														<td id="idL">${j.idL}</td>
														<td>${j.tenL}</td>
														<td>${j.monHoc.getTenMH()}</td>
														<td>${j.capDo.getLevelName()}</td>
														<td>${j.trangThai}</td>
														<td>${j.hocPhi}&ensp;VND/buổi</td>
														<td>${j.yeuCau}</td>
														<td>${j.diaChi}</td>
														<td>${j.moTa}</td>
														<td><a href="#" data-toggle="modal"
															data-target="#mymodalEditClass" data-id=""><i
																class="material-icons">edit</i> </a><span> <a
																href="DeleteCustomer?idKH_id=${j.idL}"
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
																		style="font-size: 1.7rem">Sửa thông tin Lớp</h1>
																	<button type="button" class="close"
																		data-dismiss="modal">×</button>
																</div>

																<!-- Modal body -->

																<form action="EditClass" method="post">
																	<div class="modal-body">
																		<div class="container">
																			<div class="form-group row">
																				<label for="full_name"
																					class="col-md-4 col-form-label text-md-right">Họ
																					và tên:</label>
																				<div class="col-md-6">
																					<input type="text" id="full_name"
																						class="form-control" name="full-name"
																						value="${j.tenL}">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="email_address"
																					class="col-md-4 col-form-label text-md-right">Môn
																					học:</label>
																				<div class="col-md-6">
																					<select class="form-control" id="email_address"
																						name="subject">
																						<option value="${j.monHoc.getIdMH()}">${j.monHoc.getTenMH()}</option>
																						<c:forEach items="${monhoc}" var="a">
																							<option value="${a.idMH}">${a.tenMH}</option>
																						</c:forEach>
																					</select>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="gioitinh"
																					class="col-md-4 col-form-label text-md-right">Cấp
																					độ</label>
																				<div class="col-md-6">
																					<select class="form-control" id="gioitinh"
																						name="level">
																						<option value="${j.capDo.getIdLevel()}">${j.capDo.getLevelName()}</option>
																						<c:forEach items="${level}" var="b">
																							<option value="${b.idLevel}">${b.levelName}</option>
																						</c:forEach>
																					</select>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="phone_number"
																					class="col-md-4 col-form-label text-md-right">Trạng
																					thái </label>
																				<div class="col-md-6">
																					<input type="text" id="phone_number"
																						class="form-control" value="${j.trangThai}"
																						name="trangThai">
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

																			<div class="form-group row">
																				<label for="moTa"
																					class="col-md-4 col-form-label text-md-right">
																					Mô tả:</label>
																				<div class="col-md-6">
																					<textarea id="moTa" class="form-control"
																						name="moTa">${j.moTa}</textarea>
																				</div>
																			</div>

																			<div class="form-group row">
																				<label for="hocPhi"
																					class="col-md-4 col-form-label text-md-right">
																					Học Phí (VND/buổi):</label>
																				<div class="col-md-6">
																					<input type="number" id="hocPhi"
																						class="form-control" name="hocPhi"
																						value="${j.hocPhi}">
																				</div>
																			</div>

																			<div class="form-group row">
																				<label for="yeuCau"
																					class="col-md-4 col-form-label text-md-right">
																					Yêu cầu:</label>
																				<div class="col-md-6">
																					<textarea id="yeuCau" class="form-control"
																						name="yeuCau">${j.yeuCau}</textarea>
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

								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${currentPage != 1}">
											<li class="page-item"><a class="page-link"
												href="ListClass?page=${currentPage - 1}">Previous</a></li>
										</c:if>
										<c:forEach begin="1" end="${noOfPages}" var="i">
											<c:choose>
												<c:when test="${currentPage eq i}">
													<li class="page-item active"><a class="page-link"
														href="ListClass?page=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="ListClass?page=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<%--For displaying Next link --%>
										<c:if test="${currentPage lt noOfPages}">
											<li class="page-item"><a class="page-link"
												href="ListClass?page=${currentPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</nav>


							</div>

						</div>
					</div>


				</div>
				<div class="modal" id="modalAddClass">
					<jsp:include page="modalThemLop.jsp"></jsp:include>
				</div>
				<jsp:include page="include/footer.jsp"></jsp:include>


			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>