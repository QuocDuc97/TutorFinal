<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="nav-left-sidebar sidebar-dark">
	<div class="menu-list">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="d-xl-none d-lg-none" href="#">Dashboard</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav flex-column">
					<li class="nav-divider"><c:if
							test="${sessionScope.account.id.startsWith('K')}">
							<a class="nav-link" href="DashboardCustomer">Khách hàng</a>
						</c:if> <c:if test="${sessionScope.account.id.startsWith('G')}">
							<a class="nav-link" href="DashboardTutor">Gia sư</a>
						</c:if></li>
					<li class="nav-item "><a class="nav-link " href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-1" aria-controls="submenu-1"><i
							class="fa fa-fw fa-user-circle"></i>Tài khoản<span
							class="badge badge-success">6</span></a>
						<div id="submenu-1" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><c:if
										test="${sessionScope.account.id.startsWith('K')}">
										<a class="nav-link"
											href="EditCustomer?idKH_id=${sessionScope.account.id}">Cập
											nhật thông tin</a>
									</c:if> <c:if test="${sessionScope.account.id.startsWith('G')}">
										<a class="nav-link"
											href="EditTutor?idGS_id=${sessionScope.account.id}">Cập
											nhật thông tin</a>
									</c:if></li>
								<li class="nav-item"><a class="nav-link"
									href="EditAccount?idAC=${sessionScope.account.id}">Thay đổi
										mật khẩu</a></li>
							</ul>
						</div></li>
					<li class="nav-divider">Thao tác</li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-6" aria-controls="submenu-6"><i
							class="fas fa-fw fa-search"></i>Tìm kiếm</a>
						<div id="submenu-6" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="LopTimGS">Lớp
										cần gia sư</a></li>
								<li class="nav-item"><a class="nav-link"
									href="DisplayTutor">Danh sách gia sư</a></li>

							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-7" aria-controls="submenu-7"><i
							class="fas fa-users"></i>Lớp đang dạy</a>
						<div id="submenu-7" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="LopDangDay">Tất
										cả các lớp</a></li>
								<li class="nav-item"><a class="nav-link"
									href="AddSubject_Tutor">Các môn đang dạy</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>
</div>