package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.NhomMHBO;
import model.Bean.NhomMH;

/**
 * Servlet implementation class ListSubjectGroup
 */
@WebServlet("/ListSubjectGroup")
public class ListSubjectGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListSubjectGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String errorString = null;
		String notification = null;
		List<NhomMH> listNMH = null;
		NhomMHBO nMHBO = new NhomMHBO();
		listNMH = nMHBO.listNhomMH();
		if (listNMH != null) {
			request.setAttribute("listSubjectGroup", listNMH);
			notification = "load du lieu thanh cong";
			request.setAttribute("notification", notification);
			request.getServletContext().getRequestDispatcher("/WEB-INF/admin/nhomMH.jsp").forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
