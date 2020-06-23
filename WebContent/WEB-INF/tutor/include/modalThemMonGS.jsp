<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<!-- Modal Header -->
		<div class="modal-header">
			<h1 class="modal-title text-center" style="font-size: 1.7rem">Chọn
				môn học mà bạn muốn dạy</h1>
			<button type="button" class="close" data-dismiss="modal">×</button>
		</div>

		<!-- Modal body -->
		<form action="AddSubject_Tutor" method="post">
			<div class="modal-body">
				<c:if test="${not empty listSubject}">
					<div class="container">
						<div class="form-group row">
							<label for="input-select"
								class="col-md-4 col-form-label text-md-right">Chọn môn
								học:</label>
							<div class="col-md-6">
								<select class="form-control" id="input-select" name="subject">
									<c:forEach var="j" items="${listSubject}">
										<option value="${j.idMH}">${j.tenMH}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<!-- Modal footer student -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Thêm mới</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</c:if>
			</div>
		</form>
	</div>
</div>
