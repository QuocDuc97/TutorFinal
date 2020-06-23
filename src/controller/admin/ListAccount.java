package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.AccountBO;
import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.DAO.AccountDAO;

/**
 * Servlet implementation class ListAccount
 */
@WebServlet("/ListAccount")
public class ListAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListAccount() {
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
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {
			/*
			 * int page = 1; int recordsPerPage = 5; if (request.getParameter("page") !=
			 * null) { page = Integer.parseInt(request.getParameter("page")); } else { page
			 * = 1; }
			 * 
			 * int stt = (page - 1) * 10; request.setAttribute("stt", stt);
			 */
			/* AccountBO acBO = new AccountBO(); */
			request.setAttribute("listAcc", new AccountDAO().listAccount());
			/*
			 * request.setAttribute("currentPage", page); request.setAttribute("listClass",
			 * lopBO.getListClass((page - 1) * recordsPerPage, recordsPerPage));
			 * request.setAttribute("noOfPages", (int) Math.ceil(lopBO.getNoOfRecords() *
			 * 1.0 / recordsPerPage));
			 */ request.getRequestDispatcher("/WEB-INF/admin/taikhoan.jsp").forward(request, response);
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
