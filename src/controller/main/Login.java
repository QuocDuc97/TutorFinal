package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.AccountBO;
import model.BO.GiaSuBO;
import model.BO.KhachHangBO;
import model.Bean.Account;
import model.Bean.GiaSu;
import model.Bean.KhachHang;
import model.DAO.AccountDAO;
import util.Constant;

/**
 * Servlet implementation class LoginUserServlet
 */
@WebServlet("/LoginUserServlet")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("account") != null) {
			response.sendRedirect(request.getContextPath() + "/waiting");
			return;
		}
		// Check cookie
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					session = request.getSession(true);
					session.setAttribute("username", cookie.getValue());
					response.sendRedirect(request.getContextPath() + "/waiting");
					return;
				}
			}
		}
		request.getRequestDispatcher("WEB-INF/page/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("checkbox");
		System.out.println(username);
		System.out.println(password);
		boolean isRememberMe = false;
		if ("on".equals(remember)) {
			isRememberMe = true;

		}
		String alertMsg = "";
		if (username.isEmpty() || password.isEmpty()) {
			alertMsg = "Username and password không được bỏ trống!";
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("WEB-INF/page/login2.jsp").forward(request, response);

		}
		AccountDAO accDao = new AccountDAO();

		Account user = accDao.checkLogin(username, password);
		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("account", user);
			KhachHangBO khBO = new KhachHangBO();
			GiaSuBO gsBO = new GiaSuBO();
			if (khBO.findCustomer(user.getId()) != null) {
				session.setAttribute("customer", khBO.findCustomer(user.getId()));
			} else if (gsBO.findTutor(user.getId()) != null) {
				session.setAttribute("tutor", gsBO.findTutor(user.getId()));
			}
			if (isRememberMe) {
				saveRememberMe(response, username);
			}

			response.sendRedirect(request.getContextPath() + "/waiting");

		} else {
			alertMsg = "Username or password isn't correct";
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("WEB-INF/page/login.jsp").forward(request, response);

		}

	}

	private void saveRememberMe(HttpServletResponse response, String username) {
		Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
		cookie.setMaxAge(30 * 60);
		response.addCookie(cookie);

	}

}
