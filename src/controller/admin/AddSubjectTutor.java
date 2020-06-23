package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.MonHocBO;
import model.Bean.Account;

/**
 * Servlet implementation class AddSubjectTutor
 */
@WebServlet("/AddSubjectTutor")
public class AddSubjectTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSubjectTutor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
