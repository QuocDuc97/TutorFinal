package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.TinNhanBO;
import model.Bean.Account;

/**
 * Servlet implementation class DashboardCustomer
 */
@WebServlet("/DashboardCustomer")
public class DashboardCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DashboardCustomer() {
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

			TinNhanBO tnBO = new TinNhanBO();
			request.setAttribute("listMessenger", tnBO.getListMessenger(u.getId()));
			request.setAttribute("length", tnBO.getListMessenger(u.getId()).size());
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/customer/indexCustomer.jsp");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
