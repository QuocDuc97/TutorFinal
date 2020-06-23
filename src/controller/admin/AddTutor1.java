package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.BO.GiaSuBO;
import model.Bean.Account;
import model.Bean.GiaSu;
import model.DAO.AccountDAO;

/**
 * Servlet implementation class AddTutor1
 */
@WebServlet("/AddTutor1")
public class AddTutor1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTutor1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("html/text");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("đã vào");
//		kiem tra form da co kieu multipart
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent) {
			return;
		}
		GiaSu giaSu = new GiaSu();
		Account ac = new Account();
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {

			List<FileItem> fields = upload.parseRequest(request);
			for (FileItem fileItem : fields) {
				request.setCharacterEncoding("UTF-8");
				if (fileItem.getFieldName().equals("full-name")) {
					String hoten = fileItem.getString();
					System.out.println(hoten);
					giaSu.setHotenGS(new String(fileItem.getString().getBytes("iso-8859-1"), "UTF-8"));
				} else if (fileItem.getFieldName().equals("email-address")) {
					giaSu.setEmailGS(fileItem.getString());
				} else if (fileItem.getFieldName().equals("gender")) {
					giaSu.setGioiTinhGS(fileItem.getString());
				} else if (fileItem.getFieldName().equals("photo")) {
					final String dir = "F:\\upload";
					String originalFileName = fileItem.getName();
					int index = originalFileName.lastIndexOf(".");
					String ext = originalFileName.substring(index + 1);
					String fileName = System.currentTimeMillis() + "." + ext;
					File file = new File(dir + "/" + fileName);
					fileItem.write(file);
					giaSu.setImageGS(fileName);

				} else if (fileItem.getFieldName().equals("phone_number")) {
					giaSu.setSoDienThoaiGS(fileItem.getString());
				} else if (fileItem.getFieldName().equals("student_address")) {
					giaSu.setDiaChiGS(new String(fileItem.getString().getBytes("iso-8859-1"), "UTF-8"));
				} else if (fileItem.getFieldName().equals("nghenghiep")) {
					giaSu.setNgheNghiepGS(new String(fileItem.getString().getBytes("iso-8859-1"), "UTF-8"));
				} else if (fileItem.getFieldName().equals("hocPhi")) {
					giaSu.setPrice(fileItem.getString());
				} else if (fileItem.getFieldName().equals("username")) {
					ac.setUsername(fileItem.getString());
				} else if (fileItem.getFieldName().equals("password")) {
					ac.setPassword(fileItem.getString());
				} else if (fileItem.getFieldName().equals("moTa")) {
					giaSu.setMoTa(new String(fileItem.getString().getBytes("iso-8859-1"), "UTF-8"));
				}
			}
			GiaSuBO gsBO = new GiaSuBO();
			AccountDAO acBO = new AccountDAO();
			String idGS = gsBO.sinhMaGS();
			giaSu.setIdGS(idGS);

			System.out.println("gia su" + giaSu.toString());

			gsBO.insertTutor(giaSu);
			ac.setId(idGS);
			ac.setRole("1");
			ac.setStatus("1");
			ac.setAccountType("2");
			acBO.insertAccount(ac);
			response.sendRedirect(request.getContextPath() + "/ListTutor");

		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
