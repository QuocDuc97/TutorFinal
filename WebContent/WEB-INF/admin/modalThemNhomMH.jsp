<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<!-- Modal Header -->
		<div class="modal-header">
			<h1 class="modal-title text-center" style="font-size: 1.7rem">Thêm
				mới nhóm môn học</h1>
			<button type="button" class="close" data-dismiss="modal">×</button>
		</div>

		<!-- Modal body -->

		<form action="AddSubjectGroup" method="post">
			<div class="modal-body">
				<div class="container">
					<div class="form-group row">
						<label for="full_name"
							class="col-md-4 col-form-label text-md-right">Tên nhóm
							môn học:</label>
						<div class="col-md-6">
							<input type="text" id="full_name" class="form-control"
								name="full-name">
						</div>
					</div>
				</div>
				<!-- Modal footer student -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Thêm mới</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</form>
	</div>
</div>
