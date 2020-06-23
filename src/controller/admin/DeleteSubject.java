package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.MonHocBO;
import model.Bean.MonHoc;

/**
 * Servlet implementation class DeleteSubject
 */
@WebServlet("/DeleteSubject")
public class DeleteSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteSubject() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = (String) request.getParameter("idMH_id");

		MonHoc monHoc = null;

		String errorString = null;
		MonHocBO khBO = new MonHocBO();

		try {
			monHoc = khBO.findMonHoc(code);
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		// Không có lỗi.
		// Sản phẩm không tồn tại để edit.
		// Redirect sang trang danh sách khach hang.
		if (errorString != null && monHoc == null) {
			response.sendRedirect(request.getServletPath() + "/ListSubject1");
			return;
		}

		// Lưu thông tin vào request attribute trước khi forward sang views.
		request.setAttribute("errorString", errorString);
		khBO.deleteMonHoc(code);
		response.sendRedirect(request.getContextPath() + "/ListSubject1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
