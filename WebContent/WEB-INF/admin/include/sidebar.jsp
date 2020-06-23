<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li class="nav-divider">Menu</li>
					<li class="nav-item "><a class="nav-link " href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-1" aria-controls="submenu-1"><i
							class="fa fa-fw fa-user-circle"></i>Tài khoản <span
							class="badge badge-success">6</span></a>
						<div id="submenu-1" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="ListAccount">Người
										dùng</a></li>
								<li class="nav-item"><a class="nav-link" href="ListAccount">Quản
										trị</a></li>
								<li class="nav-item"><a class="nav-link" href="ListAccount">Phê
										duyêt</a></li>
							</ul>
						</div></li>
					<li class="nav-divider">Thao tác</li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-6" aria-controls="submenu-6"><i
							class="fas fa-fw fa-file"></i>Bài đăng</a>
						<div id="submenu-6" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="ApprovedClass">Phê duyệt bài đăng</a></li>
								<li class="nav-item"><a class="nav-link" href="ListClass">Tất
										cả bài đăng</a></li>

							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-7" aria-controls="submenu-7"><i
							class="fas fa-users"></i>Người dùng</a>
						<div id="submenu-7" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="ListCustomer">Khách hàng</a></li>
								<li class="nav-item"><a class="nav-link" href="ListTutor">Gia
										sư</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-8" aria-controls="submenu-8"><i
							class="fas fa-fw fa-file"></i>Môn học</a>
						<div id="submenu-8" class="collapse submenu" style="">
							<ul class="nav flex-column">

								<li class="nav-item"><a class="nav-link"
									href="ListSubjectGroup">Nhóm môn học</a></li>
								<li class="nav-item"><a class="nav-link"
									href="ListSubject1">Danh sách môn học</a></li>

							</ul>
						</div></li>

					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-9" aria-controls="submenu-9"><i
							class="fas fa-address-book"></i>Lớp</a>
						<div id="submenu-9" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="ListClass">Tất
										cả các lớp</a></li>
								<li class="nav-item"><a class="nav-link"
									href="ListClassReceive">Lớp đã nhận</a></li>
								<li class="nav-item"><a class="nav-link" href="LopTimGS">Lớp
										chưa nhận</a></li>

							</ul>
						</div></li>

				</ul>
			</div>
		</nav>
	</div>
</div>