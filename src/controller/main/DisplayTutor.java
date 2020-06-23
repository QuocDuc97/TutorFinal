package controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.GiaSuBO;
import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.Bean.GiaSu;

/**
 * Servlet implementation class DisplayTutor
 */
@WebServlet("/DisplayTutor")
public class DisplayTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisplayTutor() {
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
		List<GiaSu> listGS = null;
		GiaSuBO gsBO = new GiaSuBO();

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
			int recordsPerPage = 9;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}

			int stt = (page - 1) * 10;
			/*
			 * request.setAttribute("stt", stt); MonHocBO monBO = new MonHocBO(); LevelBO
			 * levelBO = new LevelBO(); request.setAttribute("monhoc", monBO.listMonHoc());
			 * request.setAttribute("level", levelBO.listLevel());
			 */
			MonHocBO monHocBO = new MonHocBO();
			request.setAttribute("dsMonHoc", monHocBO.listMonHoc());

			request.setAttribute("currentPage", page);
			request.setAttribute("listGS1", gsBO.listTutor((page - 1) * recordsPerPage, recordsPerPage));
			request.setAttribute("noOfPages", (int) Math.ceil(gsBO.getNoOfRecordsTutor() * 1.0 / recordsPerPage));
			request.getServletContext().getRequestDispatcher("/WEB-INF/tutor/listTutor.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/LoginUserServlet").forward(request, response);
		}
	}

	/*
	 * else { errorString = "khong co du lieu de hien thi";
	 * request.setAttribute("error", errorString);
	 * System.out.println("list khach hang null roi may aj"); RequestDispatcher
	 * dispatcher = request.getServletContext()
	 * .getRequestDispatcher("/WEB-INF/admin/Tutor/listTutor.jsp");
	 * dispatcher.forward(request, response); }
	 */
	/* } */

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
