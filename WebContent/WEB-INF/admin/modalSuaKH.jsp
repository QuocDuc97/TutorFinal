<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<!-- Modal Header -->
		<div class="modal-header">
			<h1 class="modal-title text-center" style="font-size: 1.7rem">Sửa
				thông tin khách hàng</h1>
			<button type="button" class="close" data-dismiss="modal">×</button>
		</div>

		<!-- Modal body -->

		<form action="AddCustomer" method="post">
			<div class="modal-body">
				<div class="container">
					<div class="form-group row">
						<label for="full_name"
							class="col-md-4 col-form-label text-md-right">Họ và tên:</label>
						<div class="col-md-6">
							<input type="text" id="full_name" class="form-control"
								name="full-name" value="${j.hoTen}">
						</div>
					</div>
					<div class="form-group row">
						<label for="email_address"
							class="col-md-4 col-form-label text-md-right">Email:</label>
						<div class="col-md-6">
							<input type="text" id="email_address" class="form-control"
								name="email-address" value="${j.email}">
						</div>
					</div>
					<c:set var="gender" value="${sessionScope.customer.gioiTinh}" />
					<div class="form-group row">
						<label for="gioitinh"
							class="col-md-4 col-form-label text-md-right">Giới tính</label>
						<div class="col-md-6">
							<label class="custom-control custom-radio custom-control-inline">
								<input type="radio" name="gender" checked=""
								class="custom-control-input"><span
								class="custom-control-label">Female</span>
							</label> <label class="custom-control custom-radio custom-control-inline">
								<input type="radio" name="gender" class="custom-control-input"><span
								class="custom-control-label">Male</span>
							</label>
						</div>
					</div>
					<div class="form-group row">
						<label for="phone_number"
							class="col-md-4 col-form-label text-md-right">Số điện
							thoại</label>
						<div class="col-md-6">
							<input type="text" id="phone_number" class="form-control"
								value="${j.soDienThoai}" name="phone_number">
						</div>
					</div>

					<div class="form-group row">
						<label for="present_address"
							class="col-md-4 col-form-label text-md-right"> Địa chỉ:</label>
						<div class="col-md-6">
							<textarea id="student_address" class="form-control"
								name="student_address">${j.diaChi}</textarea>
						</div>
					</div>


				</div>
			</div>



			<!-- Modal footer student -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Update</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</form>
	</div>
</div>
