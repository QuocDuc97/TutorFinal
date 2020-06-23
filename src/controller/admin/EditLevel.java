package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.LevelBO;
import model.Bean.Level;

/**
 * Servlet implementation class EditLevel
 */
@WebServlet("/EditLevel")
public class EditLevel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String code;
	private LevelBO levelBO = new LevelBO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditLevel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idLevel_id");

		Level level = null;

		String errorString = null;

		try {
			level = levelBO.findLevel(code);
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		// Không có lỗi.
		// Sản phẩm không tồn tại để edit.
		// Redirect sang trang danh sách khach hang.
		if (errorString != null && level == null) {
			response.sendRedirect(request.getServletPath() + "/ListLevel");
			return;
		}

		// Lưu thông tin vào request attribute trước khi forward sang views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("listLevelEdit", level);
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/admin/Level/editLevel.jsp");
		dispatcher.forward(request, response);
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
		String levelName = request.getParameter("name");
		Level a = new Level(code, levelName);
		levelBO.updateLevel(a, code);
		response.sendRedirect(request.getContextPath() + "/ListLevel");
	}

}
