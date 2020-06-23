package controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO.KhachHangBO;
import model.Bean.KhachHang;
import model.DAO.KhachHangDAO;

/**
 * Servlet implementation class EditCustomerController
 */
@WebServlet("/editCustomerController1")
public class EditCustomerController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditCustomerController1() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		code = (String) request.getParameter("idKH_id");
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {
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
			request.setAttribute("errorString", errorString);
			request.setAttribute("listCustomerEdit", customer);

			request.getServletContext().getRequestDispatcher("/WEB-INF/admin/Customer/editCustomer.jsp")
					.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
		KhachHangDAO khBO = new KhachHangDAO();
		System.out.println("code :" + code);
		KhachHang kh = new KhachHang(code, hoten, email, gioitinh, sodienthoai, diachi);
		khBO.updateCustomer(kh, code);
		response.sendRedirect(request.getContextPath() + "/ListCustomer");

	}

}
