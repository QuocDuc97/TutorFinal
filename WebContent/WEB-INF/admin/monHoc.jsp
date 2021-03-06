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
							<h2 class="pageheader-title">Thông tin Môn học</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Thao tác</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Môn học</a></li>
										<li class="breadcrumb-item active" aria-current="page">Môn
											học</li>
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
							<h5 class="card-header card-header-primary">Thông tin Môn
								học</h5>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<a href="#" class="btn btn-primary" data-toggle="modal"
											data-target="#modalAddSubject"
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
												<th scope="col">Tên môn</th>
												<th scope="col">Tên nhóm</th>
												<th scope="col">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty listSubject}">
												<c:forEach items="${listSubject}" var="j">
													<tr>
														<td>${j.idMH}</td>
														<td>${j.tenMH}</td>
														<td>${j.nhomMH.getTenN()}</td>
														<td align="center"><a href="#" data-toggle="modal"
															data-target="#mymodalEditSubject" data-id=""><i
																class="material-icons">edit</i> </a><span> <a
																href="DeleteSubject?idMH_id=${j.idMH}"
																onclick="return confirm('Bạn Có Thực Sự Muốn Xóa Không ?');">
																	<i class="material-icons">delete</i>
															</a>
														</span></td>
													</tr>
													<div class="modal" id="mymodalEditSubject">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<!-- Modal Header -->
																<div class="modal-header">
																	<h1 class="modal-title text-center"
																		style="font-size: 1.7rem">Sửa thông tin Môn học</h1>
																	<button type="button" class="close"
																		data-dismiss="modal">×</button>
																</div>

																<!-- Modal body -->

																<form action="EditSubject" method="post">
																	<div class="modal-body">
																		<div class="container">
																			<div class="form-group row">
																				<label for="full_name"
																					class="col-md-4 col-form-label text-md-right">Tên
																					môn:</label>
																				<div class="col-md-6">
																					<input type="text" id="full_name"
																						class="form-control" name="full-name"
																						value="${j.tenMH}">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="input-select"
																					class="col-md-4 col-form-label text-md-right">Nhóm
																					môn học:</label>
																				<div class="col-md-6">
																					<select class="form-control" id="input-select"
																						name="subject">
																						<option value="${j.nhomMH.getIdN()}">${j.nhomMH.getTenN()}</option>
																						<c:forEach items="${listNhomMH}" var="j">
																							<option value="${j.idN}">${j.tenN}</option>
																						</c:forEach>
																					</select>
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
				<div class="modal" id="modalAddSubject">
					<jsp:include page="modalThemMH.jsp"></jsp:include>
				</div>



			</div>
			<jsp:include page="include/footer.jsp"></jsp:include>
			<!--end dashboard-wrapper -->


		</div>
	</div>
	<jsp:include page="include/js.jsp"></jsp:include>