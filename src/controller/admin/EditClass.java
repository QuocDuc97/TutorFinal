package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;

/**
 * Servlet implementation class EditClass
 */
@WebServlet("/EditClass")
public class EditClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = (String) request.getParameter("idClass");

		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {

			LopBO lopBO = new LopBO();
			MonHocBO monHoc = new MonHocBO();
			LevelBO level = new LevelBO();
			String errorString = null;
			request.setAttribute("editClass", lopBO.findClass(code));
			request.setAttribute("listMH", monHoc.listMonHoc());
			request.setAttribute("listLevel", level.listLevel());
			request.getServletContext().getRequestDispatcher("/WEB-INF/admin/Class/editClass.jsp").forward(request,
					response);

		}
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
