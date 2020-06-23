<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="dashboard-header">
	<nav class="navbar navbar-expand-lg bg-white fixed-top">
		<a class="navbar-brand"> Gia sư trực tuyến</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto navbar-right-top">
				<li class="nav-item">
					<div id="custom-search" class="top-search-bar">
						<input class="form-control" type="text" placeholder="Search..">
					</div>
				</li>
				<li class="nav-item dropdown notification"><a
					class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
						class="fas fa-fw fa-bell"></i> <span class="badge">
							${length}</span></a>
					<ul class="dropdown-menu dropdown-menu-right notification-dropdown">
						<li>
							<div class="notification-title">Thông báo</div>
							<div class="notification-list">
								<div class="list-group">
									<c:forEach items="${listMessenger}" var="j">
										<a href="#"
											class="list-group-item list-group-item-action active">
											<div class="notification-info">
												<div class="notification-list-user-img">
													<img src="assets/img/account.svg" alt=""
														class="user-avatar-md rounded-circle">
												</div>
												<div class="notification-list-user-block">
													<span class="notification-list-user-name">${j.noiDung}</span>
													<div class="notification-date">${j.ngayGui}
														<span>- ${j.thoiGianGui.substring(0,5)}</span>
													</div>
												</div>
											</div>

										</a>
									</c:forEach>
								</div>
							</div>
						</li>
						<li>
							<div class="list-footer">
								<a href="#">View all notifications</a>
							</div>
						</li>
					</ul></li>
				<li class="nav-item dropdown nav-user"><a
					class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
						src="assets/img/account.svg" alt=""
						class="user-avatar-md rounded-circle"></a>
					<div class="dropdown-menu dropdown-menu-right nav-user-dropdown"
						aria-labelledby="navbarDropdownMenuLink2">
						<div class="nav-user-info">
							<h5 class="mb-0 text-white nav-user-name">
								<c:out value="${sessionScope.account.username}"></c:out>
							</h5>
							<span class="status"></span><span class="ml-2">Available</span>
						</div>
						<a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Tài
							khoản</a> <a class="dropdown-item" href="#"><i
							class="fas fa-cog mr-2"></i>Setting</a> <a class="dropdown-item"
							href="LogoutServlet"><i class="fas fa-power-off mr-2"></i>Đăng
							xuất</a>
					</div></li>
			</ul>
		</div>
	</nav>
</div>