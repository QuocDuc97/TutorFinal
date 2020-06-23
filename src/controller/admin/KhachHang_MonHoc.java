package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.BO.TinNhanBO;
import model.Bean.Account;

/**
 * Servlet implementation class KhachHang_MonHoc
 */
@WebServlet("/KhachHang_MonHoc")
public class KhachHang_MonHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KhachHang_MonHoc() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			session.setAttribute("account", u);
			LopBO lopBO = new LopBO();
			int page = 1;
			int recordsPerPage = 5;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}

			request.setAttribute("currentPage", page);
			request.setAttribute("noOfPages",
					(int) Math.ceil(lopBO.getNoOfRecordsListClassByCustomer(u.getId()) * 1.0 / recordsPerPage));
			request.setAttribute("danhSachLopDangHoc",
					lopBO.getListClassByIDCustomer(u.getId(), (page - 1) * recordsPerPage, recordsPerPage));
			TinNhanBO tnBO = new TinNhanBO();
			System.out.println("so phan tu là" + tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("length", tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("listMessenger", tnBO.getListMessenger(u.getId()));
			MonHocBO monBO = new MonHocBO();
			LevelBO levelBO = new LevelBO();
			request.setAttribute("listmonhoc", monBO.listMonHoc());
			request.setAttribute("listlevel", levelBO.listLevel());
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/customer/monDangHoc.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/LoginUserServlet");
			dispatcher.forward(request, response);
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
