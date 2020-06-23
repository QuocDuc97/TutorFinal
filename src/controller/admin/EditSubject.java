package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.MonHocBO;
import model.BO.NhomMHBO;
import model.Bean.MonHoc;
import model.Bean.NhomMH;

/**
 * Servlet implementation class EditSubject
 */
@WebServlet("/EditSubject")
public class EditSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditSubject() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idMH_id");

		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {
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
				response.sendRedirect(request.getServletPath() + "/ListSubject");
				return;
			}

			// Lưu thông tin vào request attribute trước khi forward sang views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("listSubjectEdit", monHoc);
			NhomMHBO nhomMHBO = new NhomMHBO();
			ArrayList<NhomMH> listNhomMH = nhomMHBO.listNhomMH();
			request.setAttribute("listNhomMH", listNhomMH);
			System.out.println(monHoc.toString());
			request.getServletContext().getRequestDispatcher("/WEB-INF/admin/Subject/editSubject.jsp").forward(request,
					response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id_nhom = request.getParameter("nghenghiep");
		System.out.println(name);
		System.out.println(id_nhom);
		MonHocBO monHocBO = new MonHocBO();
//		NhomMHBO nhomMH = new NhomMHBO();
//		NhomMH nhomMh = nhomMH.findNhomMH(id_nhom);
		System.out.println(code);
//		MonHoc mh = new MonHoc(code, name, nhomMh);
		monHocBO.updateMonHoc(code, id_nhom, name);
		response.sendRedirect(request.getContextPath() + "/ListSubject");
	}

}
