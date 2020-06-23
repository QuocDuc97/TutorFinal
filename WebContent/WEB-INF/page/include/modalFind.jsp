<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-dialog">

	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">Nhập từ khóa</h4>
		</div>

		<div class="modal-body">
			<form action="DisplayTutor" method="get">
				<div>
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Nhập môn cần tìm kiếm">
						<div class="input-group-append">
							<button class="btn btn-success" type="submit">Tìm kiếm</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		</div>

	</div>

</div>
