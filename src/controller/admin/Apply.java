package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.LopBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.DAO.AccountDAO;

@WebServlet("/Apply")
public class Apply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Apply() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idClass = request.getParameter("idClass");
		String idGs = request.getParameter("idGs");
		System.out.println("id_lop" + idClass);
		System.out.println("id_Gs" + idGs);
		LopBO lopBO = new LopBO();
		AccountDAO accountBO = new AccountDAO();
		String idKH = lopBO.getIDKH(idClass);
		System.out.println(idKH);
		Account account = accountBO.findAccount(lopBO.getIDKH(idClass));
		TinNhanBO tnBO = new TinNhanBO();
		String noiDung = account.getUsername() + " đã đồng ý nhận lớp của bạn";
		String trangThai = "1";
		tnBO.insertMessenger(idGs, lopBO.getIDKH(idClass), java.time.LocalTime.now(), java.time.LocalDate.now(),
				noiDung, trangThai);
		lopBO.applyClass(idClass, idGs, java.time.LocalTime.now(), java.time.LocalDate.now());
		response.sendRedirect("LopTimGS");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
