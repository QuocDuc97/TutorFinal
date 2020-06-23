package model.DAO;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class UploadFile {

	public static final String url = "D:\\JavaFPT\\Tutor\\WebContent";

	public static String upload(HttpServletRequest request,String fileName) {
////		String appPath = request.getServletContext().getRealPath("");
//		appPath = appPath.replace('\\', '/');
//		String fullSavePath = null;
//		if (appPath.endsWith("/")) {
//			fullSavePath = appPath + SAVE_DIRECTORY;
//		} else {
//			fullSavePath = appPath + "/" + SAVE_DIRECTORY;
//		}
//
//		// Táº¡o thÆ° má»¥c náº¿u nÃ³ khÃ´ng tá»“n táº¡i.
//		File fileSaveDir = new File(fullSavePath);
//		if (!fileSaveDir.exists()) {
//			fileSaveDir.mkdir();
//		}
//
//		// Danh má»¥c cÃ¡c pháº§n Ä‘Ã£ upload lÃªn (CÃ³ thá»ƒ lÃ  nhiá»�u file).
//		try {
//			for (Part part : request.getParts()) {
//				fileName = extractFileName(part);
//				if (fileName != null && fileName.length() > 0) {
//					String filePath = fullSavePath + File.separator + fileName;
//					System.out.println("Write attachment to file: " + filePath);
//					File file = new File(filePath);
//					if (file.exists()) {
//						file.delete();
//					}
//
//					// Ghi vÃ o file.
//					part.write(filePath);
//					System.out.println("ghi file thanh cong");
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (ServletException e) {
//			e.printStackTrace();
//		}
		String result = null;
		try {
			for (Part part : request.getParts()) {
				fileName = extractFileName(part);
				// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				result = getFolderUpload().getAbsolutePath() + File.separator + fileName;
				part.write(result);
				System.out.println("ghi file thanh cong");
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}

	public static String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	public static File getFolderUpload() {
		File folderUpload = new File(url + "/Uploads");
		if (!folderUpload.exists()) {
			folderUpload.mkdirs();
		}
		return folderUpload;
	}

}
