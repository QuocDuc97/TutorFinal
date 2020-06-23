package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckEmail {
	public boolean checkEmail(String email) {
		String emailPattern = "^[\\w!#$%&’*+/=?`{|}~^-]+(?:\\.[\\w!#$%&’*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
		Pattern regex = Pattern.compile(emailPattern);
		Matcher matcher = regex.matcher(email);
		if (matcher.find()) {
			return true;
		} else {
			return false;
		}
	}

}
