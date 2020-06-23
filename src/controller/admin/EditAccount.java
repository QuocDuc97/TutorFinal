package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.AccountBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.DAO.AccountDAO;

/**
 * Servlet implementation class EditAccount
 */
@WebServlet("/EditAccount")
public class EditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idAC");
		System.out.println(code);

		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			session.setAttribute("accountTutor", u);

			TinNhanBO tnBO = new TinNhanBO();
			System.out.println("so phan tu là" + tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("length", tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("listMessenger", tnBO.getListMessenger(u.getId()));
			AccountDAO acBO = new AccountDAO();
			Account ac = acBO.findAccount(code);
			if (ac == null) {
				System.out.println("khong lay dc du lieu");
			}
			request.setAttribute("editAccount", ac);

			request.getServletContext().getRequestDispatcher("/WEB-INF/tutor/editPassword.jsp").forward(request,
					response);
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
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordR = request.getParameter("passR");
		String alertMsg = null;
		if (password.equals(passwordR) == false) {
			alertMsg = "Mật khẩu không trùng khớp";
			request.setAttribute("alert", alertMsg);

			response.sendRedirect("EditAccount?idAC=" + id + "");

		}
		AccountDAO acBO = new AccountDAO();
		System.out.println("teen dang nhap la " + username);
		System.out.println("mk " + password);
		System.out.println("id dang nhap la " + id);
		Account ac = acBO.findAccount(id);
		System.out.println(ac.toString());
		acBO.updateUsername(username, password, id);
		if (id.startsWith("G")) {
			request.getRequestDispatcher("/DashboardTutor").forward(request, response);
		} else if (id.startsWith("K")) {
			request.getRequestDispatcher("/DashboardCustomer").forward(request, response);
		}

	}

}
