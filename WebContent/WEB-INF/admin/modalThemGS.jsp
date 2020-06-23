<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<!-- Modal Header -->
		<div class="modal-header">
			<h1 class="modal-title text-center" style="font-size: 1.7rem">Thêm
				mới Gia sư</h1>
			<button type="button" class="close" data-dismiss="modal">×</button>
		</div>

		<!-- Modal body -->
		<form action="AddTutor1" method="post" enctype="multipart/form-data"
			id="validationform" data-parsley-validate="" novalidate=""
			class="needs-validation">
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
						<label for="user_name"
							class="col-md-4 col-form-label text-md-right">Tên tài
							khoản:</label>
						<div class="col-md-6">
							<input type="text" id="user_name" class="form-control"
								name="username" required="required">
						</div>
					</div>
					<div class="form-group row">
						<label for="password"
							class="col-md-4 col-form-label text-md-right">Mật khẩu:</label>
						<div class="col-md-6">
							<input type="password" id="password" class="form-control"
								name="password" value="" required="required">
						</div>
					</div>
					<div class="form-group row">
						<label for="email_address"
							class="col-md-4 col-form-label text-md-right">Email:</label>
						<div class="col-md-6">
							<input type="email" required="" data-parsley-type="email"
								placeholder="Enter a valid e-mail" class="form-control"
								name="email-address">
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Vui lòng nhập đúng định dạng
								abc@xyzcom.</div>
						</div>
					</div>


					<div class="form-group row">
						<label for="image" class="col-md-4 col-form-label text-md-right">Image
							:</label>
						<div class="col-md-6">
							<div class="custom-file mb-3">
								<input type="file" class="custom-file-input" id="customFile"
									name="photo"> <label class="custom-file-label"
									for="customFile">File Input</label>
							</div>
						</div>
					</div>



					<c:set var="gender" value="${sessionScope.customer.gioiTinh}" />
					<div class="form-group row">
						<label for="gioitinh"
							class="col-md-4 col-form-label text-md-right">Giới tính</label>
						<div class="col-md-6">
							<label class="custom-control custom-radio custom-control-inline">
								<input type="radio" name="gender" checked=""
								class="custom-control-input" value="Female"><span
								class="custom-control-label">Female</span>
							</label> <label class="custom-control custom-radio custom-control-inline">
								<input type="radio" name="gender" class="custom-control-input"
								value="Male"><span class="custom-control-label">Male</span>
							</label>
						</div>
					</div>
					<div class="form-group row">
						<label for="phone_number"
							class="col-md-4 col-form-label text-md-right">Số điện
							thoại</label>
						<div class="col-md-6">
							<input type="text" id="phone_number" class="form-control"
								value="" name="phone_number" required="required">
						</div>
					</div>


					<div class="form-group row">
						<label for="phone_number1"
							class="col-md-4 col-form-label text-md-right">Price</label>
						<div class="col-md-6">
							<input type="number" id="phone_number1" class="form-control"
								value="" name="hocPhi" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label for="present_address"
							class="col-md-4 col-form-label text-md-right"> Địa chỉ:</label>
						<div class="col-md-6">
							<textarea id="student_address" class="form-control"
								name="student_address" required="required"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label for="address" class="col-md-4 col-form-label text-md-right">Công
							việc: </label>
						<div class="col-md-6">
							<select class="form-control" id="address" name="nghenghiep">
								<option value="Sinh viên">Sinh viên</option>
								<option value="Đã đi làm">Đã đi làm</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="present_address3"
							class="col-md-4 col-form-label text-md-right"> Mô tả:</label>
						<div class="col-md-6">
							<textarea id="student_address3" class="form-control" name="moTa"></textarea>
						</div>
					</div>


				</div>
			</div>

			<!-- Modal footer student -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Thêm mới</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
			</div>
		</form>
	</div>
</div>
<script>
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>