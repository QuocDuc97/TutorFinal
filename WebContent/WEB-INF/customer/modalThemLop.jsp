<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<!-- Modal Header -->
		<div class="modal-header">
			<h1 class="modal-title text-center" style="font-size: 1.7rem">Thêm
				mới môn học</h1>
			<button type="button" class="close" data-dismiss="modal">×</button>
		</div>

		<!-- Modal body -->

		<form action="AddClass" method="post">
			<div class="modal-body">
				<div class="container">
					<div class="form-group row">
						<label for="full_name"
							class="col-md-4 col-form-label text-md-right">Họ và tên:</label>
						<div class="col-md-6">
							<input type="text" id="full_name" class="form-control"
								name="full-name">
						</div>
					</div>
					<div class="form-group row">
						<label for="email_address"
							class="col-md-4 col-form-label text-md-right">Môn học:</label>
						<div class="col-md-6">
							<select class="form-control" id="email_address" name="subject">
								<c:forEach items="${listmonhoc}" var="a">
									<option value="${a.idMH}">${a.tenMH}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="gioitinh"
							class="col-md-4 col-form-label text-md-right">Cấp độ</label>
						<div class="col-md-6">
							<select class="form-control" id="gioitinh" name="level">
								<c:forEach items="${listlevel}" var="b">
									<option value="${b.idLevel}">${b.levelName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<!-- <div class="form-group row">
						<label for="phone_number"
							class="col-md-4 col-form-label text-md-right">Trạng thái
						</label>
						<div class="col-md-6">
							<input type="text" id="phone_number" class="form-control"
								name="trangThai">
						</div>
					</div> -->

					<div class="form-group row">
						<label for="present_address"
							class="col-md-4 col-form-label text-md-right"> Địa chỉ:</label>
						<div class="col-md-6">
							<textarea id="student_address" class="form-control"
								name="student_address"></textarea>
						</div>
					</div>

					<div class="form-group row">
						<label for="moTa" class="col-md-4 col-form-label text-md-right">
							Mô tả:</label>
						<div class="col-md-6">
							<textarea id="moTa" class="form-control" name="moTa"></textarea>
						</div>
					</div>

					<div class="form-group row">
						<label for="hocPhi" class="col-md-4 col-form-label text-md-right">
							Học Phí (VND/buổi):</label>
						<div class="col-md-6">
							<input type="number" id="hocPhi" class="form-control"
								name="hocPhi" value="">
						</div>
					</div>

					<div class="form-group row">
						<label for="yeuCau" class="col-md-4 col-form-label text-md-right">
							Yêu cầu:</label>
						<div class="col-md-6">
							<textarea id="yeuCau" class="form-control" name="yeuCau"></textarea>
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