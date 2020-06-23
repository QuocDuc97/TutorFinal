package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnect {
	public static Connection conn;

	// ket noi database
	public static boolean getConnect() {
		String url = "jdbc:sqlserver://localhost:1433;databaseName=Tutor";
		String userName = "sa";
		String password = "123456";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, userName, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if (conn != null) {
			return true;

		} else {
			return false;
		}

	}

	public static void insertDatabase(String sqlcommand) {
		Statement st;
		try {
			getConnect();
			st = conn.createStatement();
			st.executeLargeUpdate(sqlcommand);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static ResultSet layDL(String tenbang, String sqlcommand) {
		getConnect();
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sqlcommand);
			rs = preparedStatement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// sinh ma tu dong
	public static int sinhMa(String tenTruong, String tenBang) {
		getConnect();
		String sql = String.format("SELECT MAX(CAST(SUBSTRING(%s,3,LEN(%s)-2)as int)) FROM %s", tenTruong, tenTruong,
				tenBang);
		int index = 1;
		ResultSet rs;
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				index++;
				return index;
			} else {
				while (rs.next()) {
					index = rs.getInt(1) + 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return index;
	}

}
