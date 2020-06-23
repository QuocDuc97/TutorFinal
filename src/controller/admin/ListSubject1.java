package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

/**
 * Servlet implementation class ListSubject1
 */
@WebServlet("/ListSubject1")
public class ListSubject1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListSubject1() {
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
		String errorString = null;
		String notification = null;
		List<MonHoc> listMH = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {
			MonHocBO monHocBO = new MonHocBO();
			listMH = monHocBO.listMonHoc();
			NhomMHBO nhomMHBO = new NhomMHBO();
			ArrayList<NhomMH> listNhomMH = nhomMHBO.listNhomMH();
			request.setAttribute("listNhomMH", listNhomMH);
			if (listMH != null) {
				request.setAttribute("listSubject", listMH);
				notification = "load du lieu thanh cong";
				System.out.println(notification);
				request.setAttribute("notification", notification);
				request.getRequestDispatcher("/WEB-INF/admin/monHoc.jsp").forward(request, response);

			} /*
				 * else { errorString = "khong co du lieu de hien thi";
				 * System.out.println("bị lỗi rồi bạn hi�?n"); request.setAttribute("error",
				 * errorString); System.out.println("list khach hang null roi may aj");
				 * RequestDispatcher dispatcher = request.getServletContext()
				 * .getRequestDispatcher("/WEB-INF/admin/Subject/listSubject.jsp");
				 * dispatcher.forward(request, response); }
				 */
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
