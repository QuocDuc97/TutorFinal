package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.NhomMH;

public class NhomMHDAO {
	public NhomMH nhomMH;

	public void insertNhomMH(NhomMH khachHang) {
		String sql = "insert into NhomMH VALUES(?,?)";
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.setString(1, khachHang.getIdN());
			pr.setString(2, khachHang.getTenN());
			pr.executeUpdate();
			System.out.println();
			System.out.println("thanh cong roif");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String sinhMaNhomMH() {
		String maGS = "NM" + DatabaseConnect.sinhMa("id_nhom", "NhomMH");
		return maGS;
	}

	public NhomMH nhomMH() {
		return nhomMH;
	}

	public ArrayList<NhomMH> listNhomMH() {
		ArrayList<NhomMH> list = new ArrayList<>();
		String sql = "select * from NhomMH";
		DatabaseConnect.getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					String id = rs.getString("id_nhom");
					String hoTen = rs.getString("tennhom");
					NhomMH nhomMH1 = new NhomMH(id, hoTen);
					list.add(nhomMH1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public NhomMH findNhomMH(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from NhomMH a where a.id_nhom=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id_nhom");
				String hoTen = rs.getString("tennhom");

				NhomMH gs = new NhomMH(id, hoTen);
				return gs;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateNhomMH(NhomMH gs, String id) {
		DatabaseConnect.getConnect();
		String sql = "UPDATE NhomMH SET [tennhom] = ? where id_nhom='" + id + "'";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, gs.getTenN());
			System.out.println(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteNhomMH(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete From NhomMH where id_nhom= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
