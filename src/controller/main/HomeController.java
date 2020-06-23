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

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		MonHocBO monBO = new MonHocBO();
		LevelBO levelBO = new LevelBO();
		LopBO lopBO = new LopBO();
		request.setAttribute("monhoc1", monBO.listMonHoc());
		request.setAttribute("level1", levelBO.listLevel());
		int noOfRecords = lopBO.getNoOfRecords();
		System.out.println(noOfRecords);
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		System.out.println("noOfPages" + noOfPages);
		request.setAttribute("currentPage", page);
		request.setAttribute("listClass", lopBO.getListClassNotReceive((page - 1) * recordsPerPage, recordsPerPage));
		request.setAttribute("noOfPages", noOfPages);
		request.getRequestDispatcher("/WEB-INF/page/index1.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
