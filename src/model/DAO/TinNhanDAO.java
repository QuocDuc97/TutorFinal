package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import model.Bean.TinNhan;

public class TinNhanDAO {
	public void insertMessenger(String idGui, String idNhan, LocalTime time, LocalDate date, String noiDung,
			String trangThai) {
		String sql = String.format("insert into TinNhan VALUES('%s','%s','%s','%s',N'%s','%s')", idGui, idNhan, date,
				time, noiDung, trangThai);
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.executeUpdate();
			System.out.println("insert applyClass");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<TinNhan> getListMessenger(String id) {
		ArrayList<TinNhan> list = new ArrayList<>();
		String sql = String.format("select * from TinNhan a where idNhan='%s'and a.trangThai=1", id);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					TinNhan m = new TinNhan();
					m.setIdGui(rs.getString("idGui"));
					m.setIdNhan(rs.getString("idNhan"));
					m.setNgayGui(rs.getString("ngayGui"));
					m.setThoiGianGui(rs.getString("thoiGianGui"));
					m.setNoiDung(rs.getString("noiDung"));
					m.setTrangThai(rs.getString("trangThai"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// đếm số bản ghi của theo id
	public int getRecordMessengerByid(String id) {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = String.format("select * from TinNhan c where c.idGS='%s'", id);
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
