package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.LevelBO;
import model.Bean.Level;

/**
 * Servlet implementation class DeleteLevel
 */
@WebServlet("/DeleteLevel")
public class DeleteLevel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteLevel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = (String) request.getParameter("idLevel_id");

		Level level = null;

		String errorString = null;
		LevelBO levelBO = new LevelBO();

		try {
			level = levelBO.findLevel(code);
			if (level != null) {
				levelBO.deleteLevel(code);
				response.sendRedirect(request.getContextPath()+"/ListLevel");
			} else {
				response.sendRedirect(request.getContextPath()+"/ListLevel");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
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
