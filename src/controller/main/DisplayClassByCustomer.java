package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.Bean.Account;
import util.CheckLogin;

/**
 * Servlet implementation class DisplayClassByCustomer
 */
@WebServlet("/displayAddByCustomer")
public class DisplayClassByCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisplayClassByCustomer() {
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
			int page = 1;
			int recordsPerPage = 6;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			MonHocBO monBO = new MonHocBO();
			LevelBO levelBO = new LevelBO();
			request.setAttribute("monhoc1", monBO.listMonHoc());
			request.setAttribute("level1", levelBO.listLevel());
			LopBO lopBO = new LopBO();
			request.setAttribute("currentPage", page);
			request.setAttribute("noOfPages",
					(int) Math.ceil(lopBO.getNoOfRecordsByCustomer(u.getId()) * 1.0 / recordsPerPage));
			request.setAttribute("listClassAddByCustomer",
					lopBO.getListClassAddbyCustomer(u.getId(), (page - 1) * recordsPerPage, recordsPerPage));
			request.getServletContext().getRequestDispatcher("/WEB-INF/customer/lopDaTao.jsp").forward(request,
					response);
		} else {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("WEB-INF/page/login.jsp").forward(request, response);
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
