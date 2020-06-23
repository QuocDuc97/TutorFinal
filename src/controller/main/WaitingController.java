package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.GiaSuBO;
import model.BO.KhachHangBO;
import model.Bean.Account;

/**
 * Servlet implementation class WaitingController
 */
@WebServlet("/waiting")
public class WaitingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WaitingController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			session.setAttribute("account", u);
			if (Integer.parseInt(u.getRole()) == 0) {
				response.sendRedirect(request.getContextPath() + "/DashboardAdmin");
			} else if (Integer.parseInt(u.getAccountType()) == 2) {
				response.sendRedirect(request.getContextPath() + "/DashboardTutor");
			} else if (Integer.parseInt(u.getAccountType()) == 1) {
				response.sendRedirect(request.getContextPath() + "/DashboardCustomer");
			}

		} else {
			response.sendRedirect(request.getContextPath() + "/LoginUserServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
