package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.BO.TinNhanBO;
import model.Bean.Account;
import model.DAO.AccountDAO;

/**
 * Servlet implementation class AddClassSugest
 */
@WebServlet("/AddClassSugest")
public class AddClassSuggest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddClassSuggest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idClass = request.getParameter("idClass");
		String idGs = request.getParameter("idGs");
		String idKH = request.getParameter("idKH");
		System.out.println("id_lop" + idClass);
		System.out.println("id_Gs" + idGs);
		LopBO lopBO = new LopBO();
		AccountDAO accountBO = new AccountDAO();
		Account account = accountBO.findAccount(idKH);
		TinNhanBO tnBO = new TinNhanBO();
		String noiDung = account.getUsername() + " gửi lời đề nghị nhận bạn làm gia sư";
		String trangThai = "1";
		lopBO.insertClassDiary(idClass, idKH, java.time.LocalDate.now());
		tnBO.insertMessenger(idKH, idGs, java.time.LocalTime.now(), java.time.LocalDate.now(), noiDung, trangThai);
		lopBO.insertClassSeggest(idClass, idKH, idGs, java.time.LocalDate.now(), java.time.LocalTime.now());
		response.sendRedirect("LopTimGS");
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
