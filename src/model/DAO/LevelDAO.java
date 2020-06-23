package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.Level;

public class LevelDAO {
	public Level lv;

	public void insertLevel(Level khachHang) {
		String sql = "insert into Level VALUES(?,?)";
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.setString(1, khachHang.getIdLevel());
			pr.setString(2, khachHang.getLevelName());
			pr.executeUpdate();
			System.out.println("insert level thanh cong roif");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String sinhMaLevel() {
		String maGS = "LV" + DatabaseConnect.sinhMa("idLevel", "Level");
		return maGS;
	}

	public Level level() {
		return lv;
	}

	public ArrayList<Level> listLevel() {
		ArrayList<Level> list = new ArrayList<>();
		String sql = "select * from Level";
		DatabaseConnect.getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					String id = rs.getString("idLevel");
					String name = rs.getString("LevelName");
					Level lv1 = new Level(id, name);
					list.add(lv1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Level findLevel(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from Level a where a.idLevel=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				String id = rs.getString("idLevel");
				String name = rs.getString("LevelName");
				Level level = new Level(id, name);
				return level;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateLevel(Level gs, String id) {
		DatabaseConnect.getConnect();
		String sql = "UPDATE Level SET [LevelName] = ? where idLevel='" + id + "'";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, gs.getLevelName());
			System.out.println(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteLevel(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete From Level where idLevel= ?";

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
