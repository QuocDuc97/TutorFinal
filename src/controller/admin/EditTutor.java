package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
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
import model.Bean.GiaSu;

@WebServlet("/EditTutor")
public class EditTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code;
	GiaSuBO gsBO = new GiaSuBO();
	GiaSu giasu = null;

	public EditTutor() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		code = (String) request.getParameter("idGS_id");
		System.out.println(code);
		String errorString = null;

		try {
			giasu = gsBO.findTutor(code);
		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		if (errorString != null && giasu == null) {
			response.sendRedirect(request.getServletPath() + "/listTutor");
			return;
		}
		System.out.println(giasu.toString());
		request.setAttribute("errorString", errorString);
		request.setAttribute("listTutorEdit", giasu);
		request.getServletContext().getRequestDispatcher("/WEB-INF/tutor/editTutor.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("html/text");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		GiaSu tutor = new GiaSu();

		try {
			List<FileItem> fields = upload.parseRequest(request);
			for (FileItem fileItem : fields) {
				if (fileItem.getFieldName().equals("id")) {
					tutor.setIdGS(fileItem.getString());
					System.out.println(fileItem.getString());
				} else if (fileItem.getFieldName().equals("usename")) {
					String hoten = (new String(fileItem.getString().getBytes("iso-8859-1"), "UTF-8"));
					System.out.println("họ tên là " + hoten);
					tutor.setHotenGS(hoten);
					System.out.println(fileItem.getString());
				} else if (fileItem.getFieldName().equals("email")) {
					tutor.setEmailGS(fileItem.getString());
					System.out.println(fileItem.getString());
				} else if (fileItem.getFieldName().equals("gender")) {
					tutor.setGioiTinhGS(fileItem.getString());
					System.out.println(fileItem.getString());
				} else if (fileItem.getFieldName().equals("photo")) {
					if (fileItem.getSize() > 0) {
						String originalFileName = fileItem.getName();
						int index = originalFileName.lastIndexOf(".");
						String ext = originalFileName.substring(index + 1);
						String fileName = System.currentTimeMillis() + "." + ext;
						File file = new File("F:\\upload" + "/" + fileName);
						fileItem.write(file);
						tutor.setImageGS(fileName);
					} else {
						tutor.setImageGS(giasu.getImageGS());
					}
				} else if (fileItem.getFieldName().equals("phonenumber")) {
					tutor.setSoDienThoaiGS(fileItem.getString());
				} else if (fileItem.getFieldName().equals("address")) {
					tutor.setDiaChiGS(fileItem.getString());
					System.out.println(fileItem.getString());
				} else if (fileItem.getFieldName().equals("nghenghiep")) {
					tutor.setNgheNghiepGS(fileItem.getString());
				}
			}
			System.out.println(tutor.toString());
			gsBO.updateTutor(tutor);
			response.sendRedirect(request.getContextPath() + "/ListTutor");
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
