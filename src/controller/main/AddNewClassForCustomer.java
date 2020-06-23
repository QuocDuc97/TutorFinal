package controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.LevelBO;
import model.BO.LopBO;
import model.BO.MonHocBO;
import model.Bean.Lop;

/**
 * Servlet implementation class AddNewClassForCustomer
 */
@WebServlet("/AddNewClassForCustomer")
public class AddNewClassForCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewClassForCustomer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * // TODO Auto-generated method stub
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
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
		String tenL = request.getParameter("tenLop");
		String monHoc = request.getParameter("monHoc");
		String capDo = request.getParameter("capDo");
		String moTa = request.getParameter("moTa");
		String diaChi = request.getParameter("diaChi");
		String hocPhi = request.getParameter("hocPhi");
		String yeuCau = request.getParameter("yeuCau");
		String id = request.getParameter("id");
		System.out.println("tenL:" + tenL);
		System.out.println("monHoc:" + monHoc);
		System.out.println("CapDo:" + capDo);
		System.out.println("moTa:" + moTa);
		System.out.println("diaChi" + diaChi);
		System.out.println("hocPhi" + hocPhi);
		System.out.println("yeu Cau" + yeuCau);
		MonHocBO mh = new MonHocBO();
		LevelBO lv = new LevelBO();
		LopBO lopBO = new LopBO();
		Lop class1 = new Lop();
		String idClass = lopBO.sinhMaLop();
		class1.setIdL(idClass);
		class1.setTenL(tenL);
		class1.setMonHoc(mh.findMonHoc(monHoc));
		class1.setCapDo(lv.findLevel(capDo));
		class1.setTrangThai("1");
		class1.setMoTa(moTa);
		class1.setDiaChi(diaChi);
		class1.setHocPhi(hocPhi);
		class1.setYeuCau(yeuCau);
		lopBO.insertClass(class1);
		lopBO.insertClassDiary(idClass, id, java.time.LocalDate.now());
		response.sendRedirect(request.getContextPath() + "/home");
	}

}
