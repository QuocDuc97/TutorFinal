package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
import model.DAO.MonHocDAO;

@WebServlet("/AddSubject")
public class AddSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddSubject() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); if
		 * (session.getAttribute("account") == null) { request.setAttribute("error",
		 * "Bạn chưa đăng nhập ");
		 * request.getRequestDispatcher("LoginUserServlet").forward(request, response);
		 * 
		 * } else {
		 * 
		 * NhomMHBO nhomMHBO = new NhomMHBO(); ArrayList<NhomMH> listNhomMH =
		 * nhomMHBO.listNhomMH(); request.setAttribute("listNhomMH", listNhomMH);
		 * 
		 * RequestDispatcher dispatcher = request.getServletContext()
		 * .getRequestDispatcher("/WEB-INF/admin/Subject/addSubject.jsp");
		 * dispatcher.forward(request, response);
		 * 
		 * }
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("full-name");
		String id_nhom = request.getParameter("subject");
		System.out.println(name);
		System.out.println(id_nhom);
		MonHocBO monHocBO = new MonHocBO();
		NhomMHBO nhomMH = new NhomMHBO();
		NhomMH nhomMh = nhomMH.findNhomMH(id_nhom);
		MonHocDAO mh3 = new MonHocDAO();
		String maMH = mh3.sinhMaMonHoc();
		System.out.println(maMH);
		MonHoc mh = new MonHoc(maMH, name, nhomMh);
		monHocBO.insertMonHoc(mh);
		response.sendRedirect(request.getContextPath() + "/ListSubject1");

	}

}
