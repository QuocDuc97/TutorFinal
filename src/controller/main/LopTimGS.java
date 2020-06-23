package controller.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.LopBO;
import model.BO.MonHocBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.DAO.AccountDAO;

/**
 * Servlet implementation class LopTimGS
 */
@WebServlet("/LopTimGS")
public class LopTimGS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LopTimGS() {
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
			session.setAttribute("accountTutor", u);

			TinNhanBO tnBO = new TinNhanBO();
			System.out.println("so phan tu là" + tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("length", tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("listMessenger", tnBO.getListMessenger(u.getId()));
			int page = 1;
			int recordsPerPage = 6;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			LopBO lopBO = new LopBO();
			int noOfRecords = lopBO.getNoOfRecordsNotReceive();
			System.out.println(noOfRecords);
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			System.out.println("noOfPages" + noOfPages);
			request.setAttribute("currentPage", page);
			request.setAttribute("listClass",
					lopBO.getListClassNotReceive((page - 1) * recordsPerPage, recordsPerPage));
			request.setAttribute("noOfPages", noOfPages);

			MonHocBO monHocBO = new MonHocBO();
			request.setAttribute("dsMonHoc", monHocBO.listMonHoc());

			request.getServletContext().getRequestDispatcher("/WEB-INF/tutor/lopCanGiaSu.jsp").forward(request,
					response);

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
