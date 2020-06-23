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

import model.BO.KhachHangBO;
import model.Bean.KhachHang;

@WebServlet("/ListCustomer")
public class ListCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListCustomer() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String errorString = null;
		String notification = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {
			List<KhachHang> listKH = null;
			KhachHangBO khBO = new KhachHangBO();
			listKH = khBO.listCustomer();
			if (listKH != null) {
				request.setAttribute("listCustomer", listKH);
				notification = "load du lieu thanh cong";
				request.setAttribute("notification", notification);
				request.getServletContext().getRequestDispatcher("/WEB-INF/admin/khachHang.jsp").forward(request,
						response);

			} else {
				errorString = "khong co du lieu de hien thi";
				request.setAttribute("error", errorString);
				System.out.println("list khach hang null roi may aj");
				RequestDispatcher dispatcher = request.getServletContext()
						.getRequestDispatcher("/WEB-INF/admin/listCustomer.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
