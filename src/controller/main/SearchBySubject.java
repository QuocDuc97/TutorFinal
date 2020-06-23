package controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.GiaSuBO;
import model.BO.MonHocBO;
import model.Bean.GiaSu;

/**
 * Servlet implementation class SearchBySubject
 */
@WebServlet("/SearchBySubject")
public class SearchBySubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchBySubject() {
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
		String gender = request.getParameter("sub");
		System.out.println("gioi tinh truyen vao la" + gender);
		String errorString = null;
		String notification = null;
		List<GiaSu> listGS = null;
		GiaSuBO gsBO = new GiaSuBO();
		listGS = gsBO.searchBySubject(gender);
		if (listGS != null) {
			request.setAttribute("listGS1", listGS);
			/*
			 * notification = "load du lieu thanh cong";
			 * request.setAttribute("notification", notification);
			 */
			for (GiaSu giaSu : listGS) {
				System.out.println(giaSu.toString());
			}

			MonHocBO monHocBO = new MonHocBO();
			request.setAttribute("dsMonHoc", monHocBO.listMonHoc());
			request.getServletContext().getRequestDispatcher("/WEB-INF/tutor/listTutor.jsp").forward(request, response);

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
