package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.GiaSuBO;
import model.BO.MonHocBO;
import model.Bean.GiaSu;

/**
 * Servlet implementation class DetailTutor
 */
@WebServlet("/DetailTutor")
public class DetailTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailTutor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		System.out.println(id);
		GiaSuBO gsBO = new GiaSuBO();
		GiaSu gs = gsBO.findTutor(id);
		System.out.println(gs.toString());
		MonHocBO monBO = new MonHocBO();
		request.setAttribute("listMonHocbyTutor", monBO.getlistMonHocByTutor(id));
		request.setAttribute("giaSu", gs);
		request.getServletContext().getRequestDispatcher("/WEB-INF/tutor/chiTietGS.jsp").forward(request, response);
		/*
		 * RequestDispatcher dispatcher =
		 * request.getServletContext().getRequestDispatcher(
		 * "/WEB-INF/tutor/chiTietGS.jsp"); dispatcher.forward(request, response);
		 */
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
