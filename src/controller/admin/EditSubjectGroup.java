package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.NhomMHBO;
import model.Bean.NhomMH;

/**
 * Servlet implementation class EditSubjectGroup
 */
@WebServlet("/EditSubjectGroup")
public class EditSubjectGroup extends HttpServlet {
	String code;
	NhomMHBO nhomMHBO = new NhomMHBO();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditSubjectGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idNMH_id");

		NhomMH nhomMH = null;

		String errorString = null;
		

		try {
			nhomMH = nhomMHBO.findNhomMH(code);
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		// Không có lỗi.
		// Sản phẩm không tồn tại để edit.
		// Redirect sang trang danh sách khach hang.
		if (errorString != null && nhomMH == null) {
			response.sendRedirect(request.getServletPath() + "/ListSubjectGroup");
			return;
		}

		// Lưu thông tin vào request attribute trước khi forward sang views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("listSubjectGroupEdit", nhomMH);

		request.getServletContext().getRequestDispatcher("/WEB-INF/admin/NhomMH/editNhomMH.jsp").forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String hoten = request.getParameter("name");
		
		NhomMH nhomMH = new NhomMH(code, hoten);
		nhomMHBO.updateNhomMH(nhomMH, code);
		response.sendRedirect(request.getContextPath() + "/ListSubjectGroup");
	}

}
