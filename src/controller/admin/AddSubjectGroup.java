package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.NhomMHBO;
import model.Bean.NhomMH;

/**
 * Servlet implementation class AddSubjectGroup
 */
@WebServlet("/AddSubjectGroup")
public class AddSubjectGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSubjectGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); if
		 * (session.getAttribute("account") == null) { request.setAttribute("error",
		 * "Bạn chưa đăng nhập ");
		 * request.getRequestDispatcher("LoginUserServlet").forward(request, response);
		 * 
		 * } else { RequestDispatcher dispatcher = request.getServletContext()
		 * .getRequestDispatcher("/WEB-INF/admin/NhomMH/addNhomMH.jsp");
		 * dispatcher.forward(request, response); }
		 */
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
		String hoten = request.getParameter("full-name");
		System.out.println("tesst ho ten" + hoten);
		NhomMHBO mhBO = new NhomMHBO();
		String maNMh = mhBO.sinhMaNhomMH();
		NhomMH a = new NhomMH(maNMh, hoten);
		mhBO.insertNhomMH(a);
		response.sendRedirect(request.getContextPath() + "/ListSubjectGroup");

	}

}
