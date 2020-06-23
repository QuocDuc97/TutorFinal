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

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.Bean.MonHoc;

/**
 * Servlet implementation class ListClassReceive
 */
@WebServlet("/ListClassReceive")
public class ListClassReceive extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListClassReceive() {
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
			int page = 1;
			int recordsPerPage = 5;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}

			int stt = (page - 1) * 10;
			request.setAttribute("stt", stt);
			MonHocBO monBO = new MonHocBO();
			LevelBO levelBO = new LevelBO();

			ArrayList<MonHoc> arr = monBO.listMonHoc();
			for (MonHoc monHoc : arr) {
				System.out.println(arr.toString());
			}
			request.setAttribute("monhoc", monBO.listMonHoc());
			request.setAttribute("level", levelBO.listLevel());
			LopBO lopBO = new LopBO();
			request.setAttribute("currentPage", page);
			request.setAttribute("listClass", lopBO.getListClassReceive((page - 1) * recordsPerPage, recordsPerPage));
			request.setAttribute("noOfPages",
					(int) Math.ceil(lopBO.getNoOfRecordsListClassReceive() * 1.0 / recordsPerPage));
			request.getRequestDispatcher("/WEB-INF/admin/lopDaNhan.jsp").forward(request, response);
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
