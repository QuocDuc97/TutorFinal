package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.Account;
import util.MD5Hashing;

public class AccountDAO {
	public Account ac;

	public void insertAccount(Account account) {
		String sql = "insert into TaiKhoan VALUES(?,?,?,?,?,?)";
		DatabaseConnect.getConnect();
		account.setPassword(MD5Hashing.getMD5(account.getPassword()));
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.setString(1, account.getId());
			pr.setString(2, account.getUsername());
			pr.setString(3, account.getPassword());
			pr.setString(4, account.getRole());
			pr.setString(5, account.getStatus());
			pr.setString(6, account.getAccountType());
			pr.executeUpdate();
			System.out.println(sql);
			System.out.println("insert bang tai khoan thanh cong");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Account account() {
		return ac;
	}

	public ArrayList<Account> listAccount() {
		ArrayList<Account> list = new ArrayList<>();
		String sql = "select * from TaiKhoan order by role";
		DatabaseConnect.getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					String id = rs.getString("id");
					String username = rs.getString("username");
					String password = rs.getString("password");
					String role = rs.getString("role");
					String status = rs.getString("status");
					String accountType = rs.getString("accountType");
					Account acc = new Account(id, username, password, role, status, accountType);
					list.add(acc);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Account checkLogin(String username, String password) {
		Account user = get(username);
		if (user != null && MD5Hashing.getMD5(password).equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	public Account get(String username) {
		DatabaseConnect.getConnect();
		String sql = "SELECT * FROM [TaiKhoan] WHERE username = ? ";
		try {
			PreparedStatement ps = DatabaseConnect.conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Account user = new Account();

				user.setId(rs.getString("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				user.setAccountType(rs.getString("accountType"));
				return user;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Account findAccount(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from TaiKhoan a where a.id=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String role = rs.getString("role");
				String status = rs.getString("status");
				String accountType = rs.getString("accountType");
				Account acc = new Account(id, username, password, role, status, accountType);
				return acc;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateAccount(Account gs) {
		DatabaseConnect.getConnect();
		String sql = String.format(
				"UPDATE TaiKhoan SET [username] = N'%s',[password] = N'%s'," + "[role] = N'%s',[status] = N'%s' ,"
						+ "[LoaiTk] = N'%s' where id='%s'",
				gs.getUsername(), MD5Hashing.getMD5(gs.getPassword()), gs.getRole(), gs.getStatus(),
				gs.getAccountType(), gs.getId());
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println(sql);
			pstm.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void updateUsername(String username, String pass, String id) {
		DatabaseConnect.getConnect();
		pass = MD5Hashing.getMD5(pass);
		String sql = String.format("UPDATE TaiKhoan SET [username] = N'%s',[password] = '%s' where id='%s'", username,
				pass, id);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteAccount(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete GiaSu ,TaiKhoan  from GiaSu a join TaiKhoan b on a.idGS=b.id where id= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteAccountGS(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete KhachHang ,TaiKhoan  from KhachHang a join TaiKhoan b on a.idKH=b.id where id= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		AccountDAO ac = new AccountDAO();
		System.out.println(ac.checkLogin("Admin", "123").toString());
	}

}
