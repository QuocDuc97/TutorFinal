package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.KhachHang;

public class KhachHangDAO {
	public KhachHang kh;

	public void insertCustomer(KhachHang khachHang) {
		String sql = "insert into KhachHang VALUES(?,?,?,?,?,?)";
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.setString(1, khachHang.getIdKH());
			pr.setString(2, khachHang.getHoTen());
			pr.setString(3, khachHang.getEmail());
			pr.setString(4, khachHang.getGioiTinh());
			pr.setString(5, khachHang.getSoDienThoai());
			pr.setString(6, khachHang.getDiaChi());
			pr.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String sinhMaKH() {
		String maKH = "KH" + DatabaseConnect.sinhMa("idKH", "KhachHang");
		return maKH;
	}

	public KhachHang khachHang() {
		return kh;
	}

	public ArrayList<KhachHang> listCustomer() {
		ArrayList<KhachHang> list = new ArrayList<>();
		String sql = "select * from KhachHang";
		DatabaseConnect.getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					String id = rs.getString("idKH");
					String hoTen = rs.getString("hoten");
					String email = rs.getString("email");
					String gioitinh = rs.getString("gioitinh");
					String sdt = rs.getString("sodienthoai");
					String address = rs.getString("diachi");
					KhachHang kh = new KhachHang(id, hoTen, email, gioitinh, sdt, address);
					list.add(kh);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public KhachHang findCustomer(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from KhachHang a where a.idKH=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				String id = rs.getString("idKH");
				String hoTen = rs.getString("hoten");
				String email = rs.getString("email");
				String gioitinh = rs.getString("gioitinh");
				String sdt = rs.getString("sodienthoai");
				String address = rs.getString("diachi");
				KhachHang kh = new KhachHang(id, hoTen, email, gioitinh, sdt, address);
				return kh;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateCustomer(KhachHang customer, String id) {
		DatabaseConnect.getConnect();
		String sql = "Update KhachHang set hoten =?,email=?, gioitinh=?,sodienthoai=?,diachi=? where idKH='" + id + "'";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, customer.getHoTen());
			pstm.setString(2, customer.getEmail());
			pstm.setString(3, customer.getGioiTinh());
			pstm.setString(4, customer.getSoDienThoai());
			pstm.setString(5, customer.getDiaChi());
			System.out.println(sql);
			System.out.println("thanh cong");
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteCustomer(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete From KhachHang where idKH= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
//	public static void main(String[] args) {
//		KhachHangDAO kh= new KhachHangDAO();
//		System.out.println(kh.sinhMaKH());
//	}

}
