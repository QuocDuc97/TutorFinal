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
							<h2 class="pageheader-title">General Tables</h2>
							<p class="pageheader-text">Proin placerat ante duiullam
								scelerisque a velit ac porta, fusce sit amet vestibulum mi.
								Morbi lobortis pulvinar quam.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Dashboard</a></li>
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">Tables</a></li>
										<li class="breadcrumb-item active" aria-current="page">General
											Tables</li>
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
							<h2 class="card-header card-header-primary">
								Xin chào 
								<c:out value="${sessionScope.account.username}"></c:out>
							</h2>

						</div>


					</div>

					<jsp:include page="include/footer.jsp"></jsp:include>


				</div>
				<!--end dashboard-wrapper -->


			</div>
			<jsp:include page="include/js.jsp"></jsp:include>