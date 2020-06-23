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
							<h2 class="pageheader-title">Các lớp đang hoc</h2>
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
							<h4 class="card-header card-header-primary">Các lớp đang học</h4>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<!-- <a href="#" class="btn btn-primary"
											style="text-decoration: none; margin-top: 6%"><i
											class="fa fa-plus"></i> Thêm mới</a> -->
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
											<c:if test="${not empty danhSachLopDangHoc}">
												<c:forEach items="${danhSachLopDangHoc}" var="j">
													<tr>
														<c:set var="b" value="${b+1}"></c:set>
														<td>${b}</td>
														<td>${j.idL}</td>
														<td>${j.tenL}</td>
														<td>${j.monHoc.getTenMH()}</td>
														<td>${j.diaChi}</td>
														<td><a href="#"><i class="fas fa-eye"></i></a></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${currentPage != 1}">
											<li class="page-item"><a class="page-link"
												href="KhachHang_MonHoc?page=${currentPage - 1}">Previous</a></li>
										</c:if>
										<c:forEach begin="1" end="${noOfPages}" var="i">
											<c:choose>
												<c:when test="${currentPage eq i}">
													<li class="page-item active"><a class="page-link"
														href="KhachHang_MonHoc?page=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="KhachHang_MonHoc?page=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${currentPage lt noOfPages}">
											<li class="page-item"><a class="page-link"
												href="KhachHang_MonHoc?page=${currentPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</nav>

							</div>

						</div>
					</div>
				</div>
				<jsp:include page="include/footer.jsp"></jsp:include>
			</div>
			<!--end dashboard-wrapper -->


		</div>
		<jsp:include page="include/js.jsp"></jsp:include>