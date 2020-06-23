package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.util.ClassQueue;

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.Bean.Account;
import model.Bean.Lop;

/**
 * Servlet implementation class AddClass
 */
@WebServlet("/AddClass")
public class AddClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String id = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		id = request.getParameter("idGS");
		MonHocBO monBO = new MonHocBO();
		LevelBO levelBO = new LevelBO();
		request.setAttribute("listMonHoc", monBO.listMonHoc());
		request.setAttribute("listLevel", levelBO.listLevel());
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/admin/themMoiLop.jsp");
		dispatcher.forward(request, response);
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
		String tenL = request.getParameter("tenlop");
		String monHoc = request.getParameter("subject");
		String capDo = request.getParameter("level");
		String hocPhi = request.getParameter("hocPhi");
		String yeuCau = request.getParameter("yeuCau");
		String diaChi = request.getParameter("diaChi");
		String moTa = request.getParameter("moTa");
		System.out.println("tenL:" + tenL);
		System.out.println("monHoc:" + monHoc);
		System.out.println("CapDo:" + capDo);
		System.out.println("moTa:" + moTa);
		MonHocBO mh = new MonHocBO();
		LevelBO lv = new LevelBO();
		LopBO lopBO = new LopBO();
		Lop class1 = new Lop();
		class1.setIdL(lopBO.sinhMaLop());
		class1.setTenL(tenL);
		class1.setMonHoc(mh.findMonHoc(monHoc));
		class1.setCapDo(lv.findLevel(capDo));
		class1.setTrangThai("1");
		class1.setMoTa(moTa);
		class1.setDiaChi(diaChi);
		class1.setHocPhi(hocPhi);
		class1.setYeuCau(yeuCau);
		lopBO.insertClass(class1);
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			request.setAttribute("error", "Bạn chưa đăng nhập ");
			request.getRequestDispatcher("LoginUserServlet").forward(request, response);

		} else {
			Account u = (Account) session.getAttribute("account");
			request.setAttribute("username", u.getUsername());
			session.setAttribute("account", u);
			if (u.getId().startsWith("K")) {
				response.sendRedirect(request.getContextPath() + "/AddClassSugest?idGs=" + id + "&idKH=" + u.getId()
						+ "&idClass=" + class1.getIdL() + "");

			} else if (Integer.parseInt(u.getRole()) == 0) {
				response.sendRedirect(request.getContextPath() + "/ListClass");
			}
		}

	}

}
