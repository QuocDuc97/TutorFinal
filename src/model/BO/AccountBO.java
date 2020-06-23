package model.BO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.Account;
import model.DAO.AccountDAO;
import model.DAO.DatabaseConnect;

public class AccountBO {

	public AccountDAO acDAO;

	public void insertAccount(Account account) {
		acDAO.insertAccount(account);
	}

	public Account account() {
		return acDAO.account();
	}

	public ArrayList<Account> listAccount() {
		return acDAO.listAccount();
	}

	public Account findAccount(String code) {
		return acDAO.findAccount(code);
	}

	public void updateAccount(Account gs) {
		acDAO.updateAccount(gs);

	}

	public void deleteAccount(String code) {
		acDAO.deleteAccount(code);

	}

	public void deleteAccountGS(String code) {
		acDAO.deleteAccountGS(code);

	}

	public Account checkLogin(String username, String password) {
		return acDAO.checkLogin(username, password);
	}

	public Account get(String username) {
		return acDAO.get(username);
	}

}
