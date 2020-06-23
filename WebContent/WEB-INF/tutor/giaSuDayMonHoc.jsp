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
							<h5 class="card-header card-header-primary">Thông tin Gia sư</h5>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3" style="top: 50%">

										<a href="#" class="btn btn-primary" data-toggle="modal"
											data-target="#modalAddTutor"
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
												<th scope="col">Tên môn</th>
												<th scope="col">Tên nhóm</th>
												<th scope="col">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty monHocGS}">
												<c:forEach items="${monHocGS}" var="j">
													<tr>
														<c:set var="b" value="${b+1}"></c:set>
														<td>${b}</td>
														<td>${j.idMH}</td>
														<td>${j.tenMH}</td>
														<td>${j.nhomMH.getTenN()}</td>
														<td><a href="DeleteCustomer?idKH_id=${j.idMH}"
															onclick="return confirm('Bạn Có Thực Sự Muốn Xóa Không ?');">
																<i class="material-icons"><span>delete</span></i>
														</a></td>
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
												href="AddSubject_Tutor?page=${currentPage - 1}">Previous</a></li>
										</c:if>
										<c:forEach begin="1" end="${noOfPages}" var="i">
											<c:choose>
												<c:when test="${currentPage eq i}">
													<li class="page-item active"><a class="page-link"
														href="AddSubject_Tutor?page=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="AddSubject_Tutor?page=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${currentPage lt noOfPages}">
											<li class="page-item"><a class="page-link"
												href="AddSubject_Tutor?page=${currentPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</nav>
							</div>

						</div>
					</div>
				</div>
				<div class="modal" id="modalAddTutor">
					<jsp:include page="include/modalThemMonGS.jsp"></jsp:include>
				</div>


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