package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.GiaSu;

public class GiaSuDAO {
	public GiaSu gs;

	public void insertTutor(GiaSu kh) {
		/*
		 * String sql = "insert into GiaSu VALUES(?,?,?,?,?,?,?,?,?,?)";
		 */
		String sql = String.format("insert into GiaSu VALUES('%s',N'%s',N'%s',N'%s','%s','%s',N'%s',N'%s','%s',N'%s')",
				kh.getIdGS(), kh.getHotenGS(), kh.getGioiTinhGS(), kh.getEmailGS(), kh.getImageGS(),
				kh.getSoDienThoaiGS(), kh.getNgheNghiepGS(), kh.getDiaChiGS(), kh.getPrice(), kh.getMoTa());
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			/*
			 * pr.setString(1, khachHang.getIdGS()); pr.setString(2,
			 * khachHang.getHotenGS()); pr.setString(3, khachHang.getGioiTinhGS());
			 * pr.setString(4, khachHang.getEmailGS()); pr.setString(5,
			 * khachHang.getImageGS()); pr.setString(6, khachHang.getSoDienThoaiGS());
			 * pr.setString(7, khachHang.getDiaChiGS()); pr.setDouble(8,
			 * Double.parseDouble(khachHang.getPrice())); pr.setString(9,
			 * khachHang.getNgheNghiepGS()); pr.setString(10, khachHang.getMoTa());
			 */
			pr.executeUpdate();
			System.out.println(sql);
			System.out.println("thanh cong roif");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String sinhMaGS() {
		String maGS = "GS" + DatabaseConnect.sinhMa("idGS", "GiaSu");
		return maGS;
	}

	public GiaSu giaSu() {
		return gs;
	}

	public ArrayList<GiaSu> listTutor(int start, int total) {
		ArrayList<GiaSu> list = new ArrayList<>();
		String sql = String.format(
				"select * from GiaSu order by idGS" + " OFFSET  %s ROWS " + " FETCH NEXT %s ROWS ONLY ", start, total);
		DatabaseConnect.getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					String id = rs.getString("idGS");
					String hoTen = rs.getString("hoten");
					String email = rs.getString("email");
					String gioitinh = rs.getString("gioitinh");
					String image = rs.getString("image");
//					image=image.substring(image.lastIndexOf("\\"));
//					System.out.println(image);
					String sdt = rs.getString("sodienthoai");
					String address = rs.getString("diachi");
					String price = rs.getString("hocphi");
					String nghenghiep = rs.getString("nghenghiep");
					String moTa = rs.getString("moTa");
					GiaSu gs1 = new GiaSu(id, hoTen, gioitinh, email, image, sdt, address, nghenghiep, price, moTa);
					list.add(gs1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public GiaSu findTutor(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from GiaSu a where a.idGS=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				String id = rs.getString("idGS");
				String hoTen = rs.getString("hoten");
				String email = rs.getString("email");
				String gioitinh = rs.getString("gioitinh");
				String image = rs.getString("image");
				String sdt = rs.getString("sodienthoai");
				String address = rs.getString("diachi");
				String nghenghiep = rs.getString("nghenghiep");
				String price = rs.getString("hocphi");
				String moTa = rs.getString("moTa");
				GiaSu gs = new GiaSu(id, hoTen, gioitinh, email, image, sdt, address, nghenghiep, price, moTa);
				return gs;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateTutor(GiaSu gs) {
		DatabaseConnect.getConnect();
		String sql = String.format(
				"UPDATE GiaSu SET [hoten] = N'%s',[gioitinh] = N'%s',"
						+ "[email] = N'%s',[image] = N'%s',[sodienthoai] = N'%s' ,"
						+ "[diachi] = N'%s' ,[nghenghiep] = N'%s',[moTa] = N'%s' where idGS='%s'",
				gs.getHotenGS(), gs.getGioiTinhGS(), gs.getEmailGS(), gs.getImageGS(), gs.getSoDienThoaiGS(),
				gs.getDiaChiGS(), gs.getNgheNghiepGS(), gs.getMoTa(), gs.getIdGS());
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			/*
			 * pstm.setString(1, gs.getHotenGS()); pstm.setString(2, gs.getGioiTinhGS());
			 * pstm.setString(3, gs.getEmailGS()); pstm.setString(4, gs.getImageGS());
			 * pstm.setString(5, gs.getSoDienThoaiGS()); pstm.setString(6,
			 * gs.getDiaChiGS()); pstm.setString(7, gs.getNgheNghiepGS()); pstm.setString(8,
			 * gs.getIdGS()); System.out.println(pstm);
			 */
			System.out.println(sql);
			pstm.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteTutor(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete From GiaSu where idGS= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<GiaSu> searchBySubject(String code) {
		ArrayList<GiaSu> list = new ArrayList<>();
		String sql = "select * from GiaSu a join GiaSu_MH b on a.idGS=b.idGS where b.id_mon=?";
		DatabaseConnect.getConnect();
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {

				String id = rs.getString("idGS");
				String hoTen = rs.getString("hoten");
				String email = rs.getString("email");
				String gioitinh = rs.getString("gioitinh");
				String image = rs.getString("image");
				String sdt = rs.getString("sodienthoai");
				String address = rs.getString("diachi");
				String nghenghiep = rs.getString("nghenghiep");
				String price = rs.getString("hocphi");
				String moTa = rs.getString("moTa");
				GiaSu gs = new GiaSu(id, hoTen, gioitinh, email, image, sdt, address, nghenghiep, price, moTa);
				list.add(gs);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;

	}

	public ArrayList<GiaSu> searchByGender(String code) {
		ArrayList<GiaSu> list = new ArrayList<>();
		String sql = "select * from GiaSu where gioitinh=?";
		DatabaseConnect.getConnect();
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {

				String id = rs.getString("idGS");
				String hoTen = rs.getString("hoten");
				String email = rs.getString("email");
				String gioitinh = rs.getString("gioitinh");
				String image = rs.getString("image");
				String sdt = rs.getString("sodienthoai");
				String address = rs.getString("diachi");
				String nghenghiep = rs.getString("nghenghiep");
				String price = rs.getString("hocphi");
				String moTa = rs.getString("moTa");
				GiaSu gs = new GiaSu(id, hoTen, gioitinh, email, image, sdt, address, nghenghiep, price, moTa);
				list.add(gs);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;

	}

	public int getNoOfRecordsTutor() {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = "select * from GiaSu";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;

	}

}
