package controller.admin;

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

/**
 * Servlet implementation class AddSubject_Tutor
 */
@WebServlet("/AddSubject_Tutor")
public class AddSubject_Tutor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSubject_Tutor() {
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
			MonHocBO monBO = new MonHocBO();
			int page = 1;
			int recordsPerPage = 5;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			int stt = (page - 1) * 10;
			request.setAttribute("currentPage", page);
			request.setAttribute("noOfPages",
					(int) Math.ceil(monBO.getNoOfRecordsByTutor(u.getId()) * 1.0 / recordsPerPage));
			request.setAttribute("monHocGS",
					monBO.listMonHocByTutor(u.getId(), (page - 1) * recordsPerPage, recordsPerPage));
			request.setAttribute("listSubject", monBO.listMonHocByTutor(u.getId()));
			TinNhanBO tnBO = new TinNhanBO();
			System.out.println("so phan tu là" + tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("length", tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("listMessenger", tnBO.getListMessenger(u.getId()));
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/tutor/giaSuDayMonHoc.jsp");
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
		String tenmon = request.getParameter("subject");
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			session.setAttribute("account", u);

			MonHocBO monHocBO = new MonHocBO();
			monHocBO.insertGS_Mh(tenmon, u.getId());
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/tutor/giaSuDayMonHoc.jsp");
			dispatcher.forward(request, response);

		} else {
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/LoginUserServlet");
			dispatcher.forward(request, response);
		}
	}
}
