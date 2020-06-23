package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.GiaSuBO;
import model.Bean.GiaSu;

/**
 * Servlet implementation class DeleteTutor
 */
@WebServlet("/DeleteTutor")
public class DeleteTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteTutor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idGS_id");

		GiaSu giasu = null;

		String errorString = null;
		GiaSuBO gsBO = new GiaSuBO();

		try {
			giasu = gsBO.findTutor(code);
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		// Không có lỗi.
		// Sản phẩm không tồn tại để edit.
		// Redirect sang trang danh sách khach hang.
		if (errorString != null && giasu == null) {
			response.sendRedirect(request.getServletPath() + "/ListTutor");
			return;
		} else {

			gsBO.deleteTutor(code);

			request.getServletContext().getRequestDispatcher("/ListTutor").forward(request,
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
