<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="menu-bar">
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<div class="logo">
				<a class="navbar-brand" href="home">Gia sư trực tuyến</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a class="nav-link" data-toggle="modal"
						data-target="#myModalFind" href="#">Tìm kiếm <i
							class="fa fa-search" aria-hidden="true"></i></a></li>
					<li class="nav-item"><a class="nav-link"
						href="RegisterUserServlet">Trở thành gia sư</a></li>
					<li class="nav-item"><a class="nav-link"
						href="home#site-stats">Về chúng tôi</a></li>
					<c:choose>
						<c:when test="${sessionScope.account == null}">

							<li class="nav-item"><a class="nav-link"
								href="LoginUserServlet">Đăng nhập</a></li>
						</c:when>
						<c:otherwise>
							<c:if test="${sessionScope.account.id.startsWith('K')}">
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="modal" data-target="#myAddClassForCustomer">Tạo
										lớp</a></li>
							</c:if>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Tài khoản</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item disabled" href="#" aria-disabled="true"><c:out
											value="${sessionScope.account.id}" /> <span
										style="float: right;"><i class="fa fa-user"
											aria-hidden="true"></i></span></a>
									<div class="dropdown-divider"></div>
									<c:choose>
										<c:when test="${sessionScope.account.id.startsWith('K')}">
											<a class="dropdown-item" href="#" data-toggle="modal"
												data-target="#myEditProfileStudent">Profile</a>
											<a class="dropdown-item"
												href="displayAddByCustomer?idKH=${sessionScope.account.id}">Các
												lớp đã tạo</a>
										</c:when>
										<c:when test="${sessionScope.account.id.startsWith('G')}">
											<a class="dropdown-item" href="#" data-toggle="modal"
												data-target="#myEditProfileGS">Hồ Sơ</a>
										</c:when>
									</c:choose>
									<a class="dropdown-item" href="LogoutServlet"> Đăng xuất <span
										style="float: right;"><i class="fa fa-sign-out"
											aria-hidden="true"></i></span>
									</a>
								</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<%-- <div class="modal" id="myEditProfileGS">
		<jsp:include page="modalTutor.jsp"></jsp:include>
	</div>
	<!-- modalEditstudent -->
	<div class="modal" id="myEditProfileStudent">
		<jsp:include page="modalCustomer.jsp"></jsp:include>
	</div>

	<div class="modal" id="myAddClassForCustomer">
		<jsp:include page="modalAddClass.jsp"></jsp:include>
	</div>
- --%>
	<div class="modal" id="myModalFind">
		<jsp:include page="modalFind.jsp"></jsp:include>
	</div>


</div>