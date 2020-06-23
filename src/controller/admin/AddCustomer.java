package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.AccountBO;
import model.BO.KhachHangBO;
import model.Bean.Account;
import model.Bean.KhachHang;
import model.DAO.AccountDAO;

@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCustomer() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * RequestDispatcher dispatcher = request.getServletContext()
		 * .getRequestDispatcher("/WEB-INF/admin/Customer/addCustomer.jsp");
		 * dispatcher.forward(request, response);
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String hoten = request.getParameter("full-name");
		String email = request.getParameter("email-address");
		String gioitinh = request.getParameter("gender");
		String sodienthoai = request.getParameter("phone_number");
		String diachi = request.getParameter("student_address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("hoten:" + hoten);
		System.out.println("email:" + email);
		System.out.println("gioitinh:" + gioitinh);
		System.out.println("SDT:" + sodienthoai);
		System.out.println("Dia chi:" + diachi);
		System.out.println("username:" + username);
		System.out.println("password:" + password);

		AccountDAO acBO = new AccountDAO();
		KhachHangBO khBO = new KhachHangBO();
		String id = khBO.sinhMaKH();
		System.out.println(id);
		Account ac = new Account();
		ac.setId(id);
		ac.setUsername(username);
		ac.setPassword(password);
		ac.setRole("1");
		ac.setStatus("1");
		ac.setAccountType("1");
		System.out.println(ac.toString());
		acBO.insertAccount(ac);
		KhachHang kh = new KhachHang(id, hoten, email, gioitinh, sodienthoai, diachi);
		System.out.println(kh.toString());
		khBO.insertCustomer(kh);
		/* response.sendRedirect(request.getContextPath() + "/LoginUserServlet"); */

		response.sendRedirect(request.getContextPath() + "/ListCustomer");

	}

}
