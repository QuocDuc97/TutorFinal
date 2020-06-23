package controller.admin;

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
import model.Bean.GiaSu;

@WebServlet("/ListTutor")
public class ListTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListTutor() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String errorString = null;
		String notification = null;
		List<GiaSu> listGS = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("WEB-INF/page/login.jsp").forward(request, response);

		} else {
			int page = 1;
			int recordsPerPage = 5;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			GiaSuBO gsBO = new GiaSuBO();
			listGS = gsBO.listTutor((page - 1) * recordsPerPage, recordsPerPage);
			int noOfRecords = gsBO.getNoOfRecordsTutor();
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			if (listGS != null) {
				request.setAttribute("listGS", listGS);
				request.setAttribute("currentPage", page);
				request.setAttribute("noOfPages", noOfPages);
				notification = "load du lieu thanh cong";
				request.setAttribute("notification", notification);
				request.getServletContext().getRequestDispatcher("/WEB-INF/admin/danhsachGiaSu.jsp").forward(request,
						response);
			} else {
				errorString = "khong co du lieu de hien thi";
				request.setAttribute("error", errorString);
				System.out.println("list khach hang null roi may aj");
				RequestDispatcher dispatcher = request.getServletContext()
						.getRequestDispatcher("/WEB-INF/admin/Tutor/listTutor.jsp");
				dispatcher.forward(request, response);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
