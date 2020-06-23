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
 * Servlet implementation class DeleteSubjectGroup
 */
@WebServlet("/DeleteSubjectGroup")
public class DeleteSubjectGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteSubjectGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("idNMH_id");

		NhomMH nhomMH = null;

		String errorString = null;
		NhomMHBO nhomMHBO = new NhomMHBO();

		try {
			nhomMH = nhomMHBO.findNhomMH(code);
			if (nhomMH != null) {
				nhomMHBO.deleteNhomMH(code);
				response.sendRedirect(request.getContextPath() + "/ListSubjectGroup");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
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
