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
										<li class="breadcrumb-item active" aria-current="page">Thay
											đổi mật khẩu</li>
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
							<h5 class="card-header">Thay đổi mật khẩu</h5>
							<div class="card-body">
								<c:if test="${not empty editAccount}" var="j">
									<form id="validationform" data-parsley-validate=""
										novalidate="" method="post" action="EditAccount"
										class="needs-validation" onsubmit="return validateForm()">
										<input name="id" value="${editAccount.id}" hidden="">
										<div class="form-group row">
											<label class="col-12 col-sm-3 col-form-label text-sm-right">Tên
												đăng nhập</label>
											<div class="col-12 col-sm-8 col-lg-6">
												<input type="text" required="" placeholder="Type something"
													class="form-control" name="username"
													value="${editAccount.username}">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-12 col-sm-3 col-form-label text-sm-right">Nhập
												mật khẩu mới</label>
											<div class="col-sm-4 col-lg-3 mb-3 mb-sm-0">
												<input id="pw" type="password" required="required"
													placeholder="nhập mật khẩu mới" class="form-control"
													name="password">
												<div class="valid-feedback">Valid.</div>
												<div class="invalid-feedback">Vui lòng nhập mật khẩu
													mới.</div>
											</div>
											<div class="col-sm-4 col-lg-3">
												<input type="password" required="" id="passR"
													data-parsley-equalto="#pw" parsley-required="true"
													placeholder="Nhập lại mật khẩu mới" class="form-control"
													onChange="isPasswordMatch();" name="passR">
												<div class="valid-feedback">Valid.</div>

												<c:if test="${not empty alert}">
													<div class="invalid-feedback" id="divCheckPassword">
														<c:out value="${requestScope.alert}"></c:out>
													</div>
												</c:if>


											</div>
										</div>
										<div class="form-group row text-right">
											<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
												<input type="submit" class="btn btn-space btn-primary"
													value="Submit">
												<button class="btn btn-space btn-secondary">Cancel</button>
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
		<script src="assets/vendor/parsley/parsley.js"></script>
		<script>
			$('#validationform').parsley();

			function validateForm() {
				var password = $("#pass2").val();
				var confirmPassword = $("#passR").val();

				if (password != confirmPassword)
					$("#divCheckPassword").html("Mật khẩu không trùng khớp!");
				else
					$("#divCheckPassword").html("Mật khẩu trùng khớp.");
			}

			$(document).ready(function() {
				$("#passR").onchange = function() {
					validateForm()
				};
			});
		</script>
		<script type="text/javascript">
			// Example starter JavaScript for disabling form submissions if there are invalid fields
			(function() {
				'use strict';
				window
						.addEventListener(
								'load',
								function() {
									// Fetch all the forms we want to apply custom Bootstrap validation styles to
									var forms = document
											.getElementsByClassName('needs-validation');
									// Loop over them and prevent submission
									var validation = Array.prototype.filter
											.call(
													forms,
													function(form) {
														form
																.addEventListener(
																		'submit',
																		function(
																				event) {
																			if (form
																					.checkValidity() === false) {
																				event
																						.preventDefault();
																				event
																						.stopPropagation();
																			}
																			form.classList
																					.add('was-validated');
																		},
																		false);
													});
								}, false);
			})();
		</script>
		<jsp:include page="include/js.jsp"></jsp:include>