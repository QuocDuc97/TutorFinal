package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.MonHoc;
import model.Bean.NhomMH;

public class MonHocDAO {
	public MonHoc monHoc;
	NhomMHDAO mh = new NhomMHDAO();

	public void insertMonHoc(MonHoc khachHang) {
		String sql = "insert into MonHoc VALUES(?,?,?)";
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.setString(1, khachHang.getIdMH());
			pr.setString(2, khachHang.getTenMH());
			pr.setString(3, khachHang.getNhomMH().getIdN());
			pr.executeUpdate();
			System.out.println("thanh cong roi mon h�?c ròi nhé hahaha");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String sinhMaMonHoc() {
		String maMon = "MH" + DatabaseConnect.sinhMa("id_mon", "MonHoc");
		return maMon;
	}

	public MonHoc monHoc() {
		return monHoc;
	}

	public ArrayList<MonHoc> listMonHoc() {
		ArrayList<MonHoc> list = new ArrayList<>();
		String sql = "select * from MonHoc a join NhomMH b on a.id_nhom=b.id_nhom";
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					MonHoc m = new MonHoc();
					m.setIdMH(rs.getString("id_mon"));
					m.setTenMH(rs.getString("tenmon"));
					m.setNhomMH(new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom")));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<MonHoc> listMonHocByTutor(String id) {
		ArrayList<MonHoc> list = new ArrayList<>();
		String sql = String.format(
				"select * from MonHoc a join NhomMH b on a.id_nhom= b.id_nhom  where id_mon  not in (select id_mon from GiaSu_MH where idGS='%s')",
				id);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					MonHoc m = new MonHoc();
					m.setIdMH(rs.getString("id_mon"));
					m.setTenMH(rs.getString("tenmon"));
					m.setNhomMH(new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom")));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/// lay danh sach mon học cua tung gia su
	public ArrayList<MonHoc> getlistMonHocByTutor(String id) {
		ArrayList<MonHoc> list = new ArrayList<>();
		String sql = String.format(
				"select * from MonHoc a join NhomMH b on a.id_nhom= b.id_nhom  where id_mon  in (select id_mon from GiaSu_MH where idGS='%s')",
				id);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					MonHoc m = new MonHoc();
					m.setIdMH(rs.getString("id_mon"));
					m.setTenMH(rs.getString("tenmon"));
					m.setNhomMH(new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom")));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public MonHoc findMonHoc(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from MonHoc a where a.id_mon=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id_mon");
				String hoTen = rs.getString("tenmon");
				NhomMH nMH = mh.findNhomMH(rs.getString("id_nhom"));
				MonHoc gs = new MonHoc(id, hoTen, nMH);
				return gs;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateMonHoc(String idMH, String idNhom, String tenMon) {
		DatabaseConnect.getConnect();
		String sql = String.format("UPDATE MonHoc SET [tenmon] = N'%s',id_nhom='%s' where id_mon='%s'", tenMon, idNhom,
				idMH);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteMonHoc(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete From MonHoc where id_mon= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<MonHoc> listMonHocByTutor(String idTutor, int start, int total) {
		ArrayList<MonHoc> list = new ArrayList<>();
		String sql = String.format(
				"select * from MonHoc a join NhomMH b on a.id_nhom=b.id_nhom join GiaSu_MH c on c.id_mon=a.id_mon where c.idGS='%s' order by tenmon OFFSET  %s ROWS FETCH NEXT %s ROWS ONLY ",
				idTutor, start, total);
		System.out.println(sql);
		DatabaseConnect.getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					MonHoc m = new MonHoc();
					m.setIdMH(rs.getString("id_mon"));
					m.setTenMH(rs.getString("tenmon"));
					m.setNhomMH(new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom")));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// lay danh sach so ban day cac mon theo tung gia su
	public int getNoOfRecordsByTutor(String idTutor) {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = String.format(
				"select * from MonHoc a join NhomMH b on a.id_nhom=b.id_nhom join GiaSu_MH c on c.id_mon=a.id_mon where c.idGS='%s'",
				idTutor);
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

	public void insertGS_Mh(String idMon, String idGS) {
		String sql = String.format("insert into GiaSu_MH VALUES('%s','%s')", idGS, idMon);
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.executeUpdate();
			System.out.println("insert vao bang GiaSu_MH");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
