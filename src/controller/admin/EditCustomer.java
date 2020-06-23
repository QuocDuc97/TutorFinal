package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.KhachHangBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.Bean.KhachHang;
import model.DAO.AccountDAO;

@WebServlet("/EditCustomer")
public class EditCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code;

	public EditCustomer() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idKH_id");
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("/LoginUserServlet").forward(request, response);

		} else {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			session.setAttribute("account", u);
			KhachHang customer = null;
			String errorString = null;
			KhachHangBO khBO = new KhachHangBO();
			try {
				customer = khBO.findCustomer(code);
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}

			if (errorString != null && customer == null) {
				response.sendRedirect(request.getServletPath() + "/listCustomer");
				return;
			}

			// LÆ°u thÃ´ng tin vÃ o request attribute trÆ°á»›c khi forward sang views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("listCustomerEdit", customer);
			TinNhanBO tnBO = new TinNhanBO();
			System.out.println("so phan tu là" + tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("length", tnBO.getListMessenger(u.getId()).size());
			request.setAttribute("listMessenger", tnBO.getListMessenger(u.getId()));
			request.getServletContext().getRequestDispatcher("/WEB-INF/customer/editCustomer.jsp").forward(request,
					response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String hoten = request.getParameter("full-name");
		String email = request.getParameter("email-address");
		String gioitinh = request.getParameter("gender");
		String sodienthoai = request.getParameter("phone_number");
		String diachi = request.getParameter("student_address");

		System.out.println("hoten:" + hoten);
		System.out.println("email:" + email);
		System.out.println("gioitinh:" + gioitinh);
		System.out.println("SDT:" + sodienthoai);
		System.out.println("Dia chi:" + diachi);

		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("account") != null) {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			AccountDAO acBO = new AccountDAO();
			KhachHangBO khBO = new KhachHangBO();
			/* request.getSession().removeAttribute("customer"); */
			KhachHang kh = new KhachHang(code, hoten, email, gioitinh, sodienthoai, diachi);
			/*
			 * session.setAttribute("customer", kh); String username =
			 * request.getParameter("username"); String password =
			 * request.getParameter("password"); acBO.updateUsername(username, password,
			 * u.getId()); khBO.updateCustomer(kh, kh.getIdKH());
			 * System.out.println("username:" + username); System.out.println("password:" +
			 * password);
			 */
			khBO.updateCustomer(kh, code);
			if (Integer.parseInt(u.getRole()) == 0) {
				response.sendRedirect(request.getContextPath() + "/DashboardAdmin");
			} else if (Integer.parseInt(u.getRole()) == 1) {
				response.sendRedirect(request.getContextPath() + "/DashboarCustomer");
			}

		} else {

			response.sendRedirect(request.getContextPath() + "/LoginUserServlet");
		}
	}
}
