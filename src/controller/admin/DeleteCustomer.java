package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.KhachHangBO;
import model.Bean.KhachHang;

@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCustomer() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String code = (String) request.getParameter("idKH_id");

		KhachHang customer = null;

		String errorString = null;
		KhachHangBO khBO = new KhachHangBO();

		try {
			customer = khBO.findCustomer(code);
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		// Không có lỗi.
		// Sản phẩm không tồn tại để edit.
		// Redirect sang trang danh sách khach hang.
		if (errorString != null && customer == null) {
			response.sendRedirect(request.getServletPath() + "/ListCustomer");
			return;
		} else {
			khBO.deleteCustomer(code);
			response.sendRedirect(request.getContextPath() + "/ListCustomer");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
