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
				<!-- ============================================================== -->
				<!-- end pageheader -->

				<div class="row">
					<!-- ============================================================== -->
					<!-- basic table -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header card-header-primary">Danh sách tài
								khoản</h5>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<a href="#" class="btn btn-primary" data-toggle="modal"
											data-target="#modalAddClass"
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
												<th scope="col">Tên đăng nhập</th>
												<th scope="col">Mật khẩu</th>
												<th scope="col">Quyền</th>
												<th scope="col">Trạng thái</th>
												<th scope="col">Loại tài khoản</th>
												<th scope="col">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty listAcc}">
												<c:forEach items="${listAcc}" var="j">
													<tr>
														<c:set var="d" value="${d+1}"></c:set>
														<td>${d}</td>
														<td id="idL">${j.id}</td>
														<td>${j.username}</td>
														<td>${j.password}</td>
														<c:set value="${j.role}" var="b"></c:set>
														<td><c:if test="${b==0}">Admin</c:if> <c:if
																test="${b==1}">User</c:if></td>
														<td><c:if test="${j.status==1}">Hoạt động</c:if> <c:if
																test="${j.status==0}">Không hoạt động</c:if></td>
														<td><c:if test="${j.accountType==0}">Admin</c:if> <c:if
																test="${j.accountType==1}">Khách hàng</c:if> <c:if
																test="${j.accountType==2}">Gia sư</c:if></td>
														<td><a href="#" data-toggle="modal"
															data-target="#mymodalEditAccount" data-id=""><i
																class="material-icons">edit</i> </a><span> <a
																href="DeleteAccount?idKH_id=${j.id}"
																onclick="return confirm('Bạn Có Thực Sự Muốn Xóa Không ?');">
																	<i class="material-icons">delete</i>
															</a>
														</span></td>
													</tr>
													<div class="modal" id="mymodalEditAccount">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<!-- Modal Header -->
																<div class="modal-header">
																	<h1 class="modal-title text-center"
																		style="font-size: 1.7rem">Thay đổi tài khoản</h1>
																	<button type="button" class="close"
																		data-dismiss="modal">×</button>
																</div>

																<!-- Modal body -->

																<form action="EditClass" method="post">
																	<div class="modal-body">
																		<div class="container">
																			<div class="form-group row">
																				<label for="full_name"
																					class="col-md-4 col-form-label text-md-right">Tên
																					đăng nhập:</label>
																				<div class="col-md-6">
																					<input type="text" id="full_name"
																						class="form-control" name="full-name"
																						value="${j.username}">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="email_address"
																					class="col-md-4 col-form-label text-md-right">
																					Mật khẩu :</label>
																				<div class="col-md-6">
																					<input type="password" id="email_address"
																						class="form-control" name="password"
																						value="${j.password}">
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="gioitinh"
																					class="col-md-4 col-form-label text-md-right">Quyền</label>
																				<div class="col-md-6">
																					<select class="form-control" id="gioitinh"
																						name="role">
																						<option value="${j.role}"><c:if
																								test="${b==0}">Admin</c:if>
																							<c:if test="${b==1}">User</c:if></option>

																						<option value="0">Admin</option>
																						<option value="1">User</option>
																					</select>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="phone_number"
																					class="col-md-4 col-form-label text-md-right">Trạng
																					thái </label>
																				<div class="col-md-6">
																					<select class="form-control" id="phone_number"
																						name="trangthai">
																						<option value="${j.status}"><c:if
																								test="${j.status==1}">Hoạt động</c:if>
																							<c:if test="${j.status==0}">Không hoạt động</c:if></option>
																						<option value="0">Không hoạt động</option>
																						<option value="1">Hoạt động</option>
																					</select>
																				</div>
																			</div>
																			<div class="form-group row">
																				<label for="present_address"
																					class="col-md-4 col-form-label text-md-right">
																					Loại tài khoản</label>
																				<div class="col-md-6">
																					<c:if test="${j.accountType==0}">
																						<input type="text" id="present_address"
																							class="form-control" name="accountType"
																							disabled="disabled" value="Admin">
																					</c:if>
																					<c:if test="${j.accountType==1}">
																						<input type="text" id="present_address"
																							class="form-control" name="accountType"
																							disabled="disabled" value="Khách hàng">
																					</c:if>
																					<c:if test="${j.accountType==2}">
																						<input type="text" id="present_address"
																							class="form-control" name="accountType"
																							disabled="disabled" value="Gia sư">
																					</c:if>

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
					<jsp:include page="modalThemGS.jsp"></jsp:include>
				</div>
				<jsp:include page="include/footer.jsp"></jsp:include>


			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>