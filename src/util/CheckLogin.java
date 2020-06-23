package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CheckLogin {

	public static boolean checkSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("account") == null) {
			return false;
		}
		return true;
	}
	

}
